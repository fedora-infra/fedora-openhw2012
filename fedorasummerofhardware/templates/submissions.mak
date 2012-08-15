## -*- coding: utf-8 -*-
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <script src="${request.static_url('fedorasummerofhardware:static/js/jquery-1.7.2.min.js')}"></script>
    <style>
        .approved { background-color: #00FF00; }
    </style>
    ##<link rel="stylesheet/less" href="${request.static_url('fedorasummerofhardware:static/less/bootstrap.less')}">
    <link rel="stylesheet" type="text/css" href="${request.static_url('fedorasummerofhardware:static/css/compressed.css')}" media="all" />

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
  </div>

      <div class="hero-unit">
        <a href="http://fedoraproject.org" id="fedora">Fedora</a>
        <h1>Summer of Open Hardware and Fun!</h1>
      </div>

<div class="container">

<p>
<center>
  <a href="${request.route_url('csv')}" class="btn">CSV</a>
  <a href="${request.route_url('logout')}" class="btn">Logout</a>
</center>
</p>

<table class="table table-bordered table-condensed">
<tr>
% for name, hw in hardware.iteritems():
    <td>
    <b>${name}</b>
    <ul>
        <li>Available: ${hw['num']}</li>
        <li>Approved: ${hw['approved']}</li>
        <li>Unapproved: ${hw['unapproved']}</li>
    </ul>
    </td>
% endfor
</tr>
</table>

<p><center>${len(selected)} entries randomly selected below.</center></p>

% if now >= stop_date:
<form name="approve" method="POST" action="${request.route_url('approve')}">
    <center>
          <button class="btn btn-primary" type="submit" value="Approve entries!">
              Approve Entries
          </button>
    </center>
% endif

<h2>Unapproved Entries</h2>
<table class="table table-bordered table-striped table-condensed">
<thead><th></th><th>Name</th><th>Hardware</th><th>Country</th><th>Text</th></thead>
% for app in applications:
    % if not app.approved:
        <tr>
          <td><input type="checkbox" class="checkbox" id="${app.id}" name="${app.id}" ${app.id in selected and 'checked="checked"' or ''}"/></td>
          <td>${app.realname} (${app.username})</td>
          <td>${app.hardware}
            % if app.shield:
                (${app.shield})
            % endif
          </td>
          <td>${app.country}</td>
          <td>${app.text}</td>
        </tr>
    % endif
% endfor
</table>
</form>

<h2>Approved Entries</h2>
<table class="table table-bordered table-striped table-condensed">
<thead><th>Real Name</th><th>Username</th><th>Phone</th><th>Hardware</th><th>Text</th><th>Country</th><th>Address</th></thead>
% for app in applications:
    % if app.approved:
        <tr>
          <td>${app.realname}</td>
          <td>${app.username}</td>
          <td>${app.phone}</td>
          <td>${app.hardware}
            % if app.shield:
                (${app.shield})
            % endif
          </td>
          <td>${app.text}</td>
          <td>${app.country}</td>
          <td>${app.address}</td>
        </tr>
    % endif
% endfor
</table>

</div>
</body>

    ##<script src="${request.static_url('fedorasummerofhardware:static/js/less-1.3.0.min.js')}"></script>
    <script src="${request.static_url('fedorasummerofhardware:static/js/jquery-1.7.2.min.js')}"></script>

</html>
