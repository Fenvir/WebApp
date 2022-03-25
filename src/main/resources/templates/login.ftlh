<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
<div>
    <div class="mb-1"><b>Авторизация</b></div>
    ${message?ifExists}
    <@l.login "/login" false/>
</div>
</@c.page>