## -*- coding: utf-8 -*-
% for app in applications:
${app.date},${app.username},${app.realname.decode('utf-8')},${app.country},${app.hardware},${app.shield},${app.text.decode('utf-8')}<br/>
% endfor
