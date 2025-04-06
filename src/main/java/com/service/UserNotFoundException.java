package com.service;

public class UserNotFoundException extends Exception {
	 public UserNotFoundException() {
	        super("The specified user was not found.");
	    }

	    public UserNotFoundException(String message) {
	        super(message);
	    }

}
