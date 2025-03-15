require "sinatra"
require "erb"

# https://sinatrarb.com/configuration.html
set :bind, '0.0.0.0'
# set :port, 80

$layout = <<-LAYOUTOUTPUT
<html><head>
<title>CSI 360 SN Registry</title>
<style type="text/css">
   #wisely {color:green;font-family:verdana;font-size:18pt;}
   #poorly {color:red;font-family:verdana;font-size:18pt;}
</style>
</head>
<body>
<%= yield %>
</body>
</html>
LAYOUTOUTPUT

def dothethings(tmpl)
  erb tmpl, { :locals => params, :layout => $layout }
end

get "/" do
	template="<h1>CSI 360 SN Registry</h1>"
htmlform = <<-HTMLFORMOUT	
<form name="nme" method="post" action="/serialnumber/">
<table cellspacing="10" cellpadding="10">
<tr>
<td><input name="sn" type="text"></input></td>
<td><input name="btnsn" type="submit" value="Search"></input></td>
</tr>
</table>
</form>
HTMLFORMOUT
	template += htmlform
	dothethings(template)
end

post "/serialnumber/" do
  template = "<h1>You searched for:</h1>"
  template += "<p><h3><%= sn %></h3></p>" 
  template += "<p><h3>Results</h3></p>"
  
  if params[:sn]=="AB1234"
  	template += '<div id="wisely" class="wisely">'
  	template += 'You have chosen wisely'
  	template += '</div>'
htmldump = <<-OUTTEXT
<h4>TERRY BROWN</h4>
<p><b>Address</b></p>
840 Coffee Run Rd.<br>
Smithfield Township, PA<br>
<p><b>Person Information</b></p>
<table>
<tr><td>Age:</td><td>30</td></tr>
<tr><td>Employer:</td><td>Government/Restricted</td></tr>
<tr><td>Firearm Make</td><td>Ckolg</td></tr>
<tr><td>Caliber</td><td>9mm</td></tr>
<tr><td>Serial Number</td><td>AB1234</td></tr>
<tr><td>Model</td><td>Sub-C-9</td></tr>
</table>

OUTTEXT
	
  	template += htmldump
  	template += '<a href="/">Search again..</a>'

  else 
  	template += '<div id="poorly" class="poorly">'
	template += '<p>You have chosen poorly.</p>'
	template += '<p>No results found..</p>'
  	template += '</div>'
  	template += '<a href="/">Search again..</a>'
  end
  
  dothethings(template)
end