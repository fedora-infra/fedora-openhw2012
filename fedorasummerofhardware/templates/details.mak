<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Fedora Summer of Fun</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Fedora Summer of Fun: project description and application form.">
    <meta name="author" content="The Fedora Project">

    <link rel="stylesheet/less" href="${request.static_url('fedorasummerofhardware:static/less/bootstrap.less')}">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="http://fedoraproject.org/favicon.ico" />
  </head>

  <body>
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

      <div class="row" id="goodies">
        <div class="span4" id="olpc">
        <img src="${request.static_url('fedorasummerofhardware:static/img/photo-olpc.png')}" id="olpc-photo">
        <img src="${request.static_url('fedorasummerofhardware:static/img/logo-olpc.png')}" id="logo-olpc">
      <div class="starburst"><span>50</span> units</div>
      <h2>OLPC 1.75</h2>
        </div>
        <div class="span4" id="raspi">
        <img src="${request.static_url('fedorasummerofhardware:static/img/photo-raspi.png')}" id="raspi-photo">
        <img src="${request.static_url('fedorasummerofhardware:static/img/logo-raspi.png')}" id="logo-raspi">
      <div class="starburst"><span>150</span> units</div>
          <h2>Raspberry Pi</h2>
       </div>
        <div class="span4" id="arduino">
        <img src="${request.static_url('fedorasummerofhardware:static/img/photo-arduino.png')}" id="arduino-photo">
      <div class="starburst"><span>20</span> units</div>
      <h2>Arduino + Shield</h2>
        </div>
      </div>

        <p>Have fun with open hardware this summer! To thank the Fedora community for all that they do for free software, we are offering over 200 open hardware devices for Fedora contributors in a random drawing. </p>

      </div>

      <div id="box">

% if winners:
    <h2>Winners</h2>
    <table class="table table-bordered table-condensed">
    % for winner in winners:
        <tr><td>${winner.realname}</td><td>${winner.hardware}</td></tr>
    % endfor
    </table>
% else:
        <h2><a href="${request.route_url('home')}">Apply Today!</a></h2>
% endif

        <div id="box-content">

        <p>To be eligible to enter the 2012 Fedora Summer of Open Hardware
Sweepstakes (the “Promotion”), Participant must be:</p>
<ol>
<li>a legal resident of <strong>Australia</strong> (excluding the states of <strong>New South Wales</strong> and <strong>the Australian
Capital Territory</strong>), <strong>Belgium</strong>, <strong>Canada</strong> (excluding <strong>Quebec</strong>), <strong>Germany</strong>, 
<strong>India</strong>, <strong>Japan</strong>, <strong>the Netherlands</strong>, <strong>New Zealand</strong>, <strong>Singapore</strong>, 
<strong>South Korea</strong>, <strong>Spain</strong>, <strong>Sweden</strong>, <strong>United Kingdom</strong>, or 
<strong>the United States</strong>;</li>
<li>of the age of majority in his/her jurisdiction of residence at the time of entry; and</li>
<li>an existing Fedora Contributor (“Participant”). For purposes of the
Promotion, a “Fedora Contributor” is defined as an individual who: 
<ul>
  <li>has an existing Fedora Account created prior to the start of the
Promotional Period;</li>
  <li>has agreed to and signed the Fedora Project
Contributor Agreement; and</li>
  <li>is in one additional Fedora Account “group.”</li>
  </ul>
  </li>
  </ol>
  <p>Employees of Red Hat, Inc. and each of its respective
affiliated companies, subsidiaries, advertising or promotional agencies,
and other agents, and the immediate family members of, and any persons
domiciled with, such employees are not eligible to enter. Government
employees and contractors are not eligible to enter.</p>

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

    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${request.static_url('fedorasummerofhardware:static/js/less-1.3.0.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/jquery-1.7.2.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-transition.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-alert.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-modal.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-dropdown.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-scrollspy.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-tab.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-tooltip.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-popover.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-button.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-collapse.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-carousel.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-typeahead.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/charCount.js')}"></script>

    <script type="text/javascript">
        $(document).ready(function(){
        $("#proposal").charCount({ allowed: 500, warning: 20, counterText: 'Characters left: ' });
    });
    </script>

    <script type="text/javascript">
      // This makes the FAS 'Fedora Password' text field have a
      // readable text label that isn't obfuscated by the password '*'s

      $(document).ready(function() {
    $("input[name='password']").prop("type", "text").val("Fedora password");});
    $("input[name='password']").focus(function() {
      if($(this).val() === "Fedora password")
      {
        $(this).prop("type", "password").val("");
      }
    });

    $("input[name='password']").blur(function() {
      if(!$(this).val().length)
      {
        $(this).prop("type", "text").val("Fedora password");
      }
    });

    </script>
    <script type="text/javascript">
      // By default, Arduino shield selections are hidden.
      // This makes them appear when you choose the Arduino for your
      // hardware, and hides them if you choose Raspberry Pi or OLPC.

      $('#pick-arduino').click(function() {
    $('#pick-shield').show('slow', function() {
      //Animation complete.
    });
      });

      $('#pick-raspi').click(function() {
    $('#pick-shield').hide('slow', function() {
    });
      });

      $('#pick-olpc').click(function() {
    $('#pick-shield').hide('slow', function() {
    });
      });

    </script>


  </body>
</html>
