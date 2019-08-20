package com.datasus.controller;

import com.datasus.config.TokenProvider;
import com.datasus.mappers.UserMapper;
import com.datasus.model.AuthToken;
import com.datasus.model.User;
import com.datasus.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/token")
@CrossOrigin
public class AuthenticationController {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private TokenProvider jwtTokenUtil;

    @Autowired
    private UserService userService;

    @Autowired
    private UserMapper userMapper;

    @RequestMapping(value = "/generate-token", method = RequestMethod.POST)
    public ResponseEntity<?> register(@RequestBody User loginUser) throws AuthenticationException {

        final Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginUser.getUsername(),
                        loginUser.getPassword()
                )
        );

        User user = userMapper.findByUsername(authentication.getName());
        SecurityContextHolder.getContext().setAuthentication(authentication);
        final String token = jwtTokenUtil.generateToken(authentication);
        AuthToken auth = new AuthToken();
        user.setPassword("");
        auth.setToken(token);
        clearPasswordUsuario(user);
        auth.setUsuario(user);
        return ResponseEntity.ok(auth);
    }

    private User clearPasswordUsuario(User user){
        user.setPassword("");
        return user;
    }
}

