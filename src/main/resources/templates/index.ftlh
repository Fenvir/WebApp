<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
    <div style="position: absolute; float: right; top: 0; right: 5px">
        <@l.logout />
    </div>
    <div style="position: relative; margin: 0 auto 20px; width: 350px; text-align: center;">
        <b style="font-size: 50px">FactChecker</b><br>
        Панель администрирования
    </div>
    <a href="/registration">Создать пользователя</a> |
    <a href="#">Работа с документами</a>
    <div>
        <form method="post">
            <input type="text" name="text" placeholder="Введите сообщение">
            <input type=text" name="tag" placeholder="Тэг">
            <input type="hidden" name="_csrf" value="@{_csrf.token}">
            <button type="submit">Добавить</button>
        </form>
    </div>
    <div>Список сообщений</div>
    <form method="get" action="/index">
        <input type="text" name="filter" placeholder="Введите тэг" value="${filter!}">
        <button type="submit">Найти</button>
    </form>
    <#list messages as message>
    <div>
        <b>${message.id!}</b>
        <span>${message.text!}</span>
        <i>${message.tag!}</i>
        <b>${message.authorName!}</b>
    </div>
    <#else>
        Нет сообщений
    </#list>
</@c.page>