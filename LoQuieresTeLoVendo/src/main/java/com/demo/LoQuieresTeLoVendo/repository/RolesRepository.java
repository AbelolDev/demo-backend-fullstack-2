package com.demo.LoQuieresTeLoVendo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.demo.LoQuieresTeLoVendo.model.Roles;

@Repository
public interface RolesRepository extends JpaRepository<Roles, Long>{
    
}
