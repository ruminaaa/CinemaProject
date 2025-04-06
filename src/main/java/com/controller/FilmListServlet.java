package com.controller;


import java.io.IOException;
import java.util.Set;

import com.entities.Film;
import com.service.Cinema;

import jakarta.ejb.EJB;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/listFilms")
public class FilmListServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EJB
    private Cinema cinema;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Set<Film> films = cinema.list();
        request.setAttribute("films", films);
        request.getRequestDispatcher("/listFilms.jsp").forward(request, response);
    }
    
}
