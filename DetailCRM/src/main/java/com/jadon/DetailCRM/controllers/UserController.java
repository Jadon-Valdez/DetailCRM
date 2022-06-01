package com.jadon.DetailCRM.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jadon.DetailCRM.models.Appointment;
import com.jadon.DetailCRM.models.Customer;
import com.jadon.DetailCRM.models.LoginUser;
import com.jadon.DetailCRM.models.User;
import com.jadon.DetailCRM.services.AppointmentService;
import com.jadon.DetailCRM.services.CustomerService;
import com.jadon.DetailCRM.services.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userServ;
	
	@Autowired
	private CustomerService customerServ;
	
	@Autowired
	private AppointmentService appointmentServ;

	// CREATE USER
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "/login/index.jsp";
	}

	// CREATE USER
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {
		userServ.register(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "login/index.jsp";
		}
		session.setAttribute("user_id", newUser.getId());
		return "redirect:/home";
	}

	// SUCCESS
	@GetMapping("/home")
	public String home(HttpSession s, Model model) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd 00:00:00.0");
		Long userID = (Long) s.getAttribute("user_id");
		User thisUser = userServ.findOne(userID);
		Date date = new Date();
		List<Appointment> appointments = appointmentServ.allAppointments();
		model.addAttribute("id", thisUser.getId());
		System.out.println(thisUser);
		model.addAttribute("thisUser", thisUser);
		model.addAttribute("name", thisUser.getUserName());
		model.addAttribute("customers", thisUser.getCustomers());
		model.addAttribute("appointments", thisUser.getAppointments());
		model.addAttribute("date", sdf.format(date));
		return "/app/dashboard.jsp";
	}

	// LOGIN USER
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {
		User user = userServ.login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "/login/index.jsp";
		}
		session.setAttribute("user_id", user.getId());
		return "redirect:/home";
	}

	// LOGOUT
	@GetMapping("/logout")
	public String logout(HttpSession s) {
		s.invalidate();
		return "redirect:/";
	}
}

