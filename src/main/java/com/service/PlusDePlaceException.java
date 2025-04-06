package com.service;

public class PlusDePlaceException extends Exception {
	 public PlusDePlaceException() {
	        super("No more seats available for the selected session.");
	    }

	    public PlusDePlaceException(String message) {
	        super(message);
	    }

}
