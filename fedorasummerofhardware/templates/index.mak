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
      
      
    <div class="modal hide fade" id="guidelines" style="display: none;">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">×</button>
        <h3>Fedora Summer of Open Hardware Sweepstakes Eligibility</h3>
      </div>
      <div class="modal-body">
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

<p>For more details and full sweepstakes rules, please see: <a href="${request.route_url('details')}">${request.route_url('details')}</a>.</p>
      </div>
      <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal">Close</a>
      </div>
    </div>

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
          <form name="application" method="POST" action="${request.route_url('submit')}" onsubmit="return doSubmit();">

    <h2>Apply Today!</h2>
    
    <div id="box-content">
      <div class="row">
        <div class="span6 offset1">
          <h3>Application Form</h3>
          <p>Applications accepted until <strong>July 31, 2012</strong>.</p>


        <fieldset>
          <legend>Your name:</legend>

          <label><span style="display: none;">Your name:</span></label>
        <input value="" name="realname" type="text" class="span5" placeholder="Your full name" value="Your full name">
        </fieldset>

        <fieldset>
          <legend>Your Fedora Account login information:</legend>

          <label><span style="display: none;">Fedora Username:</span></label>
        <input value="" name="username" type="text" class="span5" placeholder="Fedora username" value="Fedora username">

          <label><span style="display: none;">Fedora Password:</span></label> 
        <input value="" name="password" type="password" class="span5" placeholder="Fedora password" value="Fedora password">
        </fieldset>

      </div>
      
        <div class="span4">
          <h4>To Qualify:</h4>
          <ol>
        <li><p>You must have a Fedora Project Account.</p></li>
        <li><p>You must have signed the Fedora Project Contributor Agreement.</p></li>
        <li><p>You must be a member of at least one non-CLA / FPCA Fedora Group.</p></li>
        <li><p>You are a legal resident of a participating country.</p></li>
          </ol>
      <p><a id="guidelines-link" href="#guidelines" data-toggle="modal">Full contest rules and eligibility guidelines</a>.</p>
        </div>
      </div>
      <div class="row">
        <div class="span9 offset1">
          <fieldset>
        <legend>Which device are you most interested in?</legend>
          <span class="help-block">(Only one entry per Fedora account.)</span>
        <label class="radio" for="pick-olpc">
          <input name="hardware" value="olpc" type="radio" id="pick-olpc">
        OLPC <em>1.75</em>
            <div class="description">
            <img src="${request.static_url('fedorasummerofhardware:static/img/photo-olpc.png')}">
              The  One Laptop Per Child (OLPC) 1.75 is an ARM-based, low-power laptop aimed at introducing children to technology and learning materials. More information is available at <a href="http://laptop.org">laptop.org</a>.
            </div>
        </label>
        <label class="radio" for="pick-raspi">
          <input name="hardware" value="raspberrypi" type="radio" id="pick-raspi">
          Raspberry Pi <em>Model B</em>
            <div class="description">
            <img src="${request.static_url('fedorasummerofhardware:static/img/photo-raspi.png')}">
              The Raspberry Pi is a tiny ARM-based computer, about the size of your palm, that can be connected to a TV and a keyboard. More information is available at <a href="http://raspberrypi.org">raspberrypi.org</a>.
            </div>
        </label>
        <label class="radio" for="pick-arduino">
          <input name="hardware" value="arduino" type="radio" id="pick-arduino">
          Arduino <em>+ Your choice of shield</em>
            <div class="description">
            <img src="${request.static_url('fedorasummerofhardware:static/img/photo-arduino.png')}">
              The Arduino is a single-board microcontroller with an open hardware design and open source compiler and boot loader, expandable with add-ons called 'shields.' More information is available at <a href="http://arduino.cc">arduino.cc</a>
              <fieldset id="pick-shield" style="display: none;">
            <legend>Which shield would you like included with your Arduino?</legend>
            <label class="radio" for="pick-ethernet">
              <input name="shield" value="ethernet" type="radio" id="pick-ethernet">
              Ethernet Shield
              <a href="http://www.adafruit.com/products/201">(More info)</a>
            </label>
            <label class="radio" for="pick-motor">
              <input name="shield" value="motor" type="radio" id="pick-motor">
              Motor / Servo / Stepper Shield
              <a href="http://www.adafruit.com/products/81">(More info)</a>
            </label>
            <label class="radio" for="pick-game">
              <input name="shield" value="game" type="radio" id="pick-game">
              Video Game Shield
              <a href="https://www.sparkfun.com/products/10226">(More info)</a>
            </label>
            <label class="radio" for="pick-audio">
              <input name="shield" value="audio" type="radio" id="pick-audio">
              Audio Shield
              <a href="http://www.adafruit.com/products/94">(More info)</a>
            </label>
            <label class="radio" for="pick-lcd">
              <input name="shield" value="lcd" type="radio" id="pick-lcd">
              6x12 LCD Shield
              <a href="http://www.adafruit.com/products/716">(More info)</a>
            </label>
            <label class="radio" for="pick-temp">
              <input name="shield" value="temp" type="radio" id="pick-temp">
              Light/Temperature Logger Shield
              <a href="http://www.adafruit.com/products/249">(More info)</a>
            </label>
            <label class="radio" for="pick-tft">
              <input name="shield" value="tft" type="radio" id="pick-tft">
              18-bit TFT with Joystick Shield
              <a href="http://www.adafruit.com/products/802">(More info)</a>
            </label>
            <label class="radio" for="pick-rfid">
              <input name="shield" value="rfid" type="radio" id="pick-rfid">
              Near-Field Communications (NFC) / RFID Shield
              <a href="http://www.adafruit.com/products/789">(More info)</a>
            </label>
              </fieldset>
              </label>

            </div>
          </fieldset>


          <fieldset id="proposal-set">
        <legend>In 500 characters or less, please tell us what fun projects you intend to use your open hardware device for.</legend>
            <em>Providing this additional information is optional and not required to register for the promotion.</em>
        <textarea name="text" id="proposal"></textarea>
        </fieldset>

        <fieldset id="country-set">
        <legend>I am a legal resident of the following country / region:</legend>
        <select class="span5" id="country-select" name="country">
          <option value="">Select a Country</option>
        % for country in ('Australia (excluding the states of New South Wales and the Australian Capital Territory)', 'Belgium', 'Canada (excluding Quebec)', 'Germany', 'India', 'Japan', 'Netherlands', 'New Zealand', 'Singapore', 'South Korea', 'Spain', 'Sweden', 'United Kingdom', 'United States'):
            <option>${country}</option>
        % endfor
        </select>
        </fieldset>

        <div id="us-states" style="display:none">
            <fieldset id="us-state-set">
            <select class="span5" id="us-state-select" name="state">
                <option value="">Select a State</option>
            % for abbrev, state in states:
                <option id="${abbrev}">${state}</option>
            % endfor
            </select>
            </fieldset>
            <div class="alert alert-info">
                Due to the amount of money involved, residents of NY and FL may not enter this sweepstakes.
            </div>
        </div>

        <fieldset>
          <button class="btn" id="submit-button" type="submit" value="Submit your entry!">
        Submit your entry!
          </button>
       </fieldset>
      
      <p id="marketing-notice"><em>You will <strong>not</strong> receive any marketing communications from Red Hat from
filling out this form. Red Hat will <strong>not</strong> share your contact information
provided on this form with its authorized business partners.</em></p>

      </div>
      
        </form>
    
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

      <script>
        function doSubmit(){
          var hw = $('input:radio[name=hardware]:checked').val();
          if (typeof(hw) == 'undefined') {
              alert('You must select a type of hardware');
              return false;
          }
          return true;
        }

        $(document).ready(function(){
            $('#country-select').change(function(ev){
                if ($('#country-select').val() == "United States") {
                    $('#us-states').show();
                } else {
                    $('#us-states').hide();
                }
            });
        });
      </script>


  </body>
</html>
