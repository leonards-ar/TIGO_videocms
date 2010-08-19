

<%@ page import="com.tigo.videocms.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
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
            <g:hasErrors>
            <div class="errors">
                <g:renderErrors as="list" />                
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="user.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${userInstance?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="firstName"><g:message code="user.firstName.label" default="First Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'firstName', 'errors')}">
                                    <g:textField name="firstName" value="${userInstance?.firstName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastName"><g:message code="user.lastName.label" default="Last Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'lastName', 'errors')}">
                                    <g:textField name="lastName" value="${userInstance?.lastName}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="username"><g:message code="user.username.label" default="Username" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                                    <g:textField name="username" value="${userInstance?.username}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="user.password.label" default="Password" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                    <input id="password" name="password" type="password"/>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="confirmationPassword"><g:message code="user.confirmationPassword.label" default="Password Confirmation" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                    <input id="confirmationPassword" name="confirmationPassword" type="password"/>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="countries"><g:message code="user.countries.label" default="Countries" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'countries', 'errors')}">
                                    <g:select name="countries" from="${com.tigo.videocms.Country.list()}" multiple="yes" optionKey="id" size="5" value="${userInstance?.countries*.id}" />
                                </td>
                            </tr>                        

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="roles"><g:message code="user.roles.label" default="Roles" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors('errors')}">
                                    <g:select name="roles" from="${com.tigo.videocms.SecRole.list()}" multiple="yes" optionKey="id" size="5" value="${roles}" />
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
