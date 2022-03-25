<#import "parts/common.ftlh" as c>

<@c.page>
    <div>
        <div class="mb-1"><b>Редактировать профиль ${username}</b></div>
        ${message?ifExists}
        <form method="post">
            <div class="mb-3">
                <label lass="form-label">Пароль:</label>
                <div class="col-sm-5">
                    <input class="form-control" type="password" name="password" placeholder="Пароль" />
                </div>
            </div>
            <div class="mb-3">
                <label lass="form-label">Email:</label>
                <div class="col-sm-5">
                    <input class="form-control" type="email" name="email" placeholder="example@example.com" value="${email!''}"/>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div>
                <button type="submit" class="btn btn-primary">Сохранить</button>
            </div>
        </form>
    </div>
</@c.page>