package KEC.reserv.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import KSJ.exhibit.dao.ExhibitDao;
import KSJ.exhibit.dto.ExhibitDto;

@WebServlet("/reservget")
public class ReservGet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("reservget doPost success");
		
		
		
		
	}
	
	
	
}
