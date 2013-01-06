<%@ page import="ro.isi.restaurant.Rezervare" %>
<%@ page import="groovy.time.TimeCategory" %>
<g:set var="calendar" value="${Calendar.getInstance()}"/>
<% calendar.setTime(new Date()) %>



<div class="control-group fieldcontain ${hasErrors(bean: rezervareInstance, field: 'startDate', 'error')} ">
    <label for="startDate" class="control-label"><g:message code="rezervare.startDate.label"
                                                            default="Start Date"/></label>

    <div class="controls">
        <g:customDatePicker name="startDate" precision="hour" value="${rezervareInstance?.startDate}"
                            default="${calendar.getTime()}"
                            years="${calendar.get(Calendar.YEAR)..calendar.get(Calendar.YEAR) + 1}"/>
        <span class="help-inline">${hasErrors(bean: rezervareInstance, field: 'startDate', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: rezervareInstance, field: 'endDate', 'error')} ">
    <label for="endDate" class="control-label"><g:message code="rezervare.endDate.label" default="End Date"/></label>

    <div class="controls">
        <g:customDatePicker name="endDate" precision="hour" value="${rezervareInstance?.endDate}"
                            default="${calendar.getTime()}"
                            years="${calendar.get(Calendar.YEAR)..calendar.get(Calendar.YEAR) + 1}"/>
        <span class="help-inline">${hasErrors(bean: rezervareInstance, field: 'endDate', 'error')}</span>
    </div>
</div>

<div class="control-group fieldcontain ${hasErrors(bean: rezervareInstance, field: 'masa', 'error')} required">
    <label for="masa" class="control-label"><g:message code="rezervare.masa.label" default="Masa"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:select id="masa" name="masa.id" from="[]"
                  value="${rezervareInstance?.masa?.id}" class="many-to-one"/>
        <span class="help-inline">${hasErrors(bean: rezervareInstance, field: 'masa', 'error')}

            <a href="javascript:void(0)" class="btn btn-success" onclick="getTables()">
                <g:message code="rezervare.check.label" default="Get Tables"/>
            </a>

    </div>

</div>

<div class="control-group fieldcontain required">
    <label for="name" class="control-label"><g:message code="rezervare.name.label" default="Name"/><span
            class="required-indicator">*</span></label>

    <div class="controls">
        <g:field type="text" name="name" required="" value="${rezervareInstance.name}"/>
        <span class="help-inline">${hasErrors(bean: rezervareInstance, field: 'name', 'error')}</span>
    </div>
</div>

<script>
    function getDate(preffix) {
        var year = $('#' + preffix + '_year').val();
        var month = $('#' + preffix + '_month').val() - 1;
        var day = $('#' + preffix + '_day').val();
        var hour = $('#' + preffix + '_hour').val();
        return new Date(year, month, day, hour, 0, 0, 0)
    }

    function getDate2(preffix) {
        var year = preffix + '_year=' + $('#' + preffix + '_year').val();
        var month = preffix + '_month=' + $('#' + preffix + '_month').val();
        var day = preffix + '_day=' + $('#' + preffix + '_day').val();
        var hour = preffix + '_hour=' + $('#' + preffix + '_hour').val();
        var params = "";
        return year + '&' + month + '&' + day + '&' + hour;
    }

    function resetTables(data) {
        $select = $('#masa');
        $select.empty();
        $.each(data, function (index, value) {
            var line = '<option value="'+value.id+'">'+value.description+'</option>';
            $select.append(line);
        })
    }

    function getTables() {
        ${remoteFunction(controller:"rezervare", class:"btn btn-success", action:"getFreeTables",
         onSuccess:'resetTables(data)',
         params:' getDate2("startDate")+"&"+getDate2("endDate") ')
        }
    }

    $(document).ready(function() {
        $('[name^="startDate"]').live('change', function() {$('#masa').empty();} );
        $('[name^="endDate"]').live('change', function() {$('#masa').empty();} );
    });
</script>