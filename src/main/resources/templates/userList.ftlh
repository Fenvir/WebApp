<#import "parts/common.ftlh" as c>
<@c.page>
    <p class="fs-4">Список пользователей</p>
    <table class="table table-striped table-hover">
    <thead>
    <tr>
        <th scope="col">#</th>
        <th scope="col">Логин</th>
        <th scope="col">Роль</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    <#list users as user>
        <tr>
            <th scope="row"></th>
            <td>${user.username}</td>
            <td><#list user.roles as role>${role}<#sep>, </#list></td>
            <td><a class="card-link" href="/user/${user.id}">Редактировать</a></td>
        </tr>
    </#list>
    </tbody>
    </table>
</@c.page>