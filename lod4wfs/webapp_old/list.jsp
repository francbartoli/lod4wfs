<%@ page import="java.io.*"%>
<%@ page import="de.ifgi.lod4wfs.core.*"%>
<%@ page import="de.ifgi.lod4wfs.facade.*"%>
<%@ page import="de.ifgi.lod4wfs.factory.*"%>
<%@ page import="java.util.ArrayList"%>

<HTML>
<HEAD>
<TITLE>LOD4WFS Administration Interface</TITLE>
</HEAD>

<BODY>
	<a href="index.jsp">Home</a>
	<a href="new.jsp">Create New Query</a>
<h1>SPARQL Queries available</h1>


<FORM NAME="form1" >
	<table border="1">
		<tr>
			<td>Name</td>
			<td>Title</td>
			<td>Abstract</td>
			<td>Keywords</td>
			<td>Endpoint</td>
			<td>Query</td>
		</tr>
		<%
	        
	        ArrayList<WFSFeature> dynamicFeatures = new ArrayList<WFSFeature>();
			
			dynamicFeatures = Facade.getInstance().listDynamicFeatures();
			
			for (int i = 0; i < dynamicFeatures.size(); i++) {
				%><tr><%
				%><td><%out.println(dynamicFeatures.get(i).getName());%></td><%
				%><td><%out.println(dynamicFeatures.get(i).getTitle());%></td><%
				%><td><%out.println(dynamicFeatures.get(i).getFeatureAbstract());%></td><%
				%><td><%out.println(dynamicFeatures.get(i).getKeywords());%></td><%
				%><td><%out.println(dynamicFeatures.get(i).getEndpoint());%></td><%
				%><td><%out.println(dynamicFeatures.get(i).getQuery().toString()); %></td><%				
				%><td><a href="list.jsp?delete=<%=dynamicFeatures.get(i).getFileName()%>"> Delete</a></td><%
				%><td>Edit</td><%
				%></tr><%
				
				//out.println(dynamicFeatures.get(i).getQuery().toString());
				 
			}
		%>
	
	</table>
</FORM>

		<script type="text/javascript">
		   
		function deleteFeature(file) {
			
			if (confirm('Are you sure you want to delete ' + file + '?')) {
			    							
				alert("<%=GlobalSettings.getSparqlDirectory()%>" + file + " deleted.");
						    
							    		
			} else {

			}
		}
		
		</script>

	
		
 		<%
		
 		if(request.getParameter("delete")!= null){
	 		String path = GlobalSettings.getSparqlDirectory()+request.getParameter("delete");
	 		
			WFSFeature feature = new WFSFeature();
	 		feature.setFileName(path);
	 		
			Facade.getInstance().deleteFeature(feature);	
		%>
			<script type="text/javascript">
			window.open("list.jsp","_self")
			</script>
		<%	
		out.println("SPARQL " + request.getParameter("delete") + " deleted.");
 		}
 		%> 
		
		
</BODY>

</HTML>
