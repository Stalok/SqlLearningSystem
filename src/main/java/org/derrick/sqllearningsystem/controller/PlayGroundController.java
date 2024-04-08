package org.derrick.sqllearningsystem.controller;

import com.github.dockerjava.core.DockerClientConfig;
import com.github.dockerjava.httpclient5.ApacheDockerHttpClient;
import com.github.dockerjava.transport.DockerHttpClient;
import com.github.dockerjava.transport.DockerHttpClient.Request;
import com.github.dockerjava.transport.DockerHttpClient.Response;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.IOUtils;
import org.derrick.sqllearningsystem.service.PlayGroundService;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.Duration;

@RestController
@RequestMapping("/playground")
@RequiredArgsConstructor
public class PlayGroundController {

    private final PlayGroundService playGroundService;
    private final DockerClientConfig config;
    @PostMapping("/test")
    public String test() throws IOException {
        DockerHttpClient httpClient = new ApacheDockerHttpClient.Builder()
                .dockerHost(config.getDockerHost())
                .sslConfig(config.getSSLConfig())
                .maxConnections(100)
                .connectionTimeout(Duration.ofSeconds(30))
                .responseTimeout(Duration.ofSeconds(45))
                .build();

        Request request = Request.builder()
                .method(Request.Method.POST)
                .path("/v1.44/containers/945f3e4d436a242050d1c2f23d450533c752224c2464da94c175c6157ce81236/start")
                .build();

        try (Response response = httpClient.execute(request)) {
            System.out.println(response.getStatusCode());
            System.out.println(IOUtils.toString(response.getBody()));
        }

        request = Request.builder()
                .method(Request.Method.POST)
                .path("/v1.44/containers/945f3e4d436a242050d1c2f23d450533c752224c2464da94c175c6157ce81236/stop")
                .build();

        try (Response response = httpClient.execute(request)) {
            System.out.println(response.getStatusCode());
            System.out.println(IOUtils.toString(response.getBody()));
        }
        return "ok";
    }

    /**
     * Create a new playground with designated playground id
     * @param username username
     * @param playgroundId playground id
     * @return message
     */
    @GetMapping("/{username}/{playgroundId}")
    public String newPlayGround(@PathVariable String username, @PathVariable Integer playgroundId) throws Exception {
        playGroundService.newPlayGround(username, playgroundId);
        return "Playground created for " + username;
    }

    /**
     * Create a new playground with the progress of the last playground
     * @param username username
     * @return message
     */
    @GetMapping("/{username}")
    public String newPlayGround(@PathVariable String username) {
        playGroundService.newPlayGround(username);
        return "Playground created for " + username;
    }

    @GetMapping("/continue/{username}")
    public String forwardPlayGround(@PathVariable String username) {
        playGroundService.forwardPlayGround(username);
        return "Playground extended for " + username;
    }

    @DeleteMapping("/{username}")
    public String deletePlayGround(@PathVariable String username) {
        playGroundService.deletePlayGround(username);
        return "Playground deleted for " + username;
    }

}
