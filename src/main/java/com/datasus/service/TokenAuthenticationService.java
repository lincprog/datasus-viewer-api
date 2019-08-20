package com.datasus.service;

import com.datasus.model.Authentication;
import com.google.gson.Gson;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TokenAuthenticationService {

    // EXPIRATION_TIME = 10 dias
    static final long EXPIRATION_TIME = 860_000_000;
    static final String SECRET = "OuvidoriaSesc";
    static final String TOKEN_PREFIX = "Bearer";
    static final String HEADER_STRING = "Authorization";

    public static void addAuthentication(HttpServletResponse response, org.springframework.security.core.Authentication authentication) throws IOException {

        List<String> roles =  new ArrayList<String>();
        roles.add("ROLE_ADMIN"); //TODO COLOCAR AQUI METODO QUE BUSCA AS ROLES DO USUARIO NO BANCO

        String JWTToken = Jwts.builder()
                .setSubject(authentication.getName())
                .claim("roles", roles)
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(SignatureAlgorithm.HS512, SECRET)
                .compact();

        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Gson gson = new Gson();

        Authentication autenticacao = new Authentication(JWTToken,authentication.getName(),roles);
        String autenticacaoJsonString = gson.toJson(autenticacao);
        out.print(autenticacaoJsonString);
        out.flush();

    }

    public static org.springframework.security.core.Authentication getAuthentication(HttpServletRequest request) {
        String token = request.getHeader(HEADER_STRING);

        if (token != null) {
            // faz parse do token
            String user = Jwts.parser()
                    .setSigningKey(SECRET)
                    .parseClaimsJws(token.replace(TOKEN_PREFIX, ""))
                    .getBody()
                    .getSubject();

            ArrayList<String> roles = getBody(token).get("roles", ArrayList.class);

            List<GrantedAuthority> grantedAuths = new ArrayList<>();
            for (String role : roles) {
                grantedAuths.add(new SimpleGrantedAuthority(role));
            }

//            }
            if (user != null) {
                return new UsernamePasswordAuthenticationToken(user, null, grantedAuths);
            }
        }
        return null;
    }

    private static Claims getBody(String token) {
        if (token != null) {
            try {
                Claims c = Jwts.parser()
                        .setSigningKey(SECRET)
                        .parseClaimsJws(token.replace(TOKEN_PREFIX, ""))
                        .getBody();

                return c;
            } catch (Exception exception) {
                return null;
            }
        }
        return null;
    }


//    @Override
//    public Authentication authenticate(Authentication auth){
//        Usuario user = userRepository.findByEmail(auth.getName());
//        if (user == null) {
//            throw new BadCredentialsException("User not found");
//        }
//        String password = (String) auth.getCredentials();
//        if (!new BCryptPasswordEncoder().matches(password, user.getContraseña())) {
//            throw new BadCredentialsException("Wrong password");
//        }
//
//        List<GrantedAuthority> roles = new ArrayList<>();
//        for (String role : user.getRol()) {
//            roles.add(new SimpleGrantedAuthority(role));
//        }
//        return new UsernamePasswordAuthenticationToken(user.getEmail(), password, roles);
//    }

}
