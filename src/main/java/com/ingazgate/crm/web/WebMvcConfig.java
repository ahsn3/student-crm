package com.ingazgate.crm.web;

import java.util.concurrent.TimeUnit;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

  private final PageTitleMessageInterceptor pageTitleMessageInterceptor;

  public WebMvcConfig(PageTitleMessageInterceptor pageTitleMessageInterceptor) {
    this.pageTitleMessageInterceptor = pageTitleMessageInterceptor;
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(pageTitleMessageInterceptor);
  }

  @Override
  public void addResourceHandlers(ResourceHandlerRegistry registry) {
    CacheControl staticCache = CacheControl.maxAge(7, TimeUnit.DAYS).cachePublic();
    registry
        .addResourceHandler("/css/**", "/js/**", "/images/**", "/assets/**")
        .addResourceLocations(
            "classpath:/static/css/",
            "classpath:/static/js/",
            "classpath:/static/images/",
            "classpath:/static/assets/")
        .setCacheControl(staticCache);
  }
}
