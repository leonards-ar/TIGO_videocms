

<%@ page import="com.tigo.videocms.Element" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'element.label', default: 'Element')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${elementInstance}">
            <div class="errors">
                <g:renderErrors bean="${elementInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form name="elementForm" id="elementForm" enctype="multipart/form-data" method="post" action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="element.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: elementInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${elementInstance?.title}" size="100"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="element.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: elementInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${elementInstance?.description}" size="100"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="element.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: elementInstance, field: 'type', 'errors')}">
                                    <g:select name="type.id" from="${elementTypeList}" optionValue="${{message(code: 'element_type.' + it.labelKey)}}"  optionKey="id" value="${elementInstance?.type?.id}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countries"><g:message code="element.countries.label" default="Countries" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: elementInstance, field: 'countries', 'errors')}">
                                    <g:select name="countries" from="${countryList}" multiple="yes" optionKey="id" size="5" value="${elementInstance?.countries*.id}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="elementFile"><g:message code="element.file.label" default="File Upload" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: elementInstance, field: 'elementFile', 'errors')}">
                                    <input type="file" name="elementFile" id="elementFile"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
