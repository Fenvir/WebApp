<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
<div style="position: relative; margin:200px auto; width: 350px; text-align: center; font-size: 20px">
    <div><b>Авторизация</b></div>
    <@l.login "/login" />
</div>
</@c.page>