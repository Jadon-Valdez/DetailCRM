package com.jadon.DetailCRM.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jadon.DetailCRM.models.Appointment;
import com.jadon.DetailCRM.repositories.AppointmentRepo;

@Service
public class AppointmentService {

	@Autowired
	private AppointmentRepo appointmentRepo;
	
	public Appointment createAppointment(Appointment a) {
		return appointmentRepo.save(a);
	}
	
	public List<Appointment> allAppointments(){
		return appointmentRepo.findAll();
	}
	
	public Appointment findAppointment(Long id) {
		Optional<Appointment> optionalAppointment = appointmentRepo.findById(id);
		if(optionalAppointment.isPresent()) {
			return optionalAppointment.get();
		} else {
			return null;
		}
	}
	
	public Appointment updateAppointment (Appointment a) {
		return appointmentRepo.save(a);
	}
	
	public void deleteAppointment(Long id) {
		appointmentRepo.deleteById(id);
	}
	
}
