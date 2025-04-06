package com.service;

public class SoldeInsuffisantException extends Exception {
	public SoldeInsuffisantException() {
        super("Insufficient balance to complete the operation.");
    }

    public SoldeInsuffisantException(String message) {
        super(message);
    }
}
