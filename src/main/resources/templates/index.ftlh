<#include "parts/security.ftlh">
<#import "parts/common.ftlh" as c>
<@c.page>
    <div class="row mb-3">
        <form class="row row-cols-lg-auto g-3 align-items-center" method="get" action="/index">
            <div class="col-12">
                <input type="text" class="form-control" name="filter" placeholder="Поиск по тэгу" value="${filter!}">
            </div>
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Найти</button>
            </div>
        </form>
    </div>
    <div class="mb-3" style="color: darkred">
        ${messageAlert?ifExists}
    </div>
    <p>
        <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample"
           role="button" aria-expanded="false" aria-controls="collapseExample">
            Добавить задание
        </a>
    </p>
    <div class="collapse <#if message??>show</#if>" id="collapseExample" style="margin-bottom: 0.8em">
        <div class="card card-body">
            <form method="post"  enctype="multipart/form-data">
                <div class="mb-3">
                    <input type="text" class="form-control ${(errorsMap??)?string('is-invalid', '')}"
                           value="<#if message??>${message.text!}</#if>" name="text" placeholder="Введите сообщение">
                    <#if errorsMap??>
                    <div class="invalid-feedback">
                        ${errorsMap}
                    </div>
                    </#if>
                </div>
                <div class="mb-3">
                    <input type=text" class="form-control" name="tag" placeholder="Тэг"
                           value="<#if message??>${message.tag}</#if>">
                </div>
                <div class="mb-3">
                    <input type="file" class="form-control" name="file">
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button class="btn btn-primary" type="submit">Добавить</button>
            </form>
        </div>
    </div>
    <div class="row row-cols-1 row-cols-md-5 g-4">
        <#list messages as message>
            <div class="col">
                <div class="card h-100">
                    <h5 class="card-title">Card title</h5>
                    <#if message.filename??>
                        <img class="card-img-top" src="/img/${message.filename}">
                    </#if>
                    <div class="card-body">
                        <span>${message.text!}</span>
                        <i>${message.tag!}</i>
                    </div>
                    <div class="card-footer">
                        ${message.authorName!}
                        <a style="float: right;" href="#" class="card-link">Посмотреть</a>
                    </div>
                </div>
            </div>
        <#else>
            <div>
                Нет сообщений
            </div>
        </#list>
    </div>
</@c.page>