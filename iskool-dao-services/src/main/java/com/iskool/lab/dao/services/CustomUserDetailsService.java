package com.iskool.lab.dao.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.polls.security.UserPrincipal;
import com.sportsit.iskool.dao.model.Employee;
import com.sportsit.iskool.dao.model.Student;
import com.sportsit.iskool.repository.EmployeeRepository;
import com.sportsit.iskool.repository.ParentRepository;
import com.sportsit.iskool.repository.StudentRepository;


@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
    StudentRepository studentRepository;
	
	@Autowired
    EmployeeRepository employeeRepository;
	
	@Autowired
    ParentRepository parentRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		UserDetails user=null;
		Optional<Student> option = studentRepository.findByUsername(username);
		if(option!=null) {
			Student student = option.get();
			 return com.iskool.lab.dao.model.UserPrincipal.create(student.getId(), student.getFirstname(), student.getStudentid(),
					student.getEmail(), student.getPassword(), student.getStudentRoleMappings());
			
		}
		return null;
	}
	
}