package org.pk.ecommerce.entities.product;

import java.sql.Timestamp;

public class Feedback {

	private int feedbackId;
	private String farmerName;
	private String feedback;
	private Timestamp dateTime;

	/**
	 * @return the feedbackId
	 */
	public int getFeedbackId() {
		return feedbackId;
	}

	/**
	 * @param feedbackId the feedbackId to set
	 */
	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

	/**
	 * @return the farmerName
	 */
	public String getFarmerName() {
		return farmerName;
	}

	/**
	 * @param farmerName the farmerName to set
	 */
	public void setFarmerName(String farmerName) {
		this.farmerName = farmerName;
	}

	/**
	 * @return the feedback
	 */
	public String getFeedback() {
		return feedback;
	}

	/**
	 * @param feedback the feedback to set
	 */
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}

	/**
	 * @return the dateTime
	 */
	public Timestamp getDateTime() {
		return dateTime;
	}

	/**
	 * @param dateTime the dateTime to set
	 */
	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}

}
