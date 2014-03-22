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
public class Test implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String introText;
    private List<Question> questionList;
	String theOutput = "";
    
    
    public Test(){
        questionList = new ArrayList<Question>();
    }
    
    public Test(List<Question> questionList, String introTest){
    	setQuestionList(questionList);
    	setIntroText(introTest);
    	
    }
	/**
	 * @return the introText
	 */
	public String getIntroText() {
		return introText;
	}
	/**
	 * @param introText the introText to set
	 */
	public void setIntroText(String introText) {
		this.introText = introText;
	}
	/**
	 * @return the questionList
	 */
	public List<Question> getQuestionList() {
		return questionList;
	}
	/**
	 * @param questionList the questionList to set
	 */
	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}
    
	public String toString(){
		theOutput += "Intro: " + introText;
		for( int i = 0; i < questionList.size(); i++ ){
			theOutput += "\n\t" + i + ". " + questionList.get(i).getQuestionVerbiage() + "<br>";
			for( int j = 0; j < questionList.get(i).getAnswerList().size(); j++ ){
				theOutput += "\n\t\t" + j + ". " + questionList.get(i).getAnswerList().get(j).getAnswerText();
				if( questionList.get(i).getAnswerList().get(j).getCorrectAnswer() ){
					theOutput += "(correct)";
				}
				theOutput += "<br>";
			}
		}
		return theOutput;
	}
}
