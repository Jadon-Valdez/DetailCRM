package com.jadon.DetailCRM.controllers;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jadon.DetailCRM.models.Appointment;
import com.jadon.DetailCRM.models.Customer;
import com.jadon.DetailCRM.models.User;
import com.jadon.DetailCRM.services.AppointmentService;
import com.jadon.DetailCRM.services.CustomerService;
import com.jadon.DetailCRM.services.UserService;

	
@Controller
public class MainController {

	@Autowired
	private UserService userServ;
	
	@Autowired
	private AppointmentService appointmentServ;
	
	@Autowired
	private CustomerService customerServ;
	
	@RequestMapping("/customer/new")
	public String createNew(@ModelAttribute("customer") Customer customer, HttpSession s, Model model, String keyword) {
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		model.addAttribute("id", thisUser.getId());
		model.addAttribute("customers", customerServ.allCustomers(keyword));
		if(userID == null) {
			return "redirect:/";
		} else {
			return "/app/newCustomer.jsp";
		}
	}
	
	@PostMapping(value = "/newCustomer")
	public String createCustomer(@Valid @ModelAttribute("customer") Customer customer, BindingResult res, HttpSession s, Model model) {
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		if(res.hasErrors()) {
			return "/app/newCustomer.jsp";
		} else {
			customer.setUser(thisUser);
			customerServ.createCustomer(customer);
			return "redirect:/home";
		}
	}
	
	@RequestMapping("/customers")
	public String allCustomers(Model model, String keyword, HttpSession s) {
		List<Customer> customers = customerServ.allCustomers(keyword);
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		model.addAttribute("id", thisUser.getId());
		model.addAttribute("customers", thisUser.getCustomers());
        model.addAttribute("listCustomers", customers);
        model.addAttribute("keyword", keyword);
		return "/app/customers.jsp";
	}
	

	@RequestMapping("/customer/{customerId}")
	public String showCustomer(Appointment appointment, Model model, @PathVariable("customerId") Long Id, HttpSession s) {
		Customer customer = customerServ.findCustomer(Id);
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		model.addAttribute("customer", customer);
		model.addAttribute("user", userID);
		model.addAttribute("id", thisUser.getId());
		model.addAttribute("getAppointment", customer.getAppointments());
		model.addAttribute("newAppointment", new Appointment());
		model.addAttribute("appointmentTime", appointment.getTime());
		return "/app/oneCustomer.jsp";
	}
	
	@RequestMapping(value = "/new/appointment/{customerId}", method = RequestMethod.POST)
	public String appointment(@Valid @ModelAttribute("appointment") Appointment appointment, BindingResult res, HttpSession s, Model model,
			@PathVariable("customerId") Long Id) {
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		Customer customer = customerServ.findCustomer(Id);
		if(res.hasErrors()) {
			return "/app/oneCustomer.jsp";
		} else {
			appointment.setUser(thisUser);
			appointment.setCustomer(customer);
			appointmentServ.createAppointment(appointment);
			return "redirect:/customer/{customerId}";
		}
	}
	
	@RequestMapping("customer/{id}/edit")
	public String editCustomer(Model model, @PathVariable("id") Long Id) {
		Customer customer = customerServ.findCustomer(Id);
		model.addAttribute("customer", customer);
		return "/app/edit.jsp";
	}
	
	@RequestMapping(value = "/customer/{id}", method = RequestMethod.PUT)
	public String updateCustomer(@Valid @ModelAttribute("customer") Customer customer, HttpSession s, BindingResult result) {
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		if(result.hasErrors()) {
			return "/app/edit.jsp";
		} else {
			customer.setUser(thisUser);
			customerServ.updateCustomer(customer);
			return "redirect:/customer/{id}";
		}
	}
	
	@RequestMapping("appointment/{id}/edit")
	public String editAppointment(Model model, @PathVariable("id") Long Id) {
		Appointment appointment = appointmentServ.findAppointment(Id);
		model.addAttribute("appointment", appointment);
		return "/app/editAppt.jsp";
	}
	
	@RequestMapping(value = "/appointment/{id}")
	public String updateAppointment(@Valid @ModelAttribute("appointment") Appointment appointment, HttpSession s, BindingResult result) {
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		if(result.hasErrors()) {
			return "/app/editAppt.jsp";
		} else {
			appointment.setUser(thisUser);
			appointmentServ.updateAppointment(appointment);
			return "redirect:/home";
		}
	}
	
	@DeleteMapping("/appointment/{id}/delete")
	public String DeleteMe(@PathVariable("id") Long id) {
		appointmentServ.deleteAppointment(id);
		return "redirect:/customers";
	}
	
	
	
}
