package com.form.www.configure;


import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class LoginFilter  implements WebMvcConfigurer {


    @Bean
    public WebServerFactoryCustomizer containerCustomizer(){
        return new MyCustomizer();
    }
    private static class MyCustomizer implements WebServerFactoryCustomizer<ConfigurableServletWebServerFactory>  {
        @Override
        public void customize(ConfigurableServletWebServerFactory container) {
            container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND , "/404"));
            container.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR,"/500"));
        }
    }

    @Bean
    public javax.validation.Validator localValidatorFactoryBean() {
        return new LocalValidatorFactoryBean();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(new UserSecurityInterceptor()).addPathPatterns("/**","/pay/**","/ql/**");
//        registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/**").excludePathPatterns("/global/**","/front/anony/**","/back/anony/**","/resources/**","/images/**","/403/**","/404/**","/500/**","/audio/**","/share_img/**");
//        registry.addInterceptor(new AccessInterceptor()).addPathPatterns("/front/anony/signup");
    }

}