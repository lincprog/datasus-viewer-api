package com.datasus.service;

import com.datasus.mappers.UserMapper;
import com.datasus.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service(value = "userService")
public class UserService implements UserDetailsService {

        @Autowired
        private UserMapper userMapper;

        public User findUserByEmail(String email){
            return userMapper.findUserByEmail(email);
        }

        @Transactional(value = "transactionManager",propagation = Propagation.REQUIRES_NEW)
        public void save(User user) {
            userMapper.save(user);
        }


        public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
            User user = userMapper.findByUsername(username);
            if(user == null){
                throw new UsernameNotFoundException("Invalid username or password.");
            }
            return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), getAuthority(user));
        }

        private Set<SimpleGrantedAuthority> getAuthority(User user) {
            Set<SimpleGrantedAuthority> authorities = new HashSet<>();
            user.getRoles().forEach(role -> {
                //authorities.add(new SimpleGrantedAuthority(role.getName()));
                authorities.add(new SimpleGrantedAuthority(role.getName()));
            });
            return authorities;
            //return Arrays.asList(new SimpleGrantedAuthority("ROLE_ADMIN"));
        }

        public List<User> findAll() {
            List<User> list = new ArrayList<>();
//            userMapper.findByCnes().iterator().forEachRemaining(list::add);
            return list;
        }

}
