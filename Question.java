/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.henninginc.test;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Charlie
 */
public class Question implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String questionVerbiage;
    private List<Answer> answerList;
    private String questionType;
    
    public Question(){
        answerList = new ArrayList<>();
    }
    
    public Question(String questionVerbiage, List<Answer> answerList, String questionType ){
    	setQuestionVerbiage(questionVerbiage);
    	setAnswerList(answerList);
    	setQuestionType(questionType);
    }

    /**
     * @return the questionValue
     */
    public String getQuestionVerbiage() {
        return questionVerbiage;
    }

    /**
     * @param questionValue the questionValue to set
     */
    public void setQuestionVerbiage(String questionValue) {
        this.questionVerbiage = questionValue;
    }
    
    public void setQuestionType(String typeValue){
    	this.questionType = typeValue;
    }

    /**
     * @return the answerList
     */
    public List<Answer> getAnswerList() {
        return answerList;
    }

    /**
     * @param answerList the answerList to set
     */
    public void setAnswerList(List<Answer> answerList) {
        this.answerList = answerList;
    }
    
    public String getQuestionType(){
    	return questionType;
    }
}
