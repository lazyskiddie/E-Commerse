package com.example.E_commerce;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class MySecurityConfg {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())

                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/admin/**").authenticated()
                        .anyRequest().permitAll()
                )

                .formLogin(form -> form
                        .loginPage("/login")
                        .loginProcessingUrl("/dologin")
                        .usernameParameter("username")
                        .passwordParameter("password")
                        .permitAll()
                )

                .exceptionHandling(exception -> exception
                        .accessDeniedPage("/unauthorized")
                );
        return http.build();
    }

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
