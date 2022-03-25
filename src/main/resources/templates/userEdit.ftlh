<#import "parts/common.ftlh" as c>
<@c.page>
    <div class="row">
        <p class="fs-4">Редактор пользователей</p>
        <form class="row row-cols-lg-auto g-3 align-items-center" action="/user" method="post">
            <div class="col-12">
                <input class="form-control" type="text" name="username" value="${user.username}">
            </div>
            <#list roles as role>
                <div class="col-12">
                    <label>
                        <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>
                        ${role}
                    </label>
                </div>
            </#list>
            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <div class="col-12">
                <button class="btn btn-primary" type="submit">Сохранить</button>
            </div>
        </form>
    </div>
</@c.page>