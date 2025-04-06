package com.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import com.entities.Film;
import com.entities.SalleProg;
import com.entities.Seance;
import com.service.Cinema;


import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/filmDetails")
public class FilmDetailsServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EJB
    private Cinema cinema;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
        int filmId = Integer.parseInt(request.getParameter("id"));

    
        Film film = cinema.findFilm(filmId);
        
        if (film == null) {
          
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Film not found");
            return;
        }

      
        Collection<SalleProg> salleprogs = film.getSalleprog();
        Set<Seance> seances = new HashSet<>();
        for (SalleProg salleprog : salleprogs) {
            seances.addAll(salleprog.getSeances());
        }

      
        request.setAttribute("film", film);
        request.setAttribute("seances", seances);
        
      
        request.getRequestDispatcher("/filmDetails.jsp").forward(request, response);
    }
}