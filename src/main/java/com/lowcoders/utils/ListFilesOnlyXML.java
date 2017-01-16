package com.lowcoders.utils;


import java.io.File;
import java.io.FilenameFilter;

import org.mule.api.MuleEventContext;
import org.mule.api.lifecycle.Callable;


public class ListFilesOnlyXML implements Callable {

	@Override
	public Object onCall(MuleEventContext eventContext) throws Exception {
		
		
		File[] files = new File(eventContext.getMessage().getInvocationProperty("AppDirectory").toString()).listFiles(new FilenameFilter()
		{ @Override public boolean accept(File dir, String name) 
		{ return name.endsWith(".xml"); } });
	
		return files;
	}
}



