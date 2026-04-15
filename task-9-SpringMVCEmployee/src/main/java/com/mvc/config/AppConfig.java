package com.mvc.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration          // Marks as Spring configuration class
@EnableWebMvc           // Enables Spring MVC annotation support
@ComponentScan("com.mvc") // Scans for @Controller, @Service, @Component
public class AppConfig implements WebMvcConfigurer {

    // Configures JSP View Resolver — no XML needed!
    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");  // JSP folder location
        resolver.setSuffix(".jsp");              // File extension
        return resolver;
    }
}