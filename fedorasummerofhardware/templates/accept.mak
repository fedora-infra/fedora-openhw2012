<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <title>Fedora Summer of Hardware</title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <meta name="keywords" content="fedora open hardware arm raspberrypi olpc arduino" />
  <meta name="description" content="Have fun with open hardware this summer! To thank the Fedora community for all that they do for free software, we are offering over 200 open hardware devices for Fedora contributors in a random drawing." />
  <link rel="shortcut icon" href="https://fedoraproject.org/static/images/favicon.ico" />
  <script src="${request.static_url('fedorasummerofhardware:static/jquery-latest.js')}"></script>
</head>
<body>
    <form name="application" method="POST" action="${request.route_url('save_address')}" onsubmit="return doSubmit();">
        Fedora Username: <input type="text" value="" name="username" size=20 /><br/>
        Password: <input type="password" value="" name="password" size=20 /><br/><br/>
        Address:
        <textarea id="address" name="address" rows="4" cols="50"></textarea><br/>
        <br/>
        <input type="submit" value="Submit" />
    </form>
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
</html>
