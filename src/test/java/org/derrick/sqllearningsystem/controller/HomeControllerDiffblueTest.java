package org.derrick.sqllearningsystem.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.derrick.sqllearningsystem.entity.LoginData;
import org.derrick.sqllearningsystem.entity.RegisterData;
import org.derrick.sqllearningsystem.service.CredentialService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.aot.DisabledInAotMode;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import static org.mockito.Mockito.doNothing;

@ContextConfiguration(classes = {HomeController.class})
@ExtendWith(SpringExtension.class)
@DisabledInAotMode
class HomeControllerDiffblueTest {
    @MockBean
    private CredentialService credentialService;

    @Autowired
    private HomeController homeController;

    /**
     * Method under test: {@link HomeController#home()}
     */
    @Test
    void testHome() throws Exception {
        // Arrange
        MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/");

        // Act and Assert
        MockMvcBuilders.standaloneSetup(homeController)
                .build()
                .perform(requestBuilder)
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.content().contentType("text/plain;charset=ISO-8859-1"))
                .andExpect(MockMvcResultMatchers.content().string("Welcome to SQL Learning System!"));
    }

    /**
     * Method under test: {@link HomeController#login(LoginData)}
     */
    @Test
    void testLogin() throws Exception {
        // Arrange
        doNothing().when(credentialService).login(Mockito.any(), Mockito.any());
        MockHttpServletRequestBuilder contentTypeResult = MockMvcRequestBuilders.post("/login")
                .contentType(MediaType.APPLICATION_JSON);

        ObjectMapper objectMapper = new ObjectMapper();
        MockHttpServletRequestBuilder requestBuilder = contentTypeResult
                .content(objectMapper.writeValueAsString(new LoginData("janedoe", "iloveyou")));

        // Act and Assert
        MockMvcBuilders.standaloneSetup(homeController)
                .build()
                .perform(requestBuilder)
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.content().contentType("text/plain;charset=ISO-8859-1"))
                .andExpect(MockMvcResultMatchers.content().string("Login successful"));
    }

    /**
     * Method under test: {@link HomeController#register(RegisterData)}
     */
    @Test
    void testRegister() throws Exception {
        // Arrange
        doNothing().when(credentialService).register(Mockito.any());
        MockHttpServletRequestBuilder contentTypeResult = MockMvcRequestBuilders.post("/register")
                .contentType(MediaType.APPLICATION_JSON);

        ObjectMapper objectMapper = new ObjectMapper();
        MockHttpServletRequestBuilder requestBuilder = contentTypeResult
                .content(objectMapper.writeValueAsString(new RegisterData("janedoe", "iloveyou", "jane.doe@example.org")));

        // Act and Assert
        MockMvcBuilders.standaloneSetup(homeController)
                .build()
                .perform(requestBuilder)
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.content().contentType("text/plain;charset=ISO-8859-1"))
                .andExpect(MockMvcResultMatchers.content().string("Register successful"));
    }

    /**
     * Method under test: {@link HomeController#home()}
     */
    @Test
    void testHome2() throws Exception {
        // Arrange
        MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/", "Uri Variables");

        // Act and Assert
        MockMvcBuilders.standaloneSetup(homeController)
                .build()
                .perform(requestBuilder)
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.content().contentType("text/plain;charset=ISO-8859-1"))
                .andExpect(MockMvcResultMatchers.content().string("Welcome to SQL Learning System!"));
    }
}
