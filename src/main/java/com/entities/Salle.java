package com.entities;

import java.io.Serializable;

import jakarta.persistence.*;

@Entity
@Table(name = "SALLE")
public class Salle implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id_salle;
    private String name;
    private String address;
    private int capacite;
    @OneToOne(mappedBy = "salle", cascade = CascadeType.PERSIST,fetch = FetchType.EAGER)
    private SalleProg salleprog;

    public Salle() {
        super();
    }

    public Salle(int id_salle, String name, String address, int capacite) {
        this.id_salle = id_salle;
        this.name = name;
        this.address = address;
        this.capacite = capacite;
      
    }

    public int getId_salle() {
        return id_salle;
    }

    public void setId_salle(int id_salle) {
        this.id_salle = id_salle;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getCapacite() {
        return capacite;
    }

    public void setCapacite(int capacite) {
        this.capacite = capacite;
    }

    public SalleProg getSalleprog() {
        return salleprog;
    }

    public void setSalleprog(SalleProg salleprog) {
        this.salleprog = salleprog;
    }
    

}