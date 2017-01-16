package com.lowcoders.ui;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import org.mule.api.MuleEventContext;
import org.mule.api.lifecycle.Callable;

public class UserMessageDialog implements Callable {



	@Override
	public Object onCall(MuleEventContext eventContext) throws Exception {

		String userDialogMessage = eventContext.getMessage().getInvocationProperty("userDialogMessage").toString();
		JFrame frame = new JFrame ();
		frame.setAlwaysOnTop (true);
		JOptionPane.showMessageDialog(frame, userDialogMessage);

	
		// outbound payload is set to the inbound payload to avoid transforming it.
		return eventContext.getMessage().getPayload();

	}
}