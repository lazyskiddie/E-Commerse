package com.example.E_commerce.Admin.Service;

import com.example.E_commerce.Admin.Repo.UserRepository;
import com.example.E_commerce.AdminEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        Optional<AdminEntity> adminEntity = userRepository.findByUsername(username);
        AdminEntity admin = null;

        if (adminEntity.isPresent()) {
            admin = adminEntity.get();
        }else  {
            throw new UsernameNotFoundException(username);
        }

        UserDetails userDetails = User
                .builder()
                .username(admin.getUsername())
                .password(admin.getPassword())
                .build();
        return userDetails;
    }
}
