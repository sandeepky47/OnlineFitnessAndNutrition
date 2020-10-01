package com.spring.fitness.repos;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.spring.fitness.model.Exercise;

@Repository
public interface ExerciseRepo extends CrudRepository<Exercise, String> {

	List<Exercise> findByCategory(String category);
	
}
