package com.controller;
import java.io.IOException;

import com.service.Cinema;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addFilm")
public class AddFilmServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EJB
    private Cinema cinema;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/addFilm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String genre = request.getParameter("genre");

        try {
            cinema.createFilm(name, description, genre);
            response.sendRedirect("listFilms");
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Error adding film: " + e.getMessage());
            request.getRequestDispatcher("/addFilm.jsp").forward(request, response);
        }
    }
}
