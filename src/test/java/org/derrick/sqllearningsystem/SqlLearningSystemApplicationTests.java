package org.derrick.sqllearningsystem;

import com.spotify.docker.client.DefaultDockerClient;
import com.spotify.docker.client.DockerClient;
import com.spotify.docker.client.exceptions.DockerCertificateException;
import com.spotify.docker.client.exceptions.DockerException;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class SqlLearningSystemApplicationTests {

    @Test
    void contextLoads() {
    }

    @Test
    void testMain() {
        try (DockerClient docker = DefaultDockerClient.fromEnv().build()) {
                docker.ping();
        } catch (DockerCertificateException | DockerException | InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

}
