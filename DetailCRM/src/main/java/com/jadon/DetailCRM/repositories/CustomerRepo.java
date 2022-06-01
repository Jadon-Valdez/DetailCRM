package com.jadon.DetailCRM.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jadon.DetailCRM.models.Customer;

@Repository
public interface CustomerRepo extends CrudRepository<Customer, Long> {
	
	List<Customer> findAll();
	
	@Query("SELECT c FROM Customer c WHERE c.firstname LIKE %?1%"
			+ " OR c.lastname LIKE %?1% "
			+ " OR c.make LIKE %?1% "
			+ " OR c.model LIKE %?1% " )
	public List<Customer> search (String keyword);
	
}
