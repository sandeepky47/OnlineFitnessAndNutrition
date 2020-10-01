package com.spring.fitness.repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.spring.fitness.model.Diet;

@Repository
public interface DietRepo extends CrudRepository<Diet,String>  {

	List<Diet> findByCategory(String category);
}
