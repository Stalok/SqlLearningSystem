package org.derrick.sqllearningsystem.service.impl;

import org.derrick.sqllearningsystem.entity.RegisterData;
import org.derrick.sqllearningsystem.exception.UsernameExistedException;
import org.derrick.sqllearningsystem.mapper.CredentialMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.aot.DisabledInAotMode;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.*;

@ContextConfiguration(classes = {CredentialServiceImpl.class})
@ExtendWith(SpringExtension.class)
@DisabledInAotMode
class CredentialServiceImplDiffblueTest {
    @MockBean
    private CredentialMapper credentialMapper;

    @Autowired
    private CredentialServiceImpl credentialServiceImpl;

    /**
     * Method under test: {@link CredentialServiceImpl#login(String, String)}
     */
    @Test
    void testLogin() {
        // Arrange
        when(credentialMapper.countUsersByCredential(Mockito.any(), Mockito.any())).thenReturn(3);

        // Act and Assert
        assertThrows(IllegalStateException.class, () -> credentialServiceImpl.login("janedoe", "iloveyou"));
        verify(credentialMapper).countUsersByCredential(eq("janedoe"), eq("iloveyou"));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#login(String, String)}
     */
    @Test
    void testLogin2() {
        // Arrange
        doNothing().when(credentialMapper).updateLastLoginTime(Mockito.any());
        when(credentialMapper.countUsersByCredential(Mockito.any(), Mockito.any())).thenReturn(1);

        // Act
        credentialServiceImpl.login("janedoe", "iloveyou");

        // Assert that nothing has changed
        verify(credentialMapper).countUsersByCredential(eq("janedoe"), eq("iloveyou"));
        verify(credentialMapper).updateLastLoginTime(eq("janedoe"));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#login(String, String)}
     */
    @Test
    void testLogin3() {
        // Arrange
        when(credentialMapper.countUsersByCredential(Mockito.any(), Mockito.any())).thenReturn(0);

        // Act and Assert
        assertThrows(IllegalArgumentException.class, () -> credentialServiceImpl.login("janedoe", "iloveyou"));
        verify(credentialMapper).countUsersByCredential(eq("janedoe"), eq("iloveyou"));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#login(String, String)}
     */
    @Test
    void testLogin4() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class, () -> credentialServiceImpl.login(null, "iloveyou"));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#login(String, String)}
     */
    @Test
    void testLogin5() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class, () -> credentialServiceImpl.login("", "iloveyou"));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#login(String, String)}
     */
    @Test
    void testLogin6() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class, () -> credentialServiceImpl.login("janedoe", null));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#login(String, String)}
     */
    @Test
    void testLogin7() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class, () -> credentialServiceImpl.login("janedoe", ""));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#login(String, String)}
     */
    @Test
    void testLogin8() {
        // Arrange
        doThrow(new IllegalArgumentException("foo")).when(credentialMapper).updateLastLoginTime(Mockito.any());
        when(credentialMapper.countUsersByCredential(Mockito.any(), Mockito.any())).thenReturn(1);

        // Act and Assert
        assertThrows(IllegalArgumentException.class, () -> credentialServiceImpl.login("janedoe", "iloveyou"));
        verify(credentialMapper).countUsersByCredential(eq("janedoe"), eq("iloveyou"));
        verify(credentialMapper).updateLastLoginTime(eq("janedoe"));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#register(RegisterData)}
     */
    @Test
    void testRegister() {
        // Arrange
        when(credentialMapper.countUsersByUsername(Mockito.any())).thenReturn(3);

        // Act and Assert
        assertThrows(UsernameExistedException.class,
                () -> credentialServiceImpl.register(new RegisterData("janedoe", "iloveyou", "jane.doe@example.org")));
        verify(credentialMapper).countUsersByUsername(eq("janedoe"));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#register(RegisterData)}
     */
    @Test
    void testRegister2() {
        // Arrange
        when(credentialMapper.countUsersByUsername(Mockito.any())).thenReturn(0);
        doNothing().when(credentialMapper).register(Mockito.any(), Mockito.any(), Mockito.any());

        // Act
        credentialServiceImpl.register(new RegisterData("janedoe", "iloveyou", "jane.doe@example.org"));

        // Assert that nothing has changed
        verify(credentialMapper).countUsersByUsername(eq("janedoe"));
        verify(credentialMapper).register(eq("janedoe"), eq("iloveyou"), eq("jane.doe@example.org"));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#register(RegisterData)}
     */
    @Test
    void testRegister3() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class,
                () -> credentialServiceImpl.register(new RegisterData(null, "iloveyou", "jane.doe@example.org")));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#register(RegisterData)}
     */
    @Test
    void testRegister4() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class,
                () -> credentialServiceImpl.register(new RegisterData("", "iloveyou", "jane.doe@example.org")));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#register(RegisterData)}
     */
    @Test
    void testRegister5() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class,
                () -> credentialServiceImpl.register(new RegisterData("janedoe", null, "jane.doe@example.org")));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#register(RegisterData)}
     */
    @Test
    void testRegister6() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class,
                () -> credentialServiceImpl.register(new RegisterData("janedoe", "", "jane.doe@example.org")));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#register(RegisterData)}
     */
    @Test
    void testRegister7() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class,
                () -> credentialServiceImpl.register(new RegisterData("janedoe", "iloveyou", null)));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#register(RegisterData)}
     */
    @Test
    void testRegister8() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class,
                () -> credentialServiceImpl.register(new RegisterData("janedoe", "iloveyou", "")));
    }

    /**
     * Method under test: {@link CredentialServiceImpl#register(RegisterData)}
     */
    @Test
    void testRegister9() {
        // Arrange
        when(credentialMapper.countUsersByUsername(Mockito.any())).thenThrow(new UsernameExistedException());

        // Act and Assert
        assertThrows(UsernameExistedException.class,
                () -> credentialServiceImpl.register(new RegisterData("janedoe", "iloveyou", "jane.doe@example.org")));
        verify(credentialMapper).countUsersByUsername(eq("janedoe"));
    }

    /**
     * Method under test:
     * {@link CredentialServiceImpl#updatePassword(String, String, String)}
     */
    @Test
    void testUpdatePassword() {
        // Arrange
        doNothing().when(credentialMapper).updatePassword(Mockito.any(), Mockito.any());
        when(credentialMapper.countUsersByCredential(Mockito.any(), Mockito.any())).thenReturn(3);

        // Act
        credentialServiceImpl.updatePassword("janedoe", "iloveyou", "iloveyou");

        // Assert that nothing has changed
        verify(credentialMapper).countUsersByCredential(eq("janedoe"), eq("iloveyou"));
        verify(credentialMapper).updatePassword(eq("janedoe"), eq("iloveyou"));
    }

    /**
     * Method under test:
     * {@link CredentialServiceImpl#updatePassword(String, String, String)}
     */
    @Test
    void testUpdatePassword2() {
        // Arrange
        doThrow(new IllegalArgumentException("foo")).when(credentialMapper)
                .updatePassword(Mockito.any(), Mockito.any());
        when(credentialMapper.countUsersByCredential(Mockito.any(), Mockito.any())).thenReturn(3);

        // Act and Assert
        assertThrows(IllegalArgumentException.class,
                () -> credentialServiceImpl.updatePassword("janedoe", "iloveyou", "iloveyou"));
        verify(credentialMapper).countUsersByCredential(eq("janedoe"), eq("iloveyou"));
        verify(credentialMapper).updatePassword(eq("janedoe"), eq("iloveyou"));
    }

    /**
     * Method under test:
     * {@link CredentialServiceImpl#updatePassword(String, String, String)}
     */
    @Test
    void testUpdatePassword3() {
        // Arrange
        when(credentialMapper.countUsersByCredential(Mockito.any(), Mockito.any())).thenReturn(0);

        // Act and Assert
        assertThrows(IllegalArgumentException.class,
                () -> credentialServiceImpl.updatePassword("janedoe", "iloveyou", "iloveyou"));
        verify(credentialMapper).countUsersByCredential(eq("janedoe"), eq("iloveyou"));
    }

    /**
     * Method under test:
     * {@link CredentialServiceImpl#updatePassword(String, String, String)}
     */
    @Test
    void testUpdatePassword4() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class,
                () -> credentialServiceImpl.updatePassword(null, "iloveyou", "iloveyou"));
    }

    /**
     * Method under test:
     * {@link CredentialServiceImpl#updatePassword(String, String, String)}
     */
    @Test
    void testUpdatePassword5() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class,
                () -> credentialServiceImpl.updatePassword("", "iloveyou", "iloveyou"));
    }

    /**
     * Method under test:
     * {@link CredentialServiceImpl#updatePassword(String, String, String)}
     */
    @Test
    void testUpdatePassword6() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class,
                () -> credentialServiceImpl.updatePassword("janedoe", null, "iloveyou"));
    }

    /**
     * Method under test:
     * {@link CredentialServiceImpl#updatePassword(String, String, String)}
     */
    @Test
    void testUpdatePassword7() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class, () -> credentialServiceImpl.updatePassword("janedoe", "", "iloveyou"));
    }

    /**
     * Method under test:
     * {@link CredentialServiceImpl#updatePassword(String, String, String)}
     */
    @Test
    void testUpdatePassword8() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class,
                () -> credentialServiceImpl.updatePassword("janedoe", "iloveyou", null));
    }

    /**
     * Method under test:
     * {@link CredentialServiceImpl#updatePassword(String, String, String)}
     */
    @Test
    void testUpdatePassword9() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class,
                () -> credentialServiceImpl.updatePassword("janedoe", "iloveyou", "42"));
    }

    /**
     * Method under test:
     * {@link CredentialServiceImpl#updatePassword(String, String, String)}
     */
    @Test
    void testUpdatePassword10() {
        // Arrange, Act and Assert
        assertThrows(IllegalArgumentException.class, () -> credentialServiceImpl.updatePassword("janedoe", "iloveyou", ""));
    }
}
