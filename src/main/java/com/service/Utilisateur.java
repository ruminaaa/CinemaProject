package com.service;


import java.util.List;

import com.entities.Reservation;
import com.entities.Seance;

import jakarta.ejb.*;

@Remote
public interface Utilisateur {

public void init(String name, String passwd) throws UserNotFoundException;
public String getName() throws UserNotFoundException; 
public float solde()
throws SoldeNegatifException,UserNotFoundException;

// Débiter le compte de l'utilisateur
public void debite(float f) throws SoldeNegatifException,UserNotFoundException;
public void AddMoney(float somme) throws SoldeNegatifException,UserNotFoundException;
public List<Reservation> getUserReservations(String userName) throws UserNotFoundException;
public int getUserId();

}
