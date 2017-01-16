package com.lowcoders.ui;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import org.mule.api.MuleEventContext;
import org.mule.api.lifecycle.Callable;


public class ConfirmDialog implements Callable {

	@Override
	public Object onCall(MuleEventContext eventContext) throws Exception {

		String userDialogMessage = eventContext.getMessage().getInvocationProperty("userDialogMessage").toString();

		JFrame frame = new JFrame();
		frame.setAlwaysOnTop(true);
		int reply = JOptionPane.showConfirmDialog(frame, userDialogMessage, "Enquiry Dialog",
				JOptionPane.OK_CANCEL_OPTION);

		if (reply == JOptionPane.OK_OPTION)
			return 1;
		else
			return 0;

	}
}