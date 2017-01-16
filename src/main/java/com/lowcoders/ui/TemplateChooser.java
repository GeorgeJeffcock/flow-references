
package com.lowcoders.ui;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import org.mule.api.MuleEventContext;
import org.mule.api.lifecycle.Callable;

public class TemplateChooser implements Callable {

	@Override
	public Object onCall(MuleEventContext eventContext) throws Exception {

		JFrame frame = new JFrame();
		frame.setAlwaysOnTop(true);
		Object[] possibilities = { "AlchemyBasic", "AlchemyCluster", "Mule_BendItLikeBeckham", "Mule_StraightAsAnArrow" };
		String s = (String) JOptionPane.showInputDialog(frame, null, "Choose Alchemy Template Format",
				JOptionPane.PLAIN_MESSAGE, null, possibilities, "Mule_BendItLikeBeckham");

		if ((s != null) && (s.length() > 0)) {
			return s;
		} else {
			return null;
		}

	}
}