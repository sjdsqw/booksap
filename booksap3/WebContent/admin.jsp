<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin</title>
<style type="text/css">
  .list{
      color: #111;
      font-size: 13px;
  
  
  
  }
  	a{
		text-decoration: none;
		color: black;
	}
	.list a:hover{
       color: #111;
    text-decoration: none;
    font-size: 16px;

	}
#admintable{
  margin-left: 20px;
  margin-top: 50px;

}
table{



border:1px solid green;

}
td{
border: 1px solid green;
 width: 200px;
  vertical-align: middle;
    text-align: center; 
}
</style>


</head>
<body>
<div style="width: 100%; height: 60px; background-color:blue; " >
<div style="float: left; margin-left: 40px;"><font size="15" style="font-family:华文黑体; ">图书管理系统</font></div>
  <div style="float:right; margin-top: 30px; margin-right: 20px;">${id}  欢迎您的登录  </div>
</div>
<div style="width: 100%; height:650px; border: 1px solid red;  " >
	<div style=" clear:both;width: 20%; height:650px; border: 1px solid blue;float:left;">
		<div style="margin-top: 60px; width: 80%; margin-left: 20px; line-height: 50px;">
		
		<a  href="showadmin.do"  id="showadmin" >显示管理员信息</a><br>
		<a href="showbook.do" id="showbook"  >查看全部图书</a><br>
		<a href="#" id="jiebook" >借书</a><br>
		<a href="#" id="huanbook"  >还 书</a><br>
		<a href="showborrow.do" id="showborrow"  >全部借阅信息</a>
		
	    </div>
	</div>
	<div style="width: 79%; height:650px; border: 1px solid green;float:left;" id="context">
	<br>	<br>	<br>
                  	<font   style="margin-left: 80px;margin-top: 300px; font-size: 20px;">欢迎光临本图书管理系统,请在左侧选择你要进行的操作</font>
	
	</div>



</div>




</body>
</html>

<script src="js/jquery.js"></script>

<script type="text/javascript">

