<#include "security.ftlh">
<#import "login.ftlh" as l>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">FactChecker</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/index">Home</a>
                </li>
                <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/user">Редактировать пользователей</a>
                </li>
                </#if>
                <#if isUser>
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="#">Работа с документами</a>
                </li>
                </#if>
                <#if user??>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="/user/profile">Профиль</a>
                    </li>
                </#if>
            </ul>

            <span class="navbar-text" style="margin-right: 0.5em;">${name}</span>
            <@l.logout />
        </div>
    </div>
</nav>