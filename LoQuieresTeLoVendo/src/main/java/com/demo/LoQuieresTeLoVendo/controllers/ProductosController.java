package com.demo.LoQuieresTeLoVendo.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.demo.LoQuieresTeLoVendo.model.Productos;
import com.demo.LoQuieresTeLoVendo.repository.ProductosRepository;

@RestController
@RequestMapping("/productos")
public class ProductosController {
    
    @Autowired
    private ProductosRepository repo;

    @GetMapping
    public List<Productos> listar(){
        return repo.findAll();
    }
    
}
