package com.mvc.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

// This class REPLACES web.xml completely
// Spring auto-detects it via ServletContainerInitializer
public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return null; // No root context needed for this app
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] { AppConfig.class }; // Points to our MVC config
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] { "/" }; // All requests go through DispatcherServlet
    }
}