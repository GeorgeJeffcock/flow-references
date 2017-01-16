package com.lowcoders.utils;

// test test  lookupFlowConstruct("sf_exitJVM")

import java.nio.file.Files;
import java.nio.file.Paths;

import org.mule.api.MuleEventContext;
import org.mule.api.lifecycle.Callable;


public class CheckFileExists implements Callable {

	@Override
	public Object onCall(MuleEventContext eventContext) throws Exception {
		
		String filePathToRead = eventContext.getMessage().getInvocationProperty("filePathToRead").toString();

		if(Files.exists(Paths.get(filePathToRead))) { 
		return true;
		}
		else
		{ 
		return false;
		}
	}
}



