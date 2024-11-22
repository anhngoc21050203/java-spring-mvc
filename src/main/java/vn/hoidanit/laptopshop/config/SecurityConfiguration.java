package vn.hoidanit.laptopshop.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class SecurityConfiguration {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // @Bean
    // public UserDetailsService userDetailsService(UserService userService) {
    // return new CustomUserDetailsService(userService);
    // }

    // @Bean
    // public AuthenticationManager authencationManager(HttpSecurity http,
    // PasswordEncoder passwordEncoder,
    // UserDetailsService userDetailsService) throws Exception {
    // AuthenticationManagerBuilder auth =
    // http.getSharedObject(AuthenticationManagerBuilder.class);
    // auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder);
    // return auth.build();
    // }

    @Bean
    public DaoAuthenticationProvider authenticationProvider(UserDetailsService userDetailsService,
            PasswordEncoder passwordEncoder) {
        DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
        provider.setUserDetailsService(userDetailsService);
        provider.setPasswordEncoder(passwordEncoder);
        // provider.setHideUserNotFoundExceptions(false);
        return provider;
    }

    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeHttpRequests(authorize -> authorize
                .dispatcherTypeMatchers(DispatcherType.FORWARD,
                        DispatcherType.INCLUDE)
                .permitAll()
                .requestMatchers("/", "/login", "/assets/**", "/images/**").permitAll()
                .anyRequest().authenticated())
                .formLogin(formLogin -> formLogin.loginPage("/login").failureUrl("/login?error").permitAll());
        return http.build();
    }

}
