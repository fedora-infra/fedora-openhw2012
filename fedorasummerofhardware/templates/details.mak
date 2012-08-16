## -*- coding: utf-8 -*-
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Fedora Summer of Fun</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Fedora Summer of Fun: project description and application form.">
    <meta name="author" content="The Fedora Project">

    ##<link rel="stylesheet/less" href="${request.static_url('fedorasummerofhardware:static/less/bootstrap.less')}">
    <link rel="stylesheet" type="text/css" href="${request.static_url('fedorasummerofhardware:static/css/compressed.css')}" media="all" />

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="http://fedoraproject.org/favicon.ico" />
  </head>

  <body id="details">
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
	        <h2>2012 Fedora Summer of Open Hardware Sweepstakes Official Rules</h2>

	<p class="intro">NO PURCHASE NECESSARY TO ENTER OR TO WIN. A PURCHASE WILL NOT INCREASE YOUR ODDS OF WINNING. VOID WHERE PROHIBITED.</p>
	<p class="intro">ENTRY IN THIS PROMOTION CONSTITUTES YOUR ACCEPTANCE OF THESE OFFICIAL RULES.</p>
	<ol>
	  <li><strong>Eligibility</strong>. To be eligible to enter the 
	  2012 Fedora Summer of Open Hardware Sweepstakes (the 
	  “Promotion”), Participant must be: 
	    <ol>
	      <li>A legal resident of Australia (excluding the states of 
	    New South Wales and the Australian Capital Territory), 
	    Belgium, Canada (excluding Quebec), Germany, India, Japan, 
	    the Netherlands, New Zealand, Singapore, South Korea, 
	    Spain, Sweden, United Kingdom, or the United States 
	    (excluding New York and Florida);</li>
	      <li>Of the age of majority in his/her jurisdiction of 
	  residence at the time of entry; and</li>
	      <li>An existing Fedora Contributor (“Participant”). For 
	  purposes of the Promotion, a “Fedora Contributor” is defined 
	  as an individual who:
		<ul class="letters">
		  <li>Has an existing Fedora Account created prior to the 
	      start of the Promotional Period;</li>
		  <li>Has agreed to and signed the Fedora Project 
	      Contributor Agreement (“FPCA”); and</li>
		  <li>Is a member of at least one additional Fedora 
	      contributor “group” aside from the FPCA group.</li>
		</ul>
	 
	  <p>Employees of Red Hat, Inc. and each of its respective 
	  affiliated companies, subsidiaries, advertising or 
	  promotional agencies, and other agents, and the immediate 
	  family members of, and any persons domiciled with, such 
	  employees are not eligible to enter. <strong>Government 
	  employees and contractors are not eligible to enter.</strong>
	  </p></li></ol></li>
	  
	  <li><strong>Entry</strong>. NO PURCHASE NECESSARY TO ENTER OR 
	  WIN. VOID WHERE PROHIBITED. The Promotion begins on July 25, 
	  2012 at 12:00 PM (noon) Eastern Daylight Time (EDT) and all 
	  ntries must be received by August 15, 2012 at 12:00 PM (noon) 
	  EDT (the “Promotional Period”). To enter, visit 
	  https://fedoraproject.org/openhw2012 (“Promotion Website”). 
	  The Promotion Website shows three (3) open hardware devices: 
	  an OLPC XO-1.75 laptop computer, a Raspberry Pi, and an 
	  Arduino Uno R3 (Atmega328—assembled) with your choice of one 
	  of the following matching “shields”: Ethernet Shield, 
	  Motor/Servo/Stepper Shield, Video Game Shield, Audio Shield, 
	  16x2 LCD Shield, Light & Temperature Logger Shield, 18-bit TFT 
	  with Joystick Shield, or NFS/RFID Shield) (“Prizes”). should 
	  your choice of shield be unavailable for any reason, Sponsor 
	  reserves the right to substitute a different shield. There 
	  will be a separate drawing to select the winners of each 
	  Prize, for a total of three (3) drawings. You must select 
	  which drawing you wish to enter by selecting the Prize you 
	  would most like to win. You may only enter one of the 
	  drawings. After you select your desired Prize, Entry in the 
	  Promotion is completed by completing all required information 
	  on the registration form (“Entry”). You may be asked to 
	  answer optional questions, but you are not required to answer 
	  any optional questions to be eligible for entry in the 
	  Promotion.
	  <p>Entries actually received by Sponsor within the 
	  Promotional Period will be included in the Prize Drawings. 
	  Use of automated entries or programs or entries submitted by 
	  third parties is prohibited and such entries will be 
	  disqualified. Sponsor will not be responsible for Entries 
	  that are in whole or part illegible, incomplete, damaged, 
	  altered, counterfeit, manipulated or obtained through fraud, 
	  or for lost, late, misdirected, mutilated, incomplete, or 
	  illegible entries or email, or for any computer-related, 
	  online, telephonic, or technical malfunctions that may occur 
	  whether or not within Sponsor’s control, and such Entries are 
	  void. In the event of a dispute, an Entry will be deemed to 
	  have been submitted by the owner of the email account entered 
	  on the registration form at the time of entry. For these 
	  purposes, an email account holder shall mean the natural 
	  person assigned to such email account by the Internet access 
	  provider, online service provider or other organization 
	  responsible for assigning email addresses for the domain 
	  associated with such email account. Any questions regarding 
	  the number of Entries submitted or the owner of an email 
	  account shall be determined by Sponsor, in its sole 
	  discretion, and Sponsor reserves the right to disqualify any 
	  Entries by persons determined to be tampering with or abusing 
	  any aspect of the Promotion. Normal Internet, phone and usage 
	  charges imposed by your online or phone service may apply. 
	  Sponsor reserves the right, in its sole discretion, to 
	  disqualify any Entry not in compliance with these Official 
	  Rules.</p>
	  </li>
	  <li><strong>Selection of Winner</strong>.  On or about August 
	  16, 2012, Sponsor will conduct three (3) random drawings 
	  (collectively referred to as “the Drawings”) to select up to 
	  a total of 220 potential winners.
	    <ul>
	      <li>First Round Drawing – The first random drawing 
	      (“First Drawing”) will be to select up to 50 potential 
	      winners from the pool of eligible Entries received by 
	      Sponsor. The pool of eligible Entries for the First 
	      Drawing will consist of Entries received from Participants
	       who selected the OLPC XO-1.75 laptop computer.</li>
	       <li>Second Round Drawing - The second random drawing 
	       (“Second Drawing”) will be to select 150 potential 
	       winners from the pool of eligible Entries received by 
	       Sponsor. The pool of eligible Entries for the Second 
	       Drawing will consist of Entries received from 
	       Participants who selected the Raspberry Pi.</li>
	       <li>Third Round Drawing - The third random drawing 
	       (“Third Drawing”) will be to select 20 potential winners
	        from the pool of eligible Entries received by Sponsor. 
		The pool of eligible Entries for the Third Drawing will 
		consist of Entries received from Participants who 
		selected the Arduino Uno R3 (Atmega328—assembled) with 
		matching “shield”.</li>
	    </ul>
	    <p>The potential winners will be notified by email on or 
	    about August 16, 2012 using contact information provided by
	     the Participant in his or her Entry. If a potential winner 
	     does not respond within seven (7) days after the first 
	     attempt to contact him/her, or if the prize notification 
	     is returned as undeliverable, that potential winner will 
	     be deemed to have forfeited the prize, and Sponsor will 
	     select an alternate potential winner in his/her place at 
	     random from all remaining eligible Entries until all 
	     Prizes have been awarded. Winning a prize is contingent 
	     upon fulfilling all requirements set forth in these 
	     Official Rules. Noncompliance with the foregoing, failure 
	     to abide by these Official Rules, or return of the prize 
	     notification as non-deliverable may result in 
	     disqualification and naming of an alternate potential 
	     winner.</p>
	  </li>
	  <li><strong>Prizes and Odds</strong>. The Participants whose 
	  Entries are drawn at random in the First Drawing will each 
	  receive one OLPC XO-1.75 laptop computer (“First Drawing 
	  Prize”) with an Approximate Retail Value ("ARV") of $299 USD. 
	  The Participants whose Entries are drawn at random in the 
	  Second Drawing will each receive one Raspberry Pi (“Second 
	  Drawing Prize”) with an ARV of $50 USD. The Participants whose
	   Entries are drawn at random in the Third Drawing will each 
	  receive one Arduino Uno R3 (Atmega328—assembled) with 
	  matching “shield” (“Third Drawing Prize”) with an ARV of $85 
	  USD. The maximum total ARV of all prizes awarded is $24150 USD; 
	  however, the total ARV may be less if all Prizes are not 
	  awarded. If fewer than 50 Entries are received for the First
	  Drawing, then fewer than 50 First Drawing Prizes will be 
	  awarded. If fewer than 150 Entries are received for the 
	  Second Drawing, then fewer than 150 Second Drawing Prizes 
	  will be awarded. If fewer than 20 Entries are received for 
	  the Third Drawing, then fewer than 20 Third Drawing Prizes 
	  will be awarded.
	    <p>Prizes are subject to availability and Sponsor reserves
	    the right to substitute a prize of equal or greater value.
	    Odds of winning depend on the number of eligible Entries 
	    received. Prizes may not be redeemed for cash value and 
	    may not be transferred or assigned, except by Sponsor. 
	    Prizes consist of only those items specifically listed in
	    Paragraph 4 above ("Prizes and Odds"). Prizes will be 
	    delivered to Winners via standard postal mail 
	    approximately six (6) to ten (10) weeks after the close 
	    of Promotional Period. Sponsor will not replace any lost
	    or stolen prizes. Each prize is awarded without 
	    warranty of any kind from Sponsor, express or implied, 
	    without limitation, except where this would be contrary
	    to federal, state, provincial, or local laws or 
	    regulations. Expenses not specifically stated above, 
	    together with the reporting and payment of all 
	    applicable taxes, fees, duties, and/or surcharges, if 
	    any, arising out of, or resulting from, acceptance or 
	    use of the prize, are the sole responsibility of the 
	    Winner. Restrictions, conditions, and limitations apply.</p>
	    <p>Any trademarks associated with the prizes awarded under 
	    this Promotion are registered or unregistered trademarks of 
	    their owners, who are not affiliated with nor have endorsed 
	    this Promotion. Prizes awarded under this Promotion may be 
	    subject to restrictions and licenses from their 
	    manufacturers and may require additional hardware, 
	    software, service, or maintenance to use. Winner shall bear 
	    all responsibility for use of such prize in compliance with 
	    the conditions imposed by the manufacturer, and any 
	    additional costs associated with its use, service, or 
	    maintenance.</p>
	  </li>
	  <li><strong>Condition of Participation</strong>. By entering 
	  the Promotion, Participants agree to be bound by these 
	  Official Rules and the decisions of the Sponsor, which shall 
	  be final and binding in all respects. Any attempt to 
	  deliberately damage the content or operation of the Promotion 
	  is unlawful and subject to legal action by Sponsor or its 
	  agents. Sponsor reserves the right to disqualify persons 
	  found tampering with or otherwise abusing any aspect of this 
	  Promotion as solely determined by Sponsor.
	    <p>Winners may be asked to participate in publicity. Except 
	    where prohibited by law, a Winner’s acceptance of a Prize 
	    constitutes permission for Sponsor to use such Winner’s 
	    name, address (city and state only), statements, 
	    photograph, voice and/or likeness for any advertising and 
	    promotional purposes relating to the Promotion, in any 
	    media now known or hereafter devised, without further 
	    notice, compensation, consideration, review or consent and 
	    without regard to moral rights.</p>
	  </li>
	  <li><strong>Compromise of Promotion</strong>. In the event 
	  the Promotion is not capable of running as planned as the 
	  result of bugs, virus, non-authorized human intervention, 
	  tampering, technical failures, fraud, or other causes beyond 
	  the reasonable control of Sponsor that corrupts or impairs 
	  the administration, security, fairness, integrity or proper 
	  operation of the Promotion, Sponsor reserves the right in its 
	  sole discretion to cancel, suspend, modify or terminate the 
	  Promotion. Should the Promotion be terminated prior to the 
	  stated expiration date, Sponsor reserves the right to award 
	  prizes based on the Entries received before the termination 
	  date.</li>
	  <li><strong>Limitations of Liability</strong>. By entering 
	  the Promotion, Participant agrees that
	    <ol>
	      <li>Any and all disputes, claims, and causes of action 
	    arising out of or in connection with the Promotion, or any 
	    prizes awarded, shall be resolved individually without 
	    resort to any form of class action, and Participant waives 
	    his or her right to a jury trial for such disputes, 
	    claims, and causes of action;</li>
	    <li>Any claims, judgments and awards shall be limited to 
	    actual out-of-pocket costs incurred, including costs 
	    associated with entering the Promotion, but in no event 
	    attorneys’ fees; and</li>
	    <li>Under no circumstances will any Participant be 
	    permitted to obtain any award for, and Participant hereby 
	    waives all rights to claim punitive, incidental or 
	    consequential damages and any and all rights to have 
	    damages multiplied or otherwise increased and any other 
	    damages, other than damages for actual out-of-pocket 
	    expenses. Sponsor assumes no responsibility for any error, 
	    omission, interruption, deletion, defect, or delay in 
	    operation or transmission; communications line failure; or 
	    theft, destruction of, alteration or unauthorized access to 
	    Promotion Entries. Sponsor is not responsible for any 
	    typographical or other error in the printing of the offer, 
	    administration of the Promotion, or announcement of the 
	    Winner.</li>
	  </ol></li>
	  <li><strong>General Release</strong>. By entering the 
	  Promotion, Participant releases and holds harmless Sponsor, 
	  any other promotional sponsors, and each of their respective 
	  affiliated companies, directors, officers, employees, 
	  representatives, partners and agents from any liability 
	  whatsoever for any claims, costs, injuries, losses or damages 
	  of any kind arising out of or in connection with the 
	  Promotion or with the acceptance, possession or use of any 
	  prize (including, without limitation, claims, costs, 
	  injuries, losses or damages related to personal injuries, 
	  death, damage to, loss or destruction of property, rights of 
	  publicity or privacy, defamation or portrayal in a false 
	  light).</li>
	  <li><strong>Privacy</strong>. Participants will be asked to 
	  provide personal information to enter the Promotion, which 
	  will be transferred to servers located in the United States. 
	  By entering the Promotion, you consent to transfer of your 
	  personal information and to the terms of the Sponsor’s 
	  privacy policy located at 
	  <a href="http://www.redhat.com/legal/privacy_statement.html">
	    www.redhat.com/legal/privacy_statement.html</a>. If you 
	    wish to opt out of receiving further communications from 
	    Sponsor or have other questions regarding Sponsor’s privacy 
	    policy, please contact Sponsor at Red Hat, Inc., 1801 
	    Varsity Drive, Raleigh, NC 27606, Attn: Newsletters.</li>
	  <li><strong>Governing Law</strong>. The Promotion is subject 
	  to all federal, state, and local laws. The Promotion and 
	  Official Terms are governed and interpreted by the laws of 
	  the State of North Carolina (U.S.), without regard to its 
	  conflict of law provisions.</li>
	  <li><strong>Official Rules / List of Winners</strong>. 
	  Sponsor will post the Official Rules and Winners List online 
	  at <a href="https://fedoraproject.org/openhw2012/details">
	    https://fedoraproject.org/openhw2012/details</a>, and will 
	    maintain the Winners List for approximately six (6) months 
	    after the Winners are selected.</li>
	  <li><strong>Sponsor</strong>. Red Hat, Inc., located at 1801 
	  Varsity Drive, Raleigh, NC 27606, USA, is the sponsor of the 
	  Promotion (“Sponsor”). </li>
	</ol>
	<h2>Winners</h2>
	<div id="winner-info">
% if winners:
    <table class="table table-bordered table-condensed">
    % for winner in winners:
        <tr><td>${winner.realname.decode('utf-8')}</td><td>${winner.hardware}</td></tr>
    % endfor
    </table>
% else:
    Winners will be selected on ${request.registry.settings['stop_date']}.
% endif
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
    ##<script src="${request.static_url('fedorasummerofhardware:static/js/less-1.3.0.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/jquery-1.7.2.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-transition.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-alert.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-modal.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-dropdown.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-scrollspy.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-tab.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-tooltip.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-popover.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-button.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-collapse.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-carousel.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/bootstrap-typeahead.min.js')}"></script>

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
