package com.service;

import java.util.List;
import jakarta.ejb.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;

import com.entities.Compte;
import com.entities.Reservation;
import com.entities.Seance;

@Stateful
public class UtilisateurBean implements Utilisateur {
@PersistenceContext
private EntityManager em = null;
private int user_id;
public UtilisateurBean() {
super();
}
@TransactionAttribute(TransactionAttributeType.REQUIRED)
public void debite(float somme) throws SoldeNegatifException,UserNotFoundException{
float solde;
solde = solde();
if( solde+somme <= 0 ){

throw new SoldeNegatifException();

}else{

Compte compte;
Query q = em.createNamedQuery("findCompteById");
q.setParameter("cid",user_id);
List<Compte> res = (List<Compte>)(q.getResultList());
if(res.size()==0){


throw new UserNotFoundException();
}else{
compte = res.get(0);
compte.setSolde(solde-somme);
em.merge(compte);
}
}

}
public void AddMoney(float somme) throws SoldeNegatifException,UserNotFoundException{
float solde;
solde = solde();
if( solde+somme <= 0 ){

throw new SoldeNegatifException();

}else{

Compte compte;
Query q = em.createNamedQuery("findCompteById");
q.setParameter("cid",user_id);
List<Compte> res = (List<Compte>)(q.getResultList());
if(res.size()==0){


throw new UserNotFoundException();
}else{
compte = res.get(0);
compte.setSolde(solde+somme);
em.merge(compte);
}
}
}
public String getName() throws UserNotFoundException{
String nom;
Query q = em.createNamedQuery("findCompteById");
q.setParameter("cid",user_id);
List<Compte> res = (List<Compte>)(q.getResultList());
if(res.size()==0){
throw new UserNotFoundException();
}else{
nom = res.get(0).getName();
}
return nom;
}
public void init(String name, String passwd) throws UserNotFoundException {
    Query q = em.createNamedQuery("findCompteByName");
    q.setParameter("cname", name);
    List<Compte> res = (List<Compte>) q.getResultList();
    if (res == null || res.size() == 0) {
        throw new UserNotFoundException();
    } else {
        // Set the user context (user ID) based on the username
        if (res.get(0).getName().equals(name)) {
            user_id = res.get(0).getId();
        } else {
            throw new UserNotFoundException();
        }
    }
}


public float solde() throws UserNotFoundException{
float sld;
Query q = em.createNamedQuery("findCompteById");
q.setParameter("cid",user_id);
List<Compte> res = (List<Compte>)(q.getResultList());
if(res.size()==0)
throw new UserNotFoundException();
else
sld = res.get(0).getSolde();


return sld;
}
@Override
public List<Reservation> getUserReservations(String userName) throws UserNotFoundException {
   
    Compte user = em.createQuery("SELECT c FROM Compte c WHERE c.name = :name", Compte.class)
                    .setParameter("name", userName)
                    .getSingleResult();

    if (user == null) {
        throw new UserNotFoundException("User not found");
    }


    return em.createQuery("SELECT r FROM Reservation r WHERE r.userId = :userId", Reservation.class)
             .setParameter("userId", user.getId())
             .getResultList();
}

@Override
public int getUserId() {
    return this.user_id; 
}

}