package com.lowcoders.utils;


import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.mule.api.MuleEventContext;
import org.mule.api.lifecycle.Callable;


public class ExtractLookupFlowName implements Callable {

	List<String> flowNames = new ArrayList<>();
	
	@Override
	public Object onCall(MuleEventContext eventContext) throws Exception {
		
		// final String regex2 = "lookup\\(\"([^\\s]+)\",";
		final String regex = eventContext.getMessage().getInvocationProperty("regex").toString();
		final String stringToTest = eventContext.getMessage().getInvocationProperty("stringToTest").toString();
		

		
		// System.out.println(regex2);
		// System.out.println(regex);
		// System.out.println(stringToTest);
		
		final Pattern pattern = Pattern.compile(regex);
		final Matcher matcher = pattern.matcher(stringToTest);
		
		while (matcher.find()) {
		    // System.out.println("Full match: " + matcher.group(0));
		    for (int i = 1; i <= matcher.groupCount(); i++) {
		        // System.out.println("Group " + i + ": " + matcher.group(i));
		        flowNames.add(matcher.group(i));

		    }
		}
		
		

		flowNames = flowNames.stream().distinct().collect(Collectors.toList());
		return flowNames;
	}
}



