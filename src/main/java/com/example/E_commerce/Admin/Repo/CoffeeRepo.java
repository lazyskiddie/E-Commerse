package com.example.E_commerce.Admin.Repo;

import com.example.E_commerce.Coffee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CoffeeRepo extends JpaRepository<Coffee, Integer> {

}
