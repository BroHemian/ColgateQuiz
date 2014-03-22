/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.henninginc.test;

import java.io.Serializable;

/**
 *
 * @author Charlie
 */
public class Answer implements Serializable {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String answerText;
    private Boolean correctAnswer;

    public Answer(){
    	setAnswerText("");
    	setCorrectAnswer(null);
    }
    
    public Answer(String answerText, Boolean isCorrect){
    	setAnswerText(answerText);
    	setCorrectAnswer(isCorrect);
    }
    /**
     * @return the answerValue
     */
    public String getAnswerText() {
        return answerText;

    }

    /**
     * @param answerValue the answerValue to set
     */
    public void setAnswerText(String answerValue) {
        this.answerText = answerValue;
    }

    /**
     * @return the correctAnswer
     */
    public Boolean getCorrectAnswer() {
        return correctAnswer;
    }

    /**
     * @param correctAnswer the correctAnswer to set
     */
    public void setCorrectAnswer(Boolean correctAnswer) {
        this.correctAnswer = correctAnswer;
    }
    
}
