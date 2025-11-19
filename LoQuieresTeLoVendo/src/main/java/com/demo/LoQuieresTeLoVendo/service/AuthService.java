package com.demo.LoQuieresTeLoVendo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.LoQuieresTeLoVendo.exception.AuthException;
import com.demo.LoQuieresTeLoVendo.model.Usuarios;
import com.demo.LoQuieresTeLoVendo.repository.UsuariosRepository;
import com.demo.LoQuieresTeLoVendo.util.JwtUtil;

@Service
public class AuthService {

    @Autowired
    private UsuariosRepository usuariosRepository;

    @Autowired
    private JwtUtil jwtUtil;

    public String login(String correo, String clave) {
        if (correo == null || clave == null) {
            throw new AuthException("Correo y clave son obligatorios");
        }

        Usuarios user = usuariosRepository.findByCorreo(correo)
                .orElseThrow(() -> new AuthException("Usuario no encontrado"));

        if (!user.getClave().equals(clave)) {
            throw new AuthException("Credenciales incorrectas");
        }

        return jwtUtil.generateToken(user);
    }
}
