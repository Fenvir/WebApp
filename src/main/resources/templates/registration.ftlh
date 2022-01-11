<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
<div style="position: absolute; float: right; top: 0; right: 5px">
    <@l.logout />
</div>
<div style="position: relative; margin: 200px auto; width: 350px; text-align: center; font-size: 20px">
    <div style="margin-bottom: 10px"><b>Регистариция нового пользователя</b></div>
    <div style="color: darkred">
        ${message!}
    </div>
    <@l.login "/registration" />
</div>
</@c.page>