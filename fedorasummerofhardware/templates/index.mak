<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <title>Fedora Summer of Hardware</title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <meta name="keywords" content="fedora open hardware arm raspberrypi olpc arduino" />
  <meta name="description" content="Have fun with open hardware this summer! To thank the Fedora community for all that they do for free software, we are offering over 200 open hardware devices for Fedora contributors in a random drawing." />
  <link rel="shortcut icon" href="https://fedoraproject.org/static/images/favicon.ico" />
  <script src="/static/jquery-latest.js"></script>
</head>
<body>
    <form name="application" method="POST" action="/submit" onsubmit="return doSubmit();">
        Full Name: <input type="text" value="" name="fullname" size=20 /><br/>
        Username: <input type="text" value="" name="username" size=20 /><br/>
        Password: <input type="password" value="" name="password" size=20 /><br/><br/>
        <input type="radio" name="hardware" value="raspberrypi">Raspberry Pi<br/>
        <input type="radio" name="hardware" value="olpc">OLPC 1.75<br/>
        <input type="radio" name="hardware" value="arduino">Arduino<br/><br/>
        In 500 characters or less, please tell us what fun projects you intend to use your open hardware device for?<br/>
        <textarea name="text" rows="4" cols="50"></textarea><br/>
        <br/>
        <input type="submit" value="Submit your entry!" />
    </form>
</body>
<script>
function doSubmit(){
    var hw = $('input:radio[name=hardware]:checked').val();
    if (typeof(hw) == 'undefined') {
        alert('You must select a type of hardware');
        return false;
    }
    return true;
}
</script>
</html>
