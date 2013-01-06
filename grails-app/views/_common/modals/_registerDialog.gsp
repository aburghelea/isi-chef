<div class="modal hide" id="RegisterModal">
    <g:formRemote novalidate="novalidate" class="form-horizontal" method="post" id="register_form" name="register_form"
                  url="[controller: 'register', action: 'registerr']"
                  onComplete="hide()">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">x</button>

            <h3><g:message code="security.register.title" default="Register"/></h3>
        </div>

        <div class="modal-body">
            <div class="control-group">
                <label class="control-label"
                       for="username"><g:message code="security.firstname.label" default="Firstname"/></label>

                <div class="controls">
                    <input type="text" class="span3 input-xlarge" name="username" id="username"
                           placeholder="${message(code: 'security.username.label', default: 'Username')}">
                </div>
            </div>

            <div class="control-group">
                <label class="control-label"
                       for="email"><g:message code="security.email.label" default="Email"/></label>

                <div class="controls">
                    <input type="text" class="span3" name="email" id="email"
                           placeholder="${message(code: 'security.email.label', default: 'Email')}">
                </div>
            </div>

            <div class="hidden control-group">
                <label class="control-label"
                       for="password"><g:message code="security.password.label" default="Password"/></label>

                <div class="controls">
                    <input type="password" class="span3" name="password" id="password"
                           placeholder="${message(code: 'security.password.label', default: 'Password')}">
                </div>
            </div>

            <div class="hidden control-group">
                <label class="control-label"
                       for="password2">
                    <g:message code="security.password.confirm.label" default="Confirm"/>
                </label>

                <div class="controls">
                    <input type="password" class="span3" name="password2" id="password2"
                           placeholder="${message(code: 'security.password.confirm.label', default: 'Confirm')}">
                </div>
            </div>
        </div>

        <div class="modal-footer">
            <button type="submit" class="btn btn-primary">
                <g:message code="security.register.label" default="Register"/>
            </button>
        </div>
    </g:formRemote>
</div>

<script>
    $(document).ready(function () {
        $('#register_form').validate({
            rules: {
                username: {
                    required: true
                },
                email: {
                    email: true,
                    required: true
                }
            }
        });
    });


    function hide() {
        $(':input', '#register_form')
                .not(':button, :submit, :reset, :hidden')
                .val('')
                .removeAttr('checked')
                .removeAttr('selected');
                $('#RegisterModal').modal('hide');
    }

</script>

