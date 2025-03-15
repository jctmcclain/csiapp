require "sinatra"
require "erb"

# https://sinatrarb.com/configuration.html
set :bind, '0.0.0.0'
# set :port, 80


get "/" do
	@ptitle = 'CSI 360 SN Registry'
	erb :index
end

post "/serialnumber/" do
	@ptiltle = 'CSI 360 SN Registry - Results'
	@sn = params['sn']
  if params['sn']=="AB1234"
@htmldump = <<-OUTTEXT
<div class="notification is-success"">
You have chosen wisely
</div>
<h3>TERRY BROWN</h3>
<h4>Residential Address</h4>
<p>
840 Coffee Run Rd.<br>
Smithfield Township, PA<br>
</p>
<p>
<h4>Personal Information</h4>
</p>
<table>
<thead>
	<tr><th>Attribute</th><th>Value</th></tr>
</thead>
<tbody>
	<tr><td>Age:</td><td>30</td></tr>
	<tr><td>Employer:</td><td>Government/Restricted</td></tr>
	<tr><td>Firearm Make</td><td>Ckolg</td></tr>
	<tr><td>Caliber</td><td>9mm</td></tr>
	<tr><td>Serial Number</td><td>AB1234</td></tr>
	<tr><td>Model</td><td>Sub-C-9</td></tr>
</tbody>
</table>

OUTTEXT


  else 
@htmldump = <<-OUTTEXT
<div class="notification is-danger">
<p>You have chosen poorly.</p>
<p>No results found..</p>
</div>

OUTTEXT
  end
  erb :results
end