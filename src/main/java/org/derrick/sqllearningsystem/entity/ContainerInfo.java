package org.derrick.sqllearningsystem.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
public final class ContainerInfo {
    private String containerName;
    private Integer port;
    private Boolean is_available;
    private String username;
}
