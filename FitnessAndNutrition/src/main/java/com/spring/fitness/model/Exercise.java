package com.spring.fitness.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Exercise {
     @Id
	private String category;
	private String walktime;
	private String runtime;
	private String yoga;
	private String weighttraining;
	private String swimtime;
	private String sport;
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getWalktime() {
		return walktime;
	}
	public void setWalktime(String walktime) {
		this.walktime = walktime;
	}
	public String getRuntime() {
		return runtime;
	}
	public void setRuntime(String runtime) {
		this.runtime = runtime;
	}
	public String getYoga() {
		return yoga;
	}
	public void setYoga(String yoga) {
		this.yoga = yoga;
	}
	public String getWeighttraining() {
		return weighttraining;
	}
	public void setWeighttraining(String weighttraining) {
		this.weighttraining = weighttraining;
	}
	public String getSwimtime() {
		return swimtime;
	}
	public void setSwimtime(String swimtime) {
		this.swimtime = swimtime;
	}
	public String getSport() {
		return sport;
	}
	public void setSport(String sport) {
		this.sport = sport;
	}
	
}