var a="ddd";
$(function(){
	
	var page=1;
	var allpage=100;
	$("#showadmin").click(function(){
		var url=this.href;
       page=1;
		var args={"time":new Date()};
		$.getJSON(url,args,function(data){

		var tablecontext="";

		tablecontext+="<div style='float:right;margin-top:70px; margin-right:15px;' ><a href='addadmin.do' id='addadmin' >添加新的管理员</a></div>    <div id='admintable'><br><table  id='admintable' >  <tr> <td>id</td><td>password</td><td>权限等级</td><td>操作</td><td>操作</td>  </tr>";
		for(var i=0;i<data.length-1;i++)
			{
			 tablecontext+="<tr> <td>"+data[i].id+"</td><td>"+data[i].password+"</td><td>"+data[i].auth+"</td><td><a href='mod' class='"+data[i].id+"' >修改</a></td><td><a href='deladmin.do' class='"+data[i].id+"' >删除</a></td>  </tr>";
		
			}
		tablecontext+="<tr> <td>"+data[data.length-1].id+"</td><td>"+data[data.length-1].password+"</td><td>"+data[data.length-1].auth+"</td> <td><a href='mod' class='"+data[data.length-1].id+"' >修改</a></td><td><a href='deladmin.do' class='"+data[data.length-1].id+"'>删除</a></td> </tr></table></div >";
		tablecontext+="<br><center><input type='button' id='apageprevious' value='上一页' >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type='button' id='apagenext' value='下一页' > </center> ";
		

	    $("#context").empty();
		$("#context").append(tablecontext);
		});
	  alert(allpage);
		allpage=<%= request.getParameter("allpage")%>;
	alert(allpage);
		return false;	
	});
	
	 $("#apageprevious").live('click',function(){
		  if(page==1)
			{
			  var msg = "已到第一页"; 
				alert(msg);
				
			  return false; 
			  }
		  else{
			  page=page-1;
			  url="showadminbypage.do?page="+page;
				var args={"time":new Date()};
				$.getJSON(url,args,function(data){
			  var tablecontext="";

			  tablecontext+="<div style='float:right;margin-top:70px; margin-right:15px;' ><a href='addadmin.do' id='addadmin' >添加新的管理员</a></div>    <div id='admintable'><br><table  id='admintable' >  <tr> <td>id</td><td>password</td><td>权限等级</td><td>操作</td><td>操作</td>  </tr>";
				for(var i=0;i<data.length-1;i++)
					{
					 tablecontext+="<tr> <td>"+data[i].id+"</td><td>"+data[i].password+"</td><td>"+data[i].auth+"</td><td><a href='mod' class='"+data[i].id+"' >修改</a></td><td><a href='deladmin.do' class='"+data[i].id+"' >删除</a></td>  </tr>";
				
					}
				tablecontext+="<tr> <td>"+data[data.length-1].id+"</td><td>"+data[data.length-1].password+"</td><td>"+data[data.length-1].auth+"</td> <td><a href='mod' class='"+data[data.length-1].id+"' >修改</a></td><td><a href='deladmin.do' class='"+data[data.length-1].id+"'>删除</a></td> </tr></table></div >";
				tablecontext+="<br><center><input type='button' id='apageprevious' value='上一页' >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type='button' id='apagenext' value='下一页' > </center> "+{};
				   $("#context").empty();
					$("#context").append(tablecontext);
			  
				});
			  
		  }
		  
	  });
	  
	  $("#apagenext").live('click',function(){
		  page=page+1;
		 
		  if(page>allpage)
			{
			  page=page-1;
			  var msg = "已到最后一页"; 
				alert(msg);
				
			  return false; 
			  }
		  else{
			  
			  url="showadminbypage.do?page="+page;
				var args={"time":new Date()};
				$.getJSON(url,args,function(data){
			  var tablecontext="";


			  tablecontext+="<div style='float:right;margin-top:70px; margin-right:15px;' ><a href='addadmin.do' id='addadmin' >添加新的管理员</a></div>    <div id='admintable'><br><table  id='admintable' >  <tr> <td>id</td><td>password</td><td>权限等级</td><td>操作</td><td>操作</td>  </tr>";
				for(var i=0;i<data.length-1;i++)
					{
					 tablecontext+="<tr> <td>"+data[i].id+"</td><td>"+data[i].password+"</td><td>"+data[i].auth+"</td><td><a href='mod' class='"+data[i].id+"' >修改</a></td><td><a href='deladmin.do' class='"+data[i].id+"' >删除</a></td>  </tr>";
				
					}
				tablecontext+="<tr> <td>"+data[data.length-1].id+"</td><td>"+data[data.length-1].password+"</td><td>"+data[data.length-1].auth+"</td> <td><a href='mod' class='"+data[data.length-1].id+"' >修改</a></td><td><a href='deladmin.do' class='"+data[data.length-1].id+"'>删除</a></td> </tr></table></div >";
				tablecontext+="<br><center><input type='button' id='apageprevious' value='上一页' >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type='button' id='apagenext' value='下一页' > </center> ";
				   $("#context").empty();
					$("#context").append(tablecontext);
			  
				});
				return false;
			  
		  }
		  
	  });
	  
	
	
	$("#admintable a").live('click',function(){
		
		
		if($(this).html()=="修改")
		{
			$("#context").empty();
			var modadmin="<div id='moddiv' style='margin-left:100px; margin-top:50px; font-size:30px;' >	<font   style=' font-size: 60px;'>请重新输入管理员信息</font><br><form action='modadmin.do'>用户名：<input type='text' size='80' id='modid' disabled='true' value='"+$(this).attr('class')+"' /> <br><br><br>  密码 : &nbsp &nbsp  <input type='password' size='80' id='modpas' />  <br><br><br>  权限 :&nbsp &nbsp  <input type='text' size='80' id='modauth' /> <br><br><br> <a href='modadmin.do' id='mod2'><b>修改</b></a>  </form></div>";
			$("#context").append(modadmin);
			
			
			
			}
		if($(this).html()=="删除")
		{
			 var msg = "您真的确定要删除吗？\n\n请确认！"; 
			 if (confirm(msg)==true){ 
			
			 }else{ 
			  return false; 
			 } 
			 
			
			var id=$(this).attr("class");
			var url=$(this).attr("href");
			url+="?id='"+id+"'";
			var args={"time":new Date()};
			$.getJSON(url,args,function(data){
				if(data.result>0)
					{
					alert("成功");
					}
				else{
					alert("失败");
				}
				
				
				
			});
		
			}
		
		return false;
		
		
	});
	$("#mod2").live('click',function(){
		var url=this.href;
		
        var id=$("#modid").val();
        var password=$("#modpas").val();
        var auth=$("#modauth").val();
		var args={"time":new Date()};
	
		url+="?id="+id+"&password="+password+"&auth='"+auth;
alert(url);
		$.getJSON(url,args,function(data){
			if(data.result>0)
				{
				alert("成功");
				}
			else{
				alert("失败");
			}
			
			
			
		});
		
		
		return false;
		
		
	});
	
	$("#addadmin").live('click',function(){

		$("#context").empty();
		var addadmin="<div id='adddiv' style='margin-left:100px; margin-top:50px; font-size:30px;' >	<font   style=' font-size: 60px;'>请输入新的管理员信息</font><br><form action='addadmin.do'>用户名：<input type='text' size='80' id='addid'  /> <br><br><br>  密码 : &nbsp &nbsp  <input type='password' size='80' id='addpas' />  <br><br><br>  权限 :&nbsp &nbsp  <input type='text' size='80' id='addauth' /> <br><br><br> <a href='addadmin.do' id='addadminbutton'><b>确认添加</b></a>  </form></div>";
		$("#context").append(addadmin);
		
		return false;
		
	});
	$("#addadminbutton").live('click',function(){
		var id=$("#addid").val();
		var password=$("#addpas").val();
		var auth=$("#addauth").val();
		 var msg = "您真的确定要添加吗？\n\n请确认信息！ id="+id+" pasasword="+password+" auth="+auth+" \n\n请确认"; 
		 if (confirm(msg)==true){ 
		
		 }else{ 
		  return false; 
		 } 
		var url=this.href;
		var args={"time":new Date()};;
		url+="?id='"+id+"'&password='"+password+"'&auth='"+auth+"'";
      alert(url);
			$.getJSON(url,args,function(data){
				if(data.result>0)
					{
					alert("成功");
					}
				else{
					alert("失败");
				}
				
	
				
			});
		
			return false;
	});
	
	
  $("#showbook").click(function(){
	        page=1;
			var url="firstselbook.do";

			var args={"time":new Date()};
			$.getJSON(url,args,function(data){

			var tablecontext="";

			tablecontext+="<div style='float:left;margin-top:10px; margin-right:15px;' ><a href='addbook.do' id='addbook' >添加新的图书</a>  &nbsp &nbsp  &nbsp  &nbsp    根据图书名称查找    <input type='text' size='15' id='selbook' ><input type='button' value='查找' id='selbookbutton'> </div>  <div id='fenleisel' style='margin-top:10px;' >&nbsp&nbsp&nbsp&nbsp&nbsp  分类查找 :&nbsp &nbsp <a href='#'>历史类</a> &nbsp &nbsp<a href='#'>文学类</a> &nbsp &nbsp<a href='#'>科幻类</a>&nbsp &nbsp <a href='#'>军事类</a>   </div>      <div id='booktable' style='margin-top:40px;'><br><table  >  <tr> <td>编号</td><td>书名</td><td>数量</td><td>描述</td><td>价格</td>  </tr>";
			for(var i=0;i<data.length;i++)
				{
				 tablecontext+="<tr> <td>"+data[i].id+"</td><td>"+data[i].bookname+"</td><td>"+data[i].number+"</td><td>"+data[i].describe+"</td><td>"+data[i].price+" </td> </tr>";
			
				}
			tablecontext+="</table> </div ><br><center><input type='button' id='bpageprevious' value='上一页' >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type='button' id='bpagenext' value='下一页' > </center> ";

		    $("#context").empty();
			$("#context").append(tablecontext);
		
			});
			alert(allpage);
			allpage=<%= request.getParameter("allpage")%>;
			alert(allpage);
	  return false;
	 
	  
  });
  
  $("#bpageprevious").live('click',function(){
	  if(page==1)
		{
		  var msg = "已到第一页"; 
			confirm(msg);
			
		  return false; 
		  }
	  else{
		  page=page-1;
		  url="showbookbypage.do?page="+page;
			var args={"time":new Date()};
			$.getJSON(url,args,function(data){
		  var tablecontext="";

			tablecontext+="<br><table  >  <tr> <td>编号</td><td>书名</td><td>数量</td><td>描述</td><td>价格</td>  </tr>";
			for(var i=0;i<data.length;i++)
				{
				 tablecontext+="<tr> <td>"+data[i].id+"</td><td>"+data[i].bookname+"</td><td>"+data[i].number+"</td><td>"+data[i].describe+"</td><td>"+data[i].price+" </td> </tr>";
			
				}
			tablecontext+="</table> ";

		    $("#booktable").empty();
			$("#booktable").append(tablecontext);
		  
			});
		  
	  }
	  
  });
  
  $("#bpagenext").live('click',function(){
	 page=page+1;
	  if(page>allpage)
		{
		  page=page-1;
		  var msg = "已到最后一页"; 
			confirm(msg);
			
		  return false; 
		  }
	  else{
		
		  url="showbookbypage.do?page="+page;
			var args={"time":new Date()};
			$.getJSON(url,args,function(data){
		  var tablecontext="";

			tablecontext+="<br><table  >  <tr> <td>编号</td><td>书名</td><td>数量</td><td>描述</td><td>价格</td>  </tr>";
			for(var i=0;i<data.length;i++)
				{
				 tablecontext+="<tr> <td>"+data[i].id+"</td><td>"+data[i].bookname+"</td><td>"+data[i].number+"</td><td>"+data[i].describe+"</td><td>"+data[i].price+" </td> </tr>";
			
				}
			tablecontext+="</table> ";

		    $("#booktable").empty();
			$("#booktable").append(tablecontext);
		  
			});
		  
	  }
	  
  });
  
	
  $("#addbook").live('click',function(){

		$("#context").empty();
		var addbook="<div id='adddiv' style='margin-left:100px; margin-top:5px; font-size:30px; ' >	<font   style=' font-size: 30px; '>请输入新的图书信息</font><br><form action='addbook.do'><br>图书 &nbsp id:&nbsp&nbsp&nbsp&nbsp&nbsp<input type='text' size='80' id='addid'  /> <br><br>  图书名字: &nbsp &nbsp  <input type='text' size='80' id='addname' />  <br> <br>  图书数量 :&nbsp &nbsp  <input type='text' size='80' id='booknumber' /> <br> <br>图书描述:&nbsp&nbsp&nbsp&nbsp<textarea rows='8' cols='50' id='bookdescribe'></textarea> <br>  <br>图书价格:&nbsp&nbsp&nbsp&nbsp<input type='text' size='80' id='bookprice' /> <br> <br> <a href='addbook.do' id='addbookbutton'><b>确认添加</b></a>  </form></div>";
		$("#context").append(addbook);
		
		return false;
		
	});
 
  

		 $("#addbookbutton").live('click',function(){
				var id=$("#addid").val();
				var name=$("#addname").val();
				var number=$("#booknumber").val();
				var describe=$("#bookdescribe").val();
				var price=$("#bookprice").val();
				 var msg = "您真的确定要添加吗？\n\n请确认信息！ id="+id+"\n name='"+name+"' \n number="+number+"\n describe='"+describe+"'\n price="+price+" \n\n请确认"; 
				 if (confirm(msg)==true){ 
				
				 }else{ 
				  return false; 
				 } 
		       	var url="";
				 url+=this.href;
					var args={"time":new Date()};
					 
					url+="?id="+id+"&name="+name+"&number="+number+"&des="+describe+"&price="+price;
				  
				
						$.getJSON(url,args,function(data){
							if(data.result>0)
								{
								alert("成功");
								}
							else{
								alert("失败");
							}
						
						});
			
				
					return false;
			});
		


		 $("#jiebook").click(function(){

				$("#context").empty();
				var addadmin="<div id='jiebookdiv' style='margin-left:100px; margin-top:50px; font-size:30px;' >	<font   style=' font-size: 40px;'>请输入借书信息</font><br><br><form action='jiebook.do'>所借书名:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type='text' size='80' id='jiebookname'  /> <br><br><br> 借书人卡号 : &nbsp &nbsp  <input type='text' size='80' id='peopleid' />  <br><br><br>  <a href='jiebook.do' id='jiebookbutton'><b>确认借阅</b></a>  </form></div>";
				$("#context").append(addadmin);
				
				return false;
				
			});
		 $("#jiebookbutton").live('click',function(){
			 var bookname=$("#jiebookname").val();
				var peopleid=$("#peopleid").val();
				 var msg = "您真的确定要借阅吗？"; 
				 if (confirm(msg)==true){ 
				
				 }else{ 
				  return false; 
				 } 
		       	var url="";
				 url+=this.href;
				 url+="?jiebookname="+bookname+"&peopleid="+peopleid;
				 var args={"time":new Date()};
					$.getJSON(url,args,function(data){
						if(data.result>0)
							{
							alert("成功");
							}
						else{
							alert("失败");
						}
					
					});
		
			
				return false;
				 
		 });
		 
		 $("#showborrow").click(function(){
			
			  var url=this.href;
			  var args={"time":new Date()}; 
			  var tablecontext="";
			  $.getJSON(url,args,function(data){
				  
				  tablecontext+="<div id='borrowdiv' style='margin-top:40px; margin-left:100px;'><br><table  id='borrowtable' >  <tr> <td>书名</td><td>卡号</td>  </tr>";
					for(var i=0;i<data.length;i++)
						{
						 tablecontext+="<tr> <td>"+data[i].jiebookname+"</td><td>"+data[i].peopleid+" </td> </tr>";
					
						}
					tablecontext+="</table></div >";
					 $("#context").empty();
			         	$("#context").append(tablecontext);
				  
			  });
			
			 
			 return false;
			 
		 });
		 
		 $("#huanbook").click(function(){

				$("#context").empty();
				var addadmin="<div id='huanbookdiv' style='margin-left:100px; margin-top:50px; font-size:30px;' >	<font   style=' font-size: 40px;'>请输入还书信息</font><br><br><form action='huanbook.do'>所还书名:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type='text' size='80' id='huanbookname'  /> <br><br><br> 还书人卡号 : &nbsp &nbsp  <input type='text' size='80' id='peopleid' />  <br><br><br>  <a href='huanbook.do' id='huanbookbutton'><b>确认归还</b></a>  </form></div>";
				$("#context").append(addadmin);
				
				return false;
				
			});
		 $("#huanbookbutton").live('click',function(){
			 var bookname=$("#huanbookname").val();
				var peopleid=$("#peopleid").val();
				 var msg = "您确定要归还吗？"; 
				 if (confirm(msg)==true){ 
				
				 }else{ 
				  return false; 
				 } 
		       	var url="";
				 url+=this.href;
				 url+="?jiebookname="+bookname+"&peopleid="+peopleid;
				 var args={"time":new Date()};
					$.getJSON(url,args,function(data){
						if(data.result>0)
							{
							alert("成功");
							}
						else{
							alert("失败");
						}
					
					});
		
			
				return false;
				 
		 });
	
		 $("#selbookbutton").live('click',function(){
			 
			 
			 var url="selbookbyname.do";
			 var bookname=$("#selbook").val();
                  url+="?bookname="+bookname;
				var args={"time":new Date()};
				$.getJSON(url,args,function(data){

				var tablecontext="";

				tablecontext+="<div id='booktable' style='margin-top:40px;'><br><table  id='booktable' >  <tr> <td>编号</td><td>书名</td><td>数量</td><td>描述</td><td>价格</td>  </tr>";
				for(var i=0;i<data.length;i++)
					{
					 tablecontext+="<tr> <td>"+data[i].id+"</td><td>"+data[i].bookname+"</td><td>"+data[i].number+"</td><td>"+data[i].describe+"</td><td>"+data[i].price+" </td> </tr>";
				
					}
				tablecontext+="</table></div >";

			    $("#booktable").empty();
				$("#booktable").append(tablecontext);
				});
				return false;
			 
		 });
		 $("#fenleisel a").live('click',function(){
			 var leibie=$(this).text();		
			 var url="selbookbycat.do?cat="+leibie;
			 var args={"time":new Date()};
			 $.getJSON(url,args,function(data){
				   var tablecontext="";
					tablecontext+="<div id='booktable' style='margin-top:40px;'><br><table  id='booktable' >  <tr> <td>编号</td><td>书名</td><td>数量</td><td>描述</td><td>价格</td>  </tr>";
					for(var i=0;i<data.length;i++)
						{
						 tablecontext+="<tr> <td>"+data[i].id+"</td><td>"+data[i].bookname+"</td><td>"+data[i].number+"</td><td>"+data[i].describe+"</td><td>"+data[i].price+" </td> </tr>";
					
						}
					tablecontext+="</table></div >";

				    $("#booktable").empty();
					$("#booktable").append(tablecontext);
				 
				 
			 });
			 
			 
			 return false;
		 });
		 
})




</script>