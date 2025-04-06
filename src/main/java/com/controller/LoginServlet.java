package com.controller;
import com.service.Utilisateur;
import com.service.SoldeNegatifException;
import com.service.UserNotFoundException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.ejb.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EJB
    private Utilisateur utilisateurService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        try {
           
            utilisateurService.init(userName, password);
           
            request.getSession().setAttribute("userName", utilisateurService.getName());
            request.getSession().setAttribute("balance", utilisateurService.solde());

     
            response.sendRedirect("dashboard");

        } catch (UserNotFoundException e) {
       
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } catch (SoldeNegatifException e) {
   
            e.printStackTrace();
        }
    }
}
