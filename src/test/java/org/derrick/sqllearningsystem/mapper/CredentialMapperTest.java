package org.derrick.sqllearningsystem.mapper;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.dockerjava.core.DefaultDockerClientConfig;
import com.github.dockerjava.core.DockerClientConfig;
import com.github.dockerjava.httpclient5.ApacheDockerHttpClient;
import com.github.dockerjava.transport.DockerHttpClient;
import org.apache.commons.io.IOUtils;
import org.junit.jupiter.api.Test;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.time.Duration;


class CredentialMapperTest {

    @Test
    void getUserByUsername() {
        DockerClientConfig config = DefaultDockerClientConfig.createDefaultConfigBuilder().build();
        DockerHttpClient dockerHttpClient = new ApacheDockerHttpClient.Builder()
                .dockerHost(config.getDockerHost())
                .sslConfig(config.getSSLConfig())
                .maxConnections(100)
                .connectionTimeout(Duration.ofSeconds(30))
                .responseTimeout(Duration.ofSeconds(45))
                .build();

        DockerHttpClient.Request createContainerRequest = DockerHttpClient.Request.builder()
                .method(DockerHttpClient.Request.Method.POST)
                .path("/v1.44/containers/create")
                .putHeader("Content-Type", "application/json")
                .body(new ByteArrayInputStream(("{\"Image\":\"mysql:8.0.36-debian\",\"Env\":[\"MYSQL_ROOT_PASSWORD=123456\"],\"ExposedPorts\":{\"3306/tcp\":{}},\"HostConfig\":{\"PortBindings\":{\"3306/tcp\":[{\"HostPort\":\"" + 5001 + "\"}]}}}").getBytes()))
                .build();

        String containerId;
        try (DockerHttpClient.Response response = dockerHttpClient.execute(createContainerRequest)) {
            System.out.println(response.getStatusCode());
//            System.out.println(IOUtils.toString(response.getBody(), StandardCharsets.UTF_8));
            // get the container id
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(IOUtils.toString(response.getBody(), StandardCharsets.UTF_8));
            containerId = jsonNode.get("Id").asText();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        // start the container
        DockerHttpClient.Request startContainerRequest = DockerHttpClient.Request.builder()
                .method(DockerHttpClient.Request.Method.POST)
                .path("/v1.44/containers/" + containerId + "/start")
                .build();

        try (DockerHttpClient.Response response = dockerHttpClient.execute(startContainerRequest)) {
            System.out.println(response.getStatusCode());
            System.out.println(IOUtils.toString(response.getBody(), StandardCharsets.UTF_8));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}