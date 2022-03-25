<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
<div>
    <div class="mb-1"><b>Регистариция нового пользователя</b></div>
    <div style="color: darkred">
        ${message?ifExists}
    </div>
    <@l.login "/registration" true/>
</div>
</@c.page>