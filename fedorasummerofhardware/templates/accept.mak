<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Fedora Summer of Fun</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Fedora Summer of Fun: project description and application form.">
    <meta name="author" content="The Fedora Project">
    <link rel="shortcut icon" href="https://fedoraproject.org/static/images/favicon.ico" />
    ##<link rel="stylesheet/less" href="${request.static_url('fedorasummerofhardware:static/less/bootstrap.less')}">
    <link rel="stylesheet" type="text/css" href="${request.static_url('fedorasummerofhardware:static/css/compressed.css')}" media="all" />

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body id="accept">
  <div class="container">
    <% flash = '. '.join(request.session.pop_flash()) %>
    % if flash:
      % if flash.startswith('Error:'):
        <div class="alert alert-error">
          <h4 class="alert-heading">Error</h4>
          ${flash[7:]}
        </div>
      % else:
        <div class="alert alert-success">
          <h4 class="alert-heading">Success!</h4>
          ${flash}
        </div>
      %endif
    % endif

      <!-- Main hero unit for a primary marketing message or call to action -->
      <div class="hero-unit">
        <a href="http://fedoraproject.org" id="fedora">Fedora</a>
    <h1>Summer of Open Hardware and Fun!</h1>

	  </div>
  <div id="box">
    
    <div id="box-content">
      <div class="row">
        <div class="span9 offset1">
	  <h2>Congratulations!</h2>
	  <p>We just need a few more details from you to ship your open hardware to you:</p>
    <form name="application" method="POST" action="${request.route_url('save_address')}" onsubmit="return doSubmit();">
        <fieldset>
          <legend>Your Fedora Account login information:</legend>

          <label><span style="display: none;">Fedora Username:</span></label>
        <input value="" name="username" class="span5" type="text" placeholder="Fedora username" value="Fedora username">

          <label><span style="display: none;">Fedora Password:</span></label> 
        <input value="" name="password" class="span5" type="password" placeholder="Fedora password" value="Fedora password">
        <label><span style="display: none;">Phone:</span></label>
        <input name="phone" type="text" class="span5" placeholder="Phone Number" value="">
         <label><span style="display: none;">Mailing Address</span></label> 
        <textarea id="address" name="address" rows="4" class="span5" placeholder="Your Mailing Address"></textarea>
	</fieldset>
	<fieldset>
	<button class="btn" id="submit-addy-button" type="submit" value="Submit your address">Submit your Address</button>
	</fieldset>
    </form>
  </div>
  
</div>
</div>
  
      <hr>
      
      <footer>

	<ul>
	  <li><a href="http://www.redhat.com/legal/privacy_statement.html">Red Hat Privacy Policy</a></li>
	  <li><a href="https://fedoraproject.org/wiki/Legal/PrivacyPolicy">Fedora Privacy Policy</a></li>
	  <li><a href="http://github.com/lmacken/fedora-openhw2012">Source Code</a></li>
	</ul>

	<p>Copyright &copy; 2012 <a href="http://redhat.com">Red Hat, Inc.</a></p>

      </footer>
      
</div>

</body>
<script>
function doSubmit(){
    if (typeof($('#address').val()) == 'undefined') {
        alert('You must enter an address');
        return false;
    }
    return true;
}
</script>
##<script src="${request.static_url('fedorasummerofhardware:static/js/less-1.3.0.min.js')}"></script>
<script src="${request.static_url('fedorasummerofhardware:static/js/jquery-1.7.2.min.js')}"></script>
<script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-alert.min.js')}"></script>
<script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-button.min.js')}"></script>
</html>
