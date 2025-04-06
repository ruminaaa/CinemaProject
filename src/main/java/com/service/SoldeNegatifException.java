package com.service;

public class SoldeNegatifException extends Exception {
	 public SoldeNegatifException() {
	        super("The balance cannot be negative.");
	    }

	    public SoldeNegatifException(String message) {
	        super(message);
	    }
}
