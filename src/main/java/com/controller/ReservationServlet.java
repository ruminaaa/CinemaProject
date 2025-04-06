package com.controller;

import java.io.IOException;
import java.util.Set;

import com.entities.Film;
import com.entities.Seance;
import com.service.Cinema;
import com.service.PlusDePlaceException;
import com.service.SoldeInsuffisantException;
import com.service.SoldeNegatifException;
import com.service.UserNotFoundException;
import com.service.Utilisateur;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @EJB
    private Cinema cinemaService; 

    @EJB
    private Utilisateur utilisateurService; 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("showFilms".equals(action)) {
            Set<Film> films = cinemaService.list();
            request.setAttribute("films", films);
            request.getRequestDispatcher("/filmSelection.jsp").forward(request, response);

        } else if ("showSeances".equals(action)) {
            try {
                int filmId = Integer.parseInt(request.getParameter("filmId"));
                Film film = cinemaService.findFilm(filmId);
                request.setAttribute("film", film);
                request.setAttribute("salleProgs", film.getSalleprog());
                request.getRequestDispatcher("seanceSelection.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid film ID.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int seanceId = Integer.parseInt(request.getParameter("seanceId"));
            int nbrPlaces = Integer.parseInt(request.getParameter("nbrPlaces"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");

       
            Seance seance = findSeanceById(seanceId);
            if (seance == null) {
                throw new ServletException("Seance not found.");
            }

            utilisateurService.init(username, password);
            Utilisateur user = utilisateurService;

        
            float solde = user.solde();
            if (solde < nbrPlaces * seance.getTarif()) {
                throw new SoldeInsuffisantException("Insufficient balance to reserve tickets.");
            }

         
            cinemaService.reserve(seance, user, nbrPlaces);

         
            response.sendRedirect("reservationSuccess.jsp");

        } catch (PlusDePlaceException e) {
        
            request.setAttribute("error", "Error: No more seats available for the selected session.");
            request.getRequestDispatcher("error.jsp").forward(request, response);

        } catch (SoldeInsuffisantException e) {
     
            request.setAttribute("error", "Error: Insufficient balance to reserve tickets.");
            request.getRequestDispatcher("error.jsp").forward(request, response);

        } catch (SoldeNegatifException e) {
        
            request.setAttribute("error", "Error: Negative balance is not allowed.");
            request.getRequestDispatcher("error.jsp").forward(request, response);

        } catch (UserNotFoundException e) {
            // Handle user not found error
            request.setAttribute("error", "Error: User not found.");
            request.getRequestDispatcher("error.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            // Handle invalid input for seanceId or nbrPlaces
            request.setAttribute("error", "Invalid input: Please enter valid numbers for seats.");
            request.getRequestDispatcher("error.jsp").forward(request, response);

        } catch (Exception e) {
            // Generic error handler
            e.printStackTrace();  // Log the error to the server logs
            request.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private Seance findSeanceById(int seanceId) {
        return cinemaService.getAllSalleProg().stream()
                .flatMap(salleProg -> salleProg.getSeances().stream())
                .filter(seance -> seance.getId_seance() == seanceId)
                .findFirst()
                .orElse(null); 
    }
}
