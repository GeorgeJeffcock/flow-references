package com.lowcoders.utils;

import org.mule.api.MuleEventContext;
import org.mule.api.lifecycle.Callable;


public class ExitJVM implements Callable {


	@Override
	public Object onCall(MuleEventContext eventContext) throws Exception {

		    System.exit(0);
			return null;
	}}