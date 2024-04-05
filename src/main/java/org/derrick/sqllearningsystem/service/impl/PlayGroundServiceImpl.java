package org.derrick.sqllearningsystem.service.impl;

import lombok.extern.slf4j.Slf4j;
import org.derrick.sqllearningsystem.entity.PlayGroundSession;
import org.derrick.sqllearningsystem.mapper.PlayGroundMapper;
import org.derrick.sqllearningsystem.service.PlayGroundService;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.net.ServerSocket;
import java.time.LocalDateTime;

@Slf4j
@Service
public class PlayGroundServiceImpl implements PlayGroundService {
    private final PlayGroundMapper playGroundMapper;

    public PlayGroundServiceImpl(PlayGroundMapper playGroundMapper) {
        this.playGroundMapper = playGroundMapper;
    }

    @Override
    public void newPlayGround(String username, Integer playgroundId) {

        RestTemplate restTemplate = new RestTemplate();


        // check if the port is already in use
        int port = 5001;
        boolean found = false;

        while (!found) {
            try {
                ServerSocket serverSocket = new ServerSocket(port);
                serverSocket.close();
                found = true;
            } catch (IOException e) {
                port++;
            }
        }

        // Send a GET request to the specified URL
        String containerId = restTemplate.getForObject("http://localhost:5000/docker/" + port, String.class);
        log.info("created playground for user: " + username + " with containerId: " + containerId + " and port: " + port);
        // System.out.println(containerId);

        // write the username, containerId to the database sql_session table
        playGroundMapper.newPlayGround(username, containerId, LocalDateTime.now().plusHours(1), port);
        log.info("inserted into database");
        // TODO: inject the default sql script to the container


    }

    /**
     * extend the expiry time of the playground by 15 minutes
     * @param username the username of the user
     */
    @Override
    public void ExtendPlayGround(String username) {
        // get the expiry time of the playground
        LocalDateTime expiryTime = playGroundMapper.getExpiryTime(username);
        // extend the expiry time by 15 minutes
        playGroundMapper.updateExpiryTime(username, expiryTime.plusMinutes(15));
    }

    /**
     * delete the playground of the user
     * @param username the username of the user
     */
    @Override
    public void deletePlayGround(String username) {
        // get the port number of the playground
        PlayGroundSession playGroundSession = playGroundMapper.getPlayGroundSession(username);
        // send a DELETE request to the port number
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.delete("http://localhost:5000/docker/" + playGroundSession.containerId());
        // delete the record from the database
        playGroundMapper.deletePlayGround(username);
    }
}
