package com.ingazgate.crm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
@ConfigurationPropertiesScan
public class IngazGateCrmApplication {
  public static void main(String[] args) {
    System.setProperty("java.awt.headless", "true");
    SpringApplication.run(IngazGateCrmApplication.class, args);
  }
}

