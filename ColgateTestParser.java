package com.henninginc.test;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import com.henninginc.test.*;
/**
 * 
 */

/**
 * @author Charlie
 *
 */
public class ColgateTestParser {
	private DocumentBuilder builder;
	private XPath path;
	private Test test;
	
	public ColgateTestParser() throws ParserConfigurationException {
		DocumentBuilderFactory dbfactory = DocumentBuilderFactory.newInstance();
		builder = dbfactory.newDocumentBuilder();
		XPathFactory xpfactory = XPathFactory.newInstance();
		path = xpfactory.newXPath();
		test = new Test();
	}
	

	public Test parse(String fileName ) throws SAXException, IOException, NumberFormatException, XPathExpressionException{
		try{
			File f = new File(fileName);
			Document doc = builder.parse(f);
			doc.getDocumentElement().normalize();
			String testDescription = path.evaluate("/test/introduction", doc);;
			int questionCount = Integer.parseInt(path.evaluate("count(/test/questions/question)", doc));
			List<Question> questionList = new ArrayList<Question>();
			for(int i = 1; i <= questionCount; i++ ){
				ArrayList<Answer> answerList = new ArrayList<Answer>();
				int answerCount = Integer.parseInt(path.evaluate("count(/test/questions/question[" + i + "]/answers/answer)", doc));
				String theQuestion = path.evaluate("/test/questions/question[" + i + "]/questionVerbiage", doc );
				String questionType = path.evaluate("/test/questions/question[" + i + "]/type", doc );
				for( int j = 1; j <= answerCount; j++ ){
					String answer = path.evaluate("/test/questions/question[" + i + "]/answers/answer[" + j + "]", doc);
					String correctAnswer = path.evaluate("/test/questions/question[" + i + "]/answers/answer[" + j + "]/@correctAnswer", doc);
					Boolean isCorrect = false;
					if(correctAnswer.equalsIgnoreCase("true")){
						isCorrect = true;
					}
					answerList.add(new Answer(answer, isCorrect));
				}
				questionList.add(new Question(theQuestion, answerList, questionType));
			}
			test.setIntroText(testDescription);
			test.setQuestionList(questionList);
		} catch(Exception e){ 
			e.printStackTrace();
		}
		return test;
	}
}
