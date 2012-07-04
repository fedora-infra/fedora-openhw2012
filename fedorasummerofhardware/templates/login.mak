<% flash = '. '.join(request.session.pop_flash()) %>
<div class="flash">${flash}</div>

<form name="login" method="POST" action="${request.route_url('login')}">
    Fedora Username: <input type="text" value="" name="username" size=20 /><br/>
    Password: <input type="password" value="" name="password" size=20 /><br/><br/>
    <input type="submit" value="Login" />
</form>
