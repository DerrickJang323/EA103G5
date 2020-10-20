<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.anwser_list.model.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="testTypeSvc" scope="page"
	class="com.test_type.model.TestTypeService" />
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/front-end/css/style2.css">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
	
	
<form method='post' action='<%= request.getContextPath()%>/question/questionTest.do' id='myForm'>
<div class="heads">
	<span id="Check_Txt">�Ѿl�ɶ��G<span id="Check_i">0��0��</span></span><input type="submit" id = "turnin"  value="�e�X����"></div>

	<div class="container">
	<c:forEach var="question" items="${list}" varStatus="counter">
		<!--         ��X�O���@�����O -->
		<c:set var="type"
			value="${testTypeSvc.getOnebyNO(question.typeno)}" />
			
		<div class="box1">
			<!-- 	�L�X�D�� -->
			<div class="question">
				<span>${counter.count}</span>.${question.qustmt}
			</div>
			<div class = "testtype"><span><h6>(����:${testTypeSvc.getOnebyNO(question.typeno).testdgee})(�D��:${(type.testtype eq 'checkbox' )? '�h���D':(type.testtype eq 'radio' )? '����D':'����D' })</h6></span></div>
			<!-- 	�L�X���/�h���D -->
			<c:if test="${not empty question.op1}">
				<ul class="multiple">
					<label>
						<li class="option"><input type="${type.testtype}"
						class="class${counter.count}" name="${question.qbankno}" value="0" /> <span>A </span><span>${question.op1}</span>
					</li>
					</label>
					<label>
						<li class="option"><input type="${type.testtype}"
							class="class${counter.count}" name="${question.qbankno}" value="1" /> <span>B </span><span>${question.op2}</span>
					</li>
					</label>
					<label>
						<li class="option"><input type="${type.testtype}"
							class="class${counter.count}" name="${question.qbankno}" value="2" /> <span>C </span><span>${question.op3}</span>
					</li>
					</label>
					<label>
						<li class="option"><input type="${type.testtype}"
							class="class${counter.count}" name="${question.qbankno}" value="3" /> <span>D </span><span>${question.op4}</span>
					</li>
					</label>
				</ul>
		</div>
	
		</c:if>
		<!-- 	�L�X����D -->
		<c:if test="${empty question.op1}">
			
			<ul>	
				<input type="${type.testtype}" name="${question.qbankno}" placeholder="�ж�g����"
					style="width: 80%;" id="class${counter.count}" class="class${counter.count}" > <br></ul>
			</div>
		</c:if>
	</c:forEach>

	<input type='hidden' name='action' value='correct'>
	
	</div>
</form>

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
	
<script type="text/javascript">

	var SetMinute = 1800; //�p�ɾ����jQuery�g�A

	function Check_Time() {
		SetMinute -= 1;
		var Check_i = document.getElementById("Check_i");

		var Cal_Minute = Math.floor(Math.floor(SetMinute % 3600) / 60);
		var Cal_Second = SetMinute % 60;

		Check_i.innerHTML =  + Cal_Minute + "��" + Cal_Second
				+ "��";
		if (SetMinute === 0) {
			clearInterval(mm);
			document.getElementById("myForm").submit();
		}
	}
	var mm = window.setInterval("Check_Time()", 1000);
	
	$(document).ready(function() {
		var str = '/^[\u4e00-\u9fa5_a-zA-Z0-9_]+$/g';//���h��F���A���^��μƦr�~�ŦX
		
		$('input[type=text]').keyup(function(){//���T�@���h����
			$(this).parents('ul').removeClass('notWritten');
		});
		
		$('label').click(function(){//���T�@���h����
			$(this).parents('ul').removeClass('notWritten');
		});
		
		$('#turnin').click(function(e) {//�����D�ذ���ú��P�w
			e.preventDefault();
			
			//https://blog.csdn.net/evilcry2013/article/details/78673291
			//�bJS���gEL�y�k�A���[�W``�Ÿ�;
			//�P�_�޿�A�b�C���D�ت��ﶵ�άO��g��[�Wclass ��K�h�d�߬O�_��g
			for(let j = 1 ; j <= `${list.size()}` ; j++){
				var s = $('input[class=class'+ j +']');
				var count = 0 ;
				if(s.length==4){//���/�h���D
					for(let i = 0; i < s.length ;i++){
						if(s[i].checked){
							count++;
						}
					}
				}
				else if($('#class'+j).val().trim().length!=0 && $('#class'+j).val().trim().search(str)){//����D
						count++;
				}
				if(count == 0){//�S���Ŀ�ζ�g���ﶵ��ul�[�W�е�
					s.parents('ul').addClass('notWritten');
				}
			}
			if($('.notWritten').length <=0){//�P�_�O�_�S���е��A���
				swal({ 
					title: "���\ú��",
				    icon: "success",
				    button: true}).then(function(){
				    	$('#myForm').submit();
				    });
			}else{
				swal({ 
					title: "�|�������Ҧ��D��",
				    icon: "warning",
				    button: true,
				    dangerMode: true});
			}
		});
		
	});
</script>
</body>


</html>