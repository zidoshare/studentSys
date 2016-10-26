<#include "../macro-item.ftl">
<#include "../macro-btn.ftl">
<#include "../macro-paginate.ftl">
<@initBtn map = map view=view></@initBtn>
<@item>
<div class="panel-heading title">
${view.title}<span class="pull-right">${addBtn}</span>
</div>
<div class="panel-body">
    <div id="table-inner">
        <div id="dataTables-example_wrapper" class="table-responsive dataTables_wrapper form-inline" role="grid">
            <table class="table table-striped table-bordered table-hover dataTable no-footer"
                   id="dataTables-example" aria-describedby="dataTables-example_info">
                <thead>
                <tr>
                    <th>
                        分类名称
                    </th>
                    <th>
                        分类描述
                    </th>
                    <th>
                        创建时间
                    </th>
                    <#if updateAble || deleteAble>
                        <th>
                            操作
                        </th>
                    </#if>
                </tr>
                </thead>
                <tbody>

                    <#list domains.list as domain>
                    <tr id="domain${domain.id}">
                        <td id="domainTitle${domain.id}"
                            data-label="${domain.domainTitle?html}">${domain.domainTitle}</td>
                        <td id="domainMessage${domain.id}"
                            data-label="${domain.domainMessage}">${domain.domainMessage?html}</td>
                        <td id="domainCreateTime${domain.id}"
                            data-label="${domain.domainCreateTime}">${(domain.domainCreateTime?number)?number_to_datetime}</td>
                        <#if updateAble || deleteAble>
                            <td>
                                <#if updateAble>
                                ${InsertKit(updateBtn,"${domain.id}")}/
                                </#if>
                            ${InsertKit(deleteBtn,"${domain.id}")}
                            </td>
                        </#if>
                        <td class="hidden" id="tags${domain.id}" data-label="${domain.tags}"></td>
                    </tr>
                    </#list>


                </tbody>
            </table>
        </div>
        <div class="modal fade" id="addDomainModel" tabindex="-1" role="dialog" aria-labelledby="addDomainModelLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span
                                class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">添加分类信息</h4>
                    </div>
                    <div class="modal-body">
                        <form id="domain" role="form">
                            <div class="form-group sr-only">
                                <label for="domainId" class="col-sm-2 control-label">分类id</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="domain.id" id="domainId"
                                           placeholder="分类id">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="domainTitle" class="control-label">分类名称</label>
                                <input type="text" class="form-control" name="domain.domainTitle" id="domainTitle"
                                       placeholder="分类名称">
                            </div>
                            <div class="form-group">
                                <label for="domainMessage" class="control-label">分类信息</label>
                                <input type="text" class="form-control" name="domain.domainMessage" id="domainMessage"
                                       placeholder="分类信息">
                            </div>
                            <div class="form-group sr-only">
                                <label for="domainCreateTime" class="control-label">创建时间</label>
                                <input type="text" class="form-control" name="domain.domainCreateTime"
                                       id="domainCreateTime"
                                       placeholder="创建时间" disabled>
                            </div>
                            <div class="form-group sr-only">
                                <label for="domainUpdateTime" class="control-label">更新时间</label>
                                <input type="text" class="form-control" name="domain.domainUpdateTime"
                                       id="domainUpdateTime"
                                       placeholder="更新时间" disabled>
                            </div>
                            <div class="form-group sr-only">
                                <label for="domainOperaterId" class="control-label">operater</label>
                                <input type="text" class="form-control" name="domain.domainOperaterId"
                                       id="domainOperaterId"
                                       placeholder="创建者"
                                       value="${user.userNickname}"
                                       disabled>
                            </div>
                            <div class="form-group">
                                <label for="tags" class="control-label">关联标签（英文状态下逗号隔开）<a class="res"
                                                                                          onclick="$('.tag-container').toggle()">选择</a></label>
                                <input type="text" class="form-control" name="tags" id="tags"
                                       placeholder="关联标签（可输入已有标签，也可输入没有出现过的标签）">
                                <div id="panel-container">
                                    <div class="pan"></div>
                                    <div class="panel_loading">
                                        <img src="${staticServePath}/images/loading.gif" class="img-sm center-block"/>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="tip-container">
                            <div class="tip" id="saveDomainTip" aria-label="0">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <span class="pull-right">${saveBtn}</span>
                    </div>
                </div>
            </div>
        </div>
        <@paginate page=domains url=holdPath+"?">
        </@paginate>
    </div>

</div>
</@item>