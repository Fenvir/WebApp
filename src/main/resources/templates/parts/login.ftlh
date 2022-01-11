<#macro login path>
    <form style="margin: 10px" action="${path}" method="post">
        <div style="margin-bottom: 10px"><label>Логин:<br><input type="text" name="username"/> </label></div>
        <div style="margin-bottom: 10px"><label> Пароль:<br><input type="password" name="password"/> </label></div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div><a href="/registration">Регистрация</a> <input type="submit" value="Войти"/></div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Завершить работу"/>
    </form>
</#macro>