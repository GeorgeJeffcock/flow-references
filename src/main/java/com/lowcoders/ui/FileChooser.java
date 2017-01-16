
package com.lowcoders.ui;

import org.mule.api.MuleEventContext;
import org.mule.api.lifecycle.Callable;

import java.awt.Component;
import java.awt.HeadlessException;

import javax.swing.*;


public class FileChooser implements Callable {

	@Override
	public Object onCall(MuleEventContext eventContext) throws Exception {

		JFileChooser chooser = new JFileChooser() {

			/**
			 * 
			 */
			private static final long serialVersionUID = 1L;

			@Override
			protected JDialog createDialog(Component parent) throws HeadlessException {
				JDialog dialog = super.createDialog(parent);
				// config here as needed - just to see a difference
				dialog.setLocationByPlatform(true);
				// might help - can't know because I can't reproduce the problem
				dialog.setAlwaysOnTop(true);
				return dialog;
			}

		};
		chooser.setCurrentDirectory(new java.io.File("."));
		chooser.setDialogTitle("Select Directory for your Project's Mule Configuration Files");
		// chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		chooser.setAcceptAllFileFilterUsed(false);

		if (chooser.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
			// System.out.println("getCurrentDirectory(): " + chooser.getCurrentDirectory());
			// System.out.println("getSelectedFile() : " + chooser.getSelectedFile());
			return chooser.getSelectedFile().toString();
		} else {
			// System.out.println("No Selection ");
			return null;
		}

	}
}