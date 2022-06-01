package com.jadon.DetailCRM.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jadon.DetailCRM.models.Appointment;

@Repository
public interface AppointmentRepo extends CrudRepository<Appointment, Long> {
	
	List<Appointment> findAll();
	
}
