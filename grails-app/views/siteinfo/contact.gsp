<html>

<head>
	<title><g:message code="Contact"/></title>
	<meta name="layout" content="kickstart" />
</head>

<body>

	<section id="intro">
		<p class="lead">
		Pentru orice alte informaţii, vă stăm la dispoziţie!
		</p>
	</section>

	<section id="address">
	<div class="row">
		<div class="span4">
			<h1><g:message code="Adresa :"/></h1>
				<address>
					<strong>${meta(name:'app.name')}, Inc.</strong><br>
					 Strada Stavropoleos 5<br>
					 Sector 6, Bucuresti.<br>
					 <br>
				</address>
				<address>
					<div class="row">
						<span class="span1">
							<strong><abbr title="Phone">Phone</abbr></strong>
						</span>
						<span class="span3">
							(123) 456-7890
						</span>
					</div>
					<div class="row">
						<span class="span1">
							<strong><abbr title="Fax">Fax</abbr></strong>
						</span>
						<span class="span3">
					    +49 (0) 72 27 - 95 35 - 605
						</span>
					</div>
				</address>
				<address>
					<div class="row">
						<span class="span1">
							<strong>Email</strong>
						</span>
						<span class="span3">
					    	<a href="mailto:info@${meta(name:'app.name')}.com">info@${meta(name:'app.name')}.com</a>
						</span>
					</div>
				</address>
			</div>
			
			<div class="span8">
				<iframe width="100%" scrolling="no" height="300" frameborder="0" 
					src="http://maps.google.ca/maps?f=q&source=s_q&hl=en&geocode=&q=123+Future+Ave,San+Francisco,+CA+94107&ie=UTF8&hq=&hnear=Downtown,San+Francisco,+CA+94107&z=12&iwloc=near&output=embed"
		 			marginwidth="0" marginheight="0"></iframe>
			</div>
		</div>
	</section>

</body>

</html>
