package com.demo.LoQuieresTeLoVendo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.demo.LoQuieresTeLoVendo.model.Productos;

@Repository
public interface ProductosRepository extends JpaRepository<Productos, Long>{
    
}
