<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ page import="com.henninginc.test.*" %>
<%
ColgateTestParser ctp = new ColgateTestParser();

	Test test = new Test();
	test = ctp.parse("C:\\Java\\colgateTest.xml");
	
	int q = test.getQuestionList().size();
	String[] q_array = new String[q];
	String[] type = new String[q];
	int correct[] = new int[q];
	
	for(int i = 0; i < q; i++){
		q_array[i] = (String) test.getQuestionList().get(i).getQuestionVerbiage();
		type[i] = test.getQuestionList().get(i).getQuestionType();
	}
	
	int answerCount = 0;
	
	String[][] a_array = new String[q][4];
	
	for (int i = 0; i < q; i++)
	{
		for (int x = 0; x < 4; x++)
			a_array[i][x] = "Q" + (i + 1) + ", A" + (x + 1);
	}
%>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script> 
		<title>Colgate Quiz</title>
		<!--  <link href="style.css" rel="stylesheet" type="text/css" />-->
		<style type="text/css">
#apDiv1 {
	position:absolute;
	left:11px;
	top:526px;
	width:106px;
	height:16px;
	z-index:1;
}
#apDiv2 {
	position:absolute;
	width:200px;
	height:115px;
	z-index:1;
	left: -9px;
	top: 524px;
}
body {
	background-color: #FFF;
}
</style>
<script type="text/javascript">
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
</script>
	</head>
	<link href="Style.css" rel="stylesheet" type="text/css" />
	

	
<body onload="MM_preloadImages('Colagate submit button glow.gif','Colagate reset2 button.gif')">

<div id="header_border">
  <p><img src="Colgate header pic.gif" alt="header logo" width="1064" /></p>
</div> <!-- The header -->

		
		<form method="post">
		<div class="quiz_area">
		<%
		for (int i = 1; i <= q; i++)
		{
			out.print("<div id='q" + i + "' style='display: none;  ' >");
			
				out.print("<div class='question_area'>");
				out.print(q_array[i-1]);
				out.print("</div>");
				
				if (type[i-1].equalsIgnoreCase("MC")){
					answerCount = 4;
				}
				else if (type[i-1].equalsIgnoreCase("TF")){
					answerCount = 2;
				}
				else{
					answerCount = 0;
				}
				
				
			
				out.print("<div class='answer_area'>");
				for (int j = 0; j < answerCount; j++){
					
					String currentAnswer = test.getQuestionList().get(i-1).getAnswerList().get(j).getAnswerText();
					out.println("<input type='radio' name='r" + i + "' value='" + j + "' >");
					if(test.getQuestionList().get(i-1).getAnswerList().get(j).getCorrectAnswer() == true){
						correct[i-1] = j;
					}
					out.print(currentAnswer);
					out.println("<br/>");
				}
				out.print("</div>");
			
			
			
			out.print("</div>");
			//out.print("<br/>");
		}
		ServletContext context = request.getSession().getServletContext();
		context.setAttribute("correctAnswers", correct);
		//application
		%>
		</div>
		
		<script>
			var count = 1;
			var q_size = <%=q%>;
			var question = new Array();
			function next(){
				document.getElementById("submitButton").style.display= "none";
				document.getElementById("Image3").style.display= 'block';
				if (count >= 1 && count <= q_size){
					document.getElementById("q" + count).style.display = 'block';
					if(count > 1 && count <= q_size){
						document.getElementById("q" + (count - 1)).style.display = 'none';
						document.getElementById("q" + (count - 1)).style.top = '400px';
					}
					count+=1;
				}
				else{ 
					if(count > q_size){
						submit();	
					}
				}
				return false;
		}
			function submit(){// Use this method to set all radio button answer values dynamically!
				for (var i = 1; i <= q_size; i++)
				{
					var answerSet = new String("r" + i);
					for (var j = 1; j <= document.getElementsByName(answerSet).length; j++)
					{
						if(document.getElementsByName(answerSet)[j-1].checked == true){
							question[i-1] = j-1;
								break;
							}
					}
					if(i == q_size){
						console.log("last iteration.");
						ajaxXmlCall(question);
						return false;
					}
				}
			}
			//Sends data to the servlet, Currently is sending the "3" to processor.java
			function ajaxXmlCall(question){ 
				var toServlet = new String();
				for(var i =0; i< q_size; i++){
					if(i >0)
					toServlet = toServlet + "," + question[i];
					else
						toServlet = question[i];
				}
				console.log("inajaxcall");
	            $.ajax({ 
	            url:'servlets/processor', 
	            type:'POST', 
	            data:{toServlet:toServlet}, 
	            success:processResponse
	            
	            }); 
	        }
			function processResponse(results){           
				
					window.location.href = results;
			
			}
			 
         
		</script>
		
		<div class="button_area" style="text-align:center;" >
			<button id="submitButton" onclick="return next();">Start Quiz</button>
		</div>
		<div class="Button_area">
 <p align="center">&nbsp;</p>
 <p align="center"><a href="#" onmouseout="MM_swapImgRestore()" onClick="next();"onmouseover="MM_swapImage('Image3','','Colagate submit button glow.gif',1)"><img src="Colagate submit button.gif" style="display:none;" name="Image3" width="270" height="74" border="0" align="middle" id="Image3" /></a></p>

<div align="center"><em></em></div>
<div id="bottom_border">
<p><img src="Colgate bottom pic.gif" width="1064" height="25" /></p>
</div>
		</form>
	</body>
</html>
