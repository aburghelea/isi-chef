package ro.isi.auth

import org.springframework.security.core.AuthenticationException
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler

import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

/**
 * User: Alexandru Burghelea
 * Date: 11/25/12
 * Time: 9:36 PM
 */
class AuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {
    private def defaultFailureUrl;

    public AuthenticationFailureHandler() {
    }

    public AuthenticationFailureHandler(String defaultFailureUrl) {
        setDefaultFailureUrl(defaultFailureUrl);
    }

    @Override
    void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) {

        def redirectUrl = null
        if (redirectUrl != null) {
            saveException(request, exception);
            logger.debug("Redirecting to " + redirectUrl);
            redirectStrategy.sendRedirect(request, response, redirectUrl);
        } else {
            super.onAuthenticationFailure(request, response, exception);
        }
    }

    public void setDefaultFailureUrl(def defaultFailureUrl) {
        this.defaultFailureUrl = defaultFailureUrl
    }
}
