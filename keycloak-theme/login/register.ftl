<#import "templateRegister.ftl" as layout>
    <#import "register-commons.ftl" as registerCommons>
        <@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm','termsAccepted'); section>
            <#if section="header">
                ${msg("registerTitle")}
                <#elseif section="form">
                    <#if social.providers??>
                        <div id="kc-social-providers" class="social-providers">
                            <p class="cds--form__helper-text" style="text-align: center;">
                                ${msg("identity-provider-signUp-label")}
                            </p>
                            <ul>
                                <#list social.providers as p>
                                    <#if p.alias=="google">
                                        <a id="social-${p.alias}" class="google-login-button" href="${p.loginUrl}" style="width: 100%;">
                                            <svg width="20px" height="20px" viewBox="-3 0 262 262" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid">
                                                <path d="M255.878 133.451c0-10.734-.871-18.567-2.756-26.69H130.55v48.448h71.947c-1.45 12.04-9.283 30.172-26.69 42.356l-.244 1.622 38.755 30.023 2.685.268c24.659-22.774 38.875-56.282 38.875-96.027" fill="#4285F4" />
                                                <path d="M130.55 261.1c35.248 0 64.839-11.605 86.453-31.622l-41.196-31.913c-11.024 7.688-25.82 13.055-45.257 13.055-34.523 0-63.824-22.773-74.269-54.25l-1.531.13-40.298 31.187-.527 1.465C35.393 231.798 79.49 261.1 130.55 261.1" fill="#34A853" />
                                                <path d="M56.281 156.37c-2.756-8.123-4.351-16.827-4.351-25.82 0-8.994 1.595-17.697 4.206-25.82l-.073-1.73L15.26 71.312l-1.335.635C5.077 89.644 0 109.517 0 130.55s5.077 40.905 13.925 58.602l42.356-32.782" fill="#FBBC05" />
                                                <path d="M130.55 50.479c24.514 0 41.05 10.589 50.479 19.438l36.844-35.974C195.245 12.91 165.798 0 130.55 0 79.49 0 35.393 29.301 13.925 71.947l42.211 32.783c10.59-31.477 39.891-54.251 74.414-54.251" fill="#EB4335" />
                                            </svg>
                                            <span style="flex: 1; text-align: center;">
                                                ${p.displayName!}
                                            </span>
                                        </a>
                                    </#if>
                                </#list>
                            </ul>
                            <hr />
                            <p class="cds--form__helper-text" style="text-align: center;">
                                ${msg("or")}
                            </p>
                        </div>
                    </#if>
                    <div id="kc-form">
                        <div id="kc-form-wrapper">
                            <form id="kc-register-form" action="${url.registrationAction}" method="post">
                                <div class="${properties.kcFormGroupClass!} cds--text-input-wrapper">
                                    <label for="firstName" class="${properties.kcLabelClass!}">
                                        ${msg("firstName")}
                                    </label>
                                    <div class="cds--input__field-outer-wrapper">
                                        <div class="cds--text-input__field-wrapper" aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>">
                                            <#if messagesPerField.existsError('firstName')>
                                                <svg width="16" height="16" fill-rule="evenodd" class="cds--text-input__invalid-icon">
                                                    <path d="M8,1C4.2,1,1,4.2,1,8s3.2,7,7,7s7-3.1,7-7S11.9,1,8,1z M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2	c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z"></path>
                                                    <path d="M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8	c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z" data-icon-path="inner-path" opacity="0"></path>
                                                </svg>
                                            </#if>
                                            <input placeholder="${msg("registerFirstNamePlaceholder")}" id="firstName" class="login-input-register
                                                <#if messagesPerField.existsError('firstName')>cds--text-input--invalid input-error</#if>" name="firstName" value="${(register.formData.firstName!'')}" type="text" autofocus autocomplete="off"
                                                aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                                                <#if messagesPerField.existsError('firstName')>data-invalid="true"
            </#if>
            />
            </div>
            </div>
            </div>
            <div class="${properties.kcFormGroupClass!} cds--text-input-wrapper">
                <label for="lastName" class="${properties.kcLabelClass!}">
                    ${msg("lastName")}
                </label>
                <div class="cds--input__field-outer-wrapper">
                    <div class="cds--text-input__field-wrapper" aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>">
                        <#if messagesPerField.existsError('lastName')>
                            <svg width="16" height="16" fill-rule="evenodd" class="cds--text-input__invalid-icon">
                                <path d="M8,1C4.2,1,1,4.2,1,8s3.2,7,7,7s7-3.1,7-7S11.9,1,8,1z M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2	c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z"></path>
                                <path d="M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8	c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z" data-icon-path="inner-path" opacity="0"></path>
                            </svg>
                        </#if>
                        <input placeholder="${msg("registerLastNamePlaceholder")}" id="lastName" class="login-input-register
                           <#if messagesPerField.existsError('lastName')>cds--text-input--invalid input-error</#if>" name="lastName" value="${(register.formData.lastName!'')}" type="text" autofocus autocomplete="off"
                            aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                            <#if messagesPerField.existsError('lastName')>data-invalid="true"
                        </#if>
                        />
                    </div>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!} cds--text-input-wrapper">
                <label for="email" class="${properties.kcLabelClass!}">
                    ${msg("email")}
                </label>
                <div class="cds--input__field-outer-wrapper">
                    <div class="cds--text-input__field-wrapper" aria-invalid="<#if messagesPerField.existsError('email')>true</#if>">
                        <#if messagesPerField.existsError('email')>
                            <svg width="16" height="16" fill-rule="evenodd" class="cds--text-input__invalid-icon">
                                <path d="M8,1C4.2,1,1,4.2,1,8s3.2,7,7,7s7-3.1,7-7S11.9,1,8,1z M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2	c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z"></path>
                                <path d="M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8	c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z" data-icon-path="inner-path" opacity="0"></path>
                            </svg>
                        </#if>
                        <input placeholder="${msg("loginUsernamePlaceholder")}" id="email" class="login-input-register
                           <#if messagesPerField.existsError('email')>cds--text-input--invalid input-error</#if>" name="email" value="${(register.formData.email!'')}" type="text" autofocus autocomplete="off"
                            aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                            <#if messagesPerField.existsError('email')>data-invalid="true"
                        </#if>
                        />
                    </div>
                </div>
            </div>
            <#if passwordRequired??>
                <div class="${properties.kcFormGroupClass!} cds--text-input-wrapper">
                    <label for="password" class="${properties.kcLabelClass!}">
                        ${msg("password")}
                    </label>
                    <div class="cds--input__field-outer-wrapper">
                        <div class="cds--text-input__field-wrapper" aria-invalid="<#if messagesPerField.existsError('password')>true</#if>">
                            <#if messagesPerField.existsError('password')>
                                <svg width="16" height="16" fill-rule="evenodd" class="cds--text-input__invalid-icon">
                                    <path d="M8,1C4.2,1,1,4.2,1,8s3.2,7,7,7s7-3.1,7-7S11.9,1,8,1z M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2	c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z"></path>
                                    <path d="M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8	c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z" data-icon-path="inner-path" opacity="0"></path>
                                </svg>
                            </#if>
                            <input placeholder="${msg("loginPasswordPlaceholder")}" id="password" class="login-input-register
                           <#if messagesPerField.existsError('password')>cds--text-input--invalid input-error</#if>" name="password" value="${(register.formData.password!'')}" type="text" autofocus autocomplete="off"
                                aria-invalid="<#if messagesPerField.existsError('password')>true</#if>"
                                <#if messagesPerField.existsError('password')>data-invalid="true"
            </#if>
            />
            </div>
            </div>
            </div>
            <div class="${properties.kcFormGroupClass!} cds--text-input-wrapper">
                <label for="passwordConfirm" class="${properties.kcLabelClass!}">
                    ${msg("passwordConfirm")}
                </label>
                <div class="cds--input__field-outer-wrapper">
                    <div class="cds--text-input__field-wrapper" aria-invalid="<#if messagesPerField.existsError('passwordConfirm')>true</#if>">
                        <#if messagesPerField.existsError('passwordConfirm')>
                            <svg width="16" height="16" fill-rule="evenodd" class="cds--text-input__invalid-icon">
                                <path d="M8,1C4.2,1,1,4.2,1,8s3.2,7,7,7s7-3.1,7-7S11.9,1,8,1z M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2	c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z"></path>
                                <path d="M7.5,4h1v5h-1C7.5,9,7.5,4,7.5,4z M8,12.2c-0.4,0-0.8-0.4-0.8-0.8s0.3-0.8,0.8-0.8	c0.4,0,0.8,0.4,0.8,0.8S8.4,12.2,8,12.2z" data-icon-path="inner-path" opacity="0"></path>
                            </svg>
                        </#if>
                        <input placeholder="${msg("registerPasswordConfirmPlaceholder")}" id="passwordConfirm" class="login-input-register
                           <#if messagesPerField.existsError('passwordConfirm')>cds--text-input--invalid input-error</#if>" name="passwordConfirm" value="${(register.formData.passwordConfirm!'')}" type="text" autofocus autocomplete="off"
                            aria-invalid="<#if messagesPerField.existsError('passwordConfirm')>true</#if>"
                            <#if messagesPerField.existsError('passwordConfirm')>data-invalid="true"
                        </#if>
                        />
                    </div>
                </div>
            </div>
            </#if>
            <@registerCommons.termsAcceptance />
            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>
            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">
                                ${kcSanitize(msg("backToLogin"))?no_esc}
                            </a></span>
                    </div>
                </div>
                <!-- Register Button -->
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <#-- <input type="submit" value="${msg("doRegister")}" /> -->
                    <button class="login-btn" name="login" id="kc-register" type="submit">
                        ${msg("doRegister")}
                    </button>
                </div>
            </div>
            </div>
            </div>
            <!-- Google Button -->
            </form>
            </#if>
        </@layout.registrationLayout>