<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
  <h1>${msg("registerTitle")}</h1>
    <form id="kc-register-form" action="${url.registrationAction}" method="post">
  <#if section == "form">
  
    <!-- Username Field -->
    <div class="cds--form-item ${properties.kcFormGroupClass!}">
      <label for="username" class="input-label-row">
        ${msg("username")}
      </label>
      <div class="cds--input__field-outer-wrapper">
        <input id="username" name="username" type="text" class="login-input" required autofocus />
      </div>
      <#if messagesPerField.existsError('username')>
        <span class="error-message" aria-live="polite">
          ${kcSanitize(messagesPerField.get('username'))?no_esc}
        </span>
      </#if>
    </div>

    <!-- Email Field -->
    <div class="cds--form-item">
      <label for="email" class="input-label-row">
        ${msg("email")}
      </label>
      <div class="cds--input__field-outer-wrapper">
        <input id="email" name="email" type="email" class="login-input" required />
      </div>
      <#if messagesPerField.existsError('email')>
        <span class="error-message" aria-live="polite">
          ${kcSanitize(messagesPerField.get('email'))?no_esc}
        </span>
      </#if>
    </div>

    <!-- Password Field -->
    <div class="cds--form-item">
      <label for="password" class="input-label-row">
        ${msg("password")}
      </label>
      <div class="cds--input__field-outer-wrapper">
        <input type="password" id="password" name="password" class="login-input" autocomplete="new-password" required />
      </div>
      <#if messagesPerField.existsError('password')>
        <span class="error-message" aria-live="polite">
          ${kcSanitize(messagesPerField.get('password'))?no_esc}
        </span>
      </#if>
    </div>

    <!-- Password Confirmation Field -->
    <div class="cds--form-item">
      <label for="password-confirm" class="input-label-row">
        ${msg("passwordConfirm")}
      </label>
      <div class="cds--input__field-outer-wrapper">
        <input type="password" id="password-confirm" name="password-confirm" class="login-input" autocomplete="new-password" required />
      </div>
      <#if messagesPerField.existsError('password-confirm')>
        <span class="error-message" aria-live="polite">
          ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
        </span>
      </#if>
    </div>

    <!-- Register Button -->
    <div id="kc-form-buttons" class="cds--btn">
      <button type="submit" class="login-btn">
        ${msg("doRegister")}
      </button>
    </div>

    <!-- Google Button -->
    <#if social.providers??>
      <div id="kc-social-providers" class="social-providers">
        <hr />
        <ul>
          <#list social.providers as p>
            <#if p.alias == "google">
              <a id="social-${p.alias}" class="google-login-button" href="${p.loginUrl}" style="width: 100%;">
                <svg width="20px" height="20px" viewBox="-3 0 262 262" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid">
                  <path d="M255.878 133.451c0-10.734-.871-18.567-2.756-26.69H130.55v48.448h71.947c-1.45 12.04-9.283 30.172-26.69 42.356l-.244 1.622 38.755 30.023 2.685.268c24.659-22.774 38.875-56.282 38.875-96.027" fill="#4285F4"/>
                  <path d="M130.55 261.1c35.248 0 64.839-11.605 86.453-31.622l-41.196-31.913c-11.024 7.688-25.82 13.055-45.257 13.055-34.523 0-63.824-22.773-74.269-54.25l-1.531.13-40.298 31.187-.527 1.465C35.393 231.798 79.49 261.1 130.55 261.1" fill="#34A853"/>
                  <path d="M56.281 156.37c-2.756-8.123-4.351-16.827-4.351-25.82 0-8.994 1.595-17.697 4.206-25.82l-.073-1.73L15.26 71.312l-1.335.635C5.077 89.644 0 109.517 0 130.55s5.077 40.905 13.925 58.602l42.356-32.782" fill="#FBBC05"/>
                  <path d="M130.55 50.479c24.514 0 41.05 10.589 50.479 19.438l36.844-35.974C195.245 12.91 165.798 0 130.55 0 79.49 0 35.393 29.301 13.925 71.947l42.211 32.783c10.59-31.477 39.891-54.251 74.414-54.251" fill="#EB4335"/>
                </svg>
                <span style="flex: 1; text-align: center;">${p.displayName!}</span>
              </a>
            </#if>
          </#list>
        </ul>
      </div>
    </#if>
    </form>

    <!-- Back to Login Link -->
    <div id="kc-form-options" class="input-label-row">
      <a href="${url.loginUrl}" class="cds--link">${msg("backToLogin")}</a>
    </div>

  </#if>
</@layout.registrationLayout>
