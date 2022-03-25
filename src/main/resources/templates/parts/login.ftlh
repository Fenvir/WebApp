<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="mb-3">
            <label class="form-label">Логин:</label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="username" placeholder="Логин" />
            </div>
        </div>
        <div class="mb-3">
            <label lass="form-label">Пароль:</label>
            <div class="col-sm-5">
                <input class="form-control" type="password" name="password" placeholder="Пароль" />
            </div>
        </div>
        <#if isRegisterForm>
            <div class="mb-3">
                <label lass="form-label">Email:</label>
                <div class="col-sm-5">
                    <input class="form-control" type="email" name="email" placeholder="example@example.com" />
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div>
            <#if !isRegisterForm><a href="/registration">Регистрация</a></#if>
            <button type="submit" class="btn btn-primary"><#if isRegisterForm>Зарегистрироваться<#else>Войти</#if></button>
        </div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-primary">Выйти</button>
    </form>
</#macro>