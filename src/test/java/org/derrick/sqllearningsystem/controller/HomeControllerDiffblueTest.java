package org.derrick.sqllearningsystem.controller;

import com.spotify.docker.client.DefaultDockerClient;
import com.spotify.docker.client.exceptions.DockerCertificateException;
import jakarta.servlet.http.HttpSession;

import java.security.Principal;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.mock;

@ContextConfiguration(classes = {HomeController.class})
@ExtendWith(SpringExtension.class)
class HomeControllerDiffblueTest {
    @Autowired
    private HomeController homeController;

    /**
     * Method under test: {@link HomeController#home(Principal, HttpSession)}
     */
    @Test
    @Disabled("TODO: Complete this test")
    void testHome() throws Exception {
        // TODO: Diffblue Cover was only able to create a partial test for this method:
        //   Diffblue AI was unable to find a test

        // Arrange
        // TODO: Populate arranged inputs
        MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/");
        MockMvc buildResult = MockMvcBuilders.standaloneSetup(homeController).build();

        // Act
        ResultActions actualPerformResult = buildResult.perform(requestBuilder);

        // Assert
        // TODO: Add assertions on result
    }


    @Test
    public void testHomePositive() {
        // Create mock Principal and HttpSession
        Principal principal = mock(Principal.class);
        Mockito.when(principal.getName()).thenReturn("John Doe");

        HttpSession session = mock(HttpSession.class);
        Mockito.when(session.getId()).thenReturn("123456");

        HomeController homeController = new HomeController();
        String result = homeController.home(principal, session);

        assertEquals("Welcome to SQL Learning System, John Doe!", result);
    }

    @Test
    public void testHomeNegative() throws DockerCertificateException {
        // Create mock Principal and HttpSession
        Principal principal = mock(Principal.class);
        Mockito.when(principal.getName()).thenReturn("John Doe");

        HttpSession session = mock(HttpSession.class);
        Mockito.when(session.getId()).thenReturn("123456");

        HomeController homeController = new HomeController();
        String result = homeController.home(principal, session);

        // Simulate Docker not running by throwing an exception
        Mockito.doThrow(new RuntimeException("Docker is not running")).when(DefaultDockerClient.fromEnv()).build();

        result = homeController.home(principal, session);

        assertEquals("Docker is not running", result);
    }
}
