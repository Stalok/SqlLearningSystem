package org.derrick.sqllearningsystem.config;

import com.github.dockerjava.core.DefaultDockerClientConfig;
import com.github.dockerjava.core.DockerClientConfig;
import com.github.dockerjava.httpclient5.ApacheDockerHttpClient;
import com.github.dockerjava.transport.DockerHttpClient;
import org.derrick.sqllearningsystem.entity.ContainerInfo;
import org.derrick.sqllearningsystem.entity.PlayGroundSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.Duration;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Configuration
public class BeanConfig {
    @Bean
    public DockerClientConfig dockerClientConfig() {
        return DefaultDockerClientConfig.createDefaultConfigBuilder().build();
    }

    @Bean
    public DockerHttpClient dockerHttpClient(DockerClientConfig config) {
        return new ApacheDockerHttpClient.Builder()
                .dockerHost(config.getDockerHost())
                .sslConfig(config.getSSLConfig())
                .maxConnections(100)
                .connectionTimeout(Duration.ofSeconds(30))
                .responseTimeout(Duration.ofSeconds(45))
                .build();
    }

    @Bean
    public Map<String, PlayGroundSession> playGroundSessionMap() {
        return new HashMap<>();
    }

    @Bean
    public List<ContainerInfo> containerInfoList() {
        List<ContainerInfo> containerInfoList = new ArrayList<>();
        for (int i = 1; i <= 3; i++) {
            containerInfoList.add(new ContainerInfo("mysql-" + i, 5000 + i, true, null));
        }
//        containerInfoList.add(new ContainerInfo("mysql-1", 5001, true, null));
//        containerInfoList.add(new ContainerInfo("mysql-2", 5002, true, null));
//        containerInfoList.add(new ContainerInfo("mysql-3", 5003, true, null));
//        containerInfoList.add(new ContainerInfo("mysql-4", 5004, "ready", null));
//        containerInfoList.add(new ContainerInfo("mysql-5", 5005, "ready", null));
//        containerInfoList.add(new ContainerInfo("mysql-6", 5006, "ready", null));
//        containerInfoList.add(new ContainerInfo("mysql-7", 5007, "ready", null));
//        containerInfoList.add(new ContainerInfo("mysql-8", 5008, "ready", null));
//        containerInfoList.add(new ContainerInfo("mysql-9", 5009, "ready", null));
//        containerInfoList.add(new ContainerInfo("mysql-10", 5010, "ready", null));
        return containerInfoList;
    }
}
