package com.jadon.DetailCRM.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jadon.DetailCRM.models.Customer;
import com.jadon.DetailCRM.repositories.CustomerRepo;

@Service
public class CustomerService {
	@Autowired
	private CustomerRepo customerRepo;
	
	public Customer createCustomer(Customer c) {
		return customerRepo.save(c);
	}
	
	public List<Customer> allCustomers(String keyword){
		if(keyword != null) {
			return customerRepo.search(keyword);
		}
		return customerRepo.findAll();
	}
	
	public Customer findCustomer(Long id) {
		Optional<Customer> optionalCustomer = customerRepo.findById(id);
		if(optionalCustomer.isPresent()) {
			return optionalCustomer.get();
		} else {
			return null;
		}
	}
	
	public Customer updateCustomer(Customer c) {
		return customerRepo.save(c);
	}
	
	public void deleteCustomer(Long id) {
		customerRepo.deleteById(id);
	}
	
	
}
