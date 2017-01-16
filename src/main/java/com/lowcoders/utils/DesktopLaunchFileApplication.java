package com.lowcoders.utils;

import java.awt.Desktop;
import java.io.File;
import org.mule.api.MuleEventContext;
import org.mule.api.lifecycle.Callable;
import javax.swing.*;

public class DesktopLaunchFileApplication implements Callable {

	@Override
	public Object onCall(MuleEventContext eventContext) throws Exception {

		String fileToOpen = eventContext.getMessage().getInvocationProperty("fullPath").toString();
		
		File f = new File(fileToOpen);
		
		try {Desktop.getDesktop().open(f);
		} catch (Exception e) 
		{JOptionPane.showMessageDialog(null,e);}
	
		// outbound payload is set to the inbound payload to avoid transforming it.
		return eventContext.getMessage().getPayload();

	}
}



