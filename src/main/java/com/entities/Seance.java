package com.entities;


import jakarta.persistence.*;

import java.io.Serializable;
import java.util.Date;
@Entity 
@Table(name="SEANCE")
@NamedQueries({
    @NamedQuery(name = "findSeanceById", query = "SELECT s FROM Seance s WHERE s.id_seance = :id")
})

public class Seance implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id_seance;
	private Date horaire;
	private int places;
	private float tarif;
	private SalleProg salleprog;

	
	public Seance() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Seance(int id_seance, Date horaire, int places, float tarif, SalleProg salleprog) {
		super();
		this.id_seance = id_seance;
		this.horaire = horaire;
		this.places = places;
		this.tarif = tarif;
		this.salleprog = salleprog;
	
	}


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId_seance() {
		return id_seance;
	}
	
	public void setId_seance(int id_seance) {
		this.id_seance = id_seance;
	}
	public Date getHoraire() {
		return horaire;
	}
	public void setHoraire(Date horaire) {
		this.horaire = horaire;
	}
	public int getPlaces() {
		return places;
	}
	public void setPlaces(int places) {
		this.places = places;
	}
	public float getTarif() {
		return tarif;
	}
	public void setTarif(float tarif) {
		this.tarif = tarif;
	}
	
	@ManyToOne
	public SalleProg getSalleprog() {
		return salleprog;
	}
	public void setSalleprog(SalleProg salleprog) {
		this.salleprog = salleprog;
	}
	

    
   
	
	
	
}