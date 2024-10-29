<#import "template.ftl" as layout>
    <@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
        <#if section="header">
            <h1>
                ${msg("loginTitle")}
            </h1>
            <h2>
                ${msg("loginSubtitle")}
            </h2>
            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                <div id="kc-registration-container">
                    <div id="kc-registration">
                        <span>
                            ${msg("noAccount")}
                        </span>
                        &nbsp;
                        <a class="cds--link" href="${url.registrationUrl}">
                            ${msg("doRegister")}
                        </a>
                    </div>
                </div>
            </#if>
            <#elseif section="form">
                <div id="kc-form">
                    <div id="kc-form-wrapper">
                        <#if realm.password>
                            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                                <div class="${properties.kcFormGroupClass!} cds--text-input-wrapper">
                                    <label for="username" class="${properties.kcLabelClass!}">
                                        <#if !realm.loginWithEmailAllowed>
                                            ${msg("username")}
                                            <#elseif !realm.registrationEmailAsUsername>
                                                ${msg("loginUsername")}
                                                <#else>
                                                    ${msg("email")}
                                        </#if>
                                    </label>
                                    <#if usernameEditDisabled??>
                                        <input id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                                        <#else>
                                            <div class="cds--input__field-outer-wrapper">
                                                <div class="cds--text-input__field-wrapper" data-invalid="<#if messagesPerField.existsError('username','password')>true</#if>">
                                                    <#if messagesPerField.existsError('username','password')>
                                                        <svg width="16" height="16" fill-rule="evenodd" class="cds--text-input__invalid-icon">
                                                            <path d="M8,1C4.2,1,1,4.2,1,8s3.2,7,7,7s7-3.1,7-7S11.9,1,8,1z M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2	c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z"></path>
                                                            <path d="M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8	c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z" data-icon-path="inner-path" opacity="0"></path>
                                                        </svg>
                                                    </#if>
                                                    <input placeholder="${msg("loginUsernamePlaceholder")}" id="username" class="login-input
                           <#if messagesPerField.existsError('username','password')>cds--text-input--invalid input-error</#if>" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off"
                                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                                        <#if messagesPerField.existsError('username','password')>data-invalid="true"
                                    </#if>
                                    />
                                </div>
                    </div>
        </#if>
        </div>
        <div class="${properties.kcFormGroupClass!} cds--text-input-wrapper">
            <div class="input-label-row">
                <label for="password" class="${properties.kcLabelClass!}">
                    ${msg("loginPassword")}
                </label>
                <div class="${properties.kcFormOptionsWrapperClass!}">
                    <#if realm.resetPasswordAllowed>
                        <span><a class="cds--link" href="${url.loginResetCredentialsUrl}">
                                ${msg("doForgotPassword")}
                            </a></span>
                    </#if>
                </div>
            </div>
            <div class="cds--text-input__field-wrapper" data-invalid="<#if messagesPerField.existsError('username','password')>true</#if>">
                <#if messagesPerField.existsError('username','password')>
                    <svg width="16" height="16" fill-rule="evenodd" xmlns="http://www.w3.org/2000/svg" class="cds--text-input__invalid-icon">
                        <path d="M8,1C4.2,1,1,4.2,1,8s3.2,7,7,7s7-3.1,7-7S11.9,1,8,1z M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2	c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z"></path>
                        <path d="M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8	c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z" data-icon-path="inner-path" opacity="0"></path>
                    </svg>
                </#if>
                <input placeholder="${msg("loginPasswordPlaceholder")}" id="password" class="login-input <#if messagesPerField.existsError('username','password')>cds--text-input--invalid input-error</#if>" name="password" type="password" autocomplete="off"
                    aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                    <#if messagesPerField.existsError('username','password')>data-invalid="true"</#if>
                />
            </div>
            <#if messagesPerField.existsError('username','password')>
                <div class="cds--form-requirement" id="username-error-msg">
                    <p class="${properties.kcInputErrorMessageClass!} error-message" aria-live="polite">
                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                    </p>
                </div>
            </#if>
        </div>
        <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
            <div id="kc-form-options">
                <#if realm.rememberMe && !usernameEditDisabled??>
                    <div class="cds--form-item cds--checkbox-wrapper">
                        <#if login.rememberMe??>
                            <input id="rememberMe" class="cds--checkbox" name="rememberMe" type="checkbox" checked>
                            <#else>
                                <input id="rememberMe" class="cds--checkbox" name="rememberMe" type="checkbox">
                        </#if>
                        <label for="rememberMe" class="cds--checkbox-label"><span class="cds--checkbox-label-text">
                                ${msg("rememberMe")}
                            </span></label>
                    </div>
                </#if>
            </div>
        </div>
        <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
            <input type="hidden" id="id-hidden-input" name="credentialId" value="<#if auth.selectedCredential?has_content>
${auth.selectedCredential}
</#if>" />
            <button class="login-btn" name="login" id="kc-login" type="submit">
                ${msg("doLogIn")}
            </button>
        </div>
        </form>
        </#if>
        </div>
        <div class="social-providers">
            <#if realm.password && social.providers??>
                <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                    <hr />
                    <p class="cds--form__helper-text" style="text-align: center;">
                        ${msg("identity-provider-login-label")}
                    </p>
                    <ul class="${properties.kcFormSocialAccountListClass!}
<#if social.providers?size gt 3>
${properties.kcFormSocialAccountListGridClass!}
</#if>">
                        <#list social.providers as p>
                            <#if p.alias=="google">
                                <a id="social-${p.alias}" class="google-login-button"
                                    href="${p.loginUrl}">
                                    <svg width="20px" height="20px" viewBox="-3 0 262 262" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid">
                                        <path d="M255.878 133.451c0-10.734-.871-18.567-2.756-26.69H130.55v48.448h71.947c-1.45 12.04-9.283 30.172-26.69 42.356l-.244 1.622 38.755 30.023 2.685.268c24.659-22.774 38.875-56.282 38.875-96.027" fill="#4285F4" />
                                        <path d="M130.55 261.1c35.248 0 64.839-11.605 86.453-31.622l-41.196-31.913c-11.024 7.688-25.82 13.055-45.257 13.055-34.523 0-63.824-22.773-74.269-54.25l-1.531.13-40.298 31.187-.527 1.465C35.393 231.798 79.49 261.1 130.55 261.1" fill="#34A853" />
                                        <path d="M56.281 156.37c-2.756-8.123-4.351-16.827-4.351-25.82 0-8.994 1.595-17.697 4.206-25.82l-.073-1.73L15.26 71.312l-1.335.635C5.077 89.644 0 109.517 0 130.55s5.077 40.905 13.925 58.602l42.356-32.782" fill="#FBBC05" />
                                        <path d="M130.55 50.479c24.514 0 41.05 10.589 50.479 19.438l36.844-35.974C195.245 12.91 165.798 0 130.55 0 79.49 0 35.393 29.301 13.925 71.947l42.211 32.783c10.59-31.477 39.891-54.251 74.414-54.251" fill="#EB4335" />
                                    </svg>
                                    <span class="${properties.kcFormSocialAccountNameClass!}" style="text-align: center;">
                                        ${p.displayName!}
                                    </span>
                                </a>
                                <#else>
                                    <a id="social-${p.alias}" class="${properties.kcFormSocialAccountListButtonClass!}
    <#if social.providers?size gt 3>
    ${properties.kcFormSocialAccountGridItem!}
    </#if>"
                                        href="${p.loginUrl}" style="display: flex; align-items: center; justify-content: center;">
                                        <#if p.iconClasses?has_content>
                                            <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true" style="margin-right: 8px;"></i>
                                        </#if>
                                        <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text" style="text-align: center;">
                                            ${p.displayName!}
                                        </span>
                                    </a>
                            </#if>
                        </#list>
                    </ul>
                </div>
            </#if>
        </div>
        </div>
        </#if>
    </@layout.registrationLayout>