<%
    def angularLocale = context.locale.toString().toLowerCase();

    ui.includeJavascript("uicommons", "angular.min.js")
    ui.includeJavascript("uicommons", "i18n/angular-locale_" + angularLocale + ".js")
    ui.includeJavascript("uicommons", "angular-ui/ui-bootstrap-tpls-0.6.0.min.js")
    ui.includeJavascript("uicommons", "angular-ui/ng-grid-2.0.7.min.js")
    ui.includeJavascript("uicommons", "angular-ui/ng-grid-locale_ht-custom.js")
    ui.includeJavascript("uicommons", "angular-ui/ng-grid-flexible-height.js")
    ui.includeJavascript("uicommons", "angular-resource.min.js")
    ui.includeJavascript("uicommons", "moment.min.js")
    ui.includeJavascript("uicommons", "emr.js")
    ui.includeCss("uicommons", "angular-ui/ng-grid.min.css")

    ui.includeJavascript("appointmentschedulingui","app.js")
    ui.includeJavascript("appointmentschedulingui", "services/appointmentService.js")
    ui.includeJavascript("appointmentschedulingui", "factories/ngGridHelper.js")
    ui.includeJavascript("appointmentschedulingui", "resources/appointmentResources.js")
    ui.includeJavascript("appointmentschedulingui", "controllers/patientAppointmentRequestsController.js")

    ui.includeCss("appointmentschedulingui", "gridStyle.css")
    ui.includeCss("appointmentschedulingui", "patientAppointmentRequests.css")

%>

<%= ui.includeFragment("appui", "messages", [ codes: [
        'appointmentschedulingui.scheduleAppointment.serviceType',
        'appointmentschedulingui.scheduleAppointment.provider',
        'appointmentschedulingui.scheduleAppointment.requestTimeFrame',
        'appointmentschedulingui.scheduleAppointment.actions',
        'appointmentschedulingui.scheduleAppointment.cancelAppointmentRequest.tooltip',
        'appointmentschedulingui.scheduleAppointment.bookAppointment.tooltip',
        'appointmentschedulingui.scheduleAppointment.showNotes.tooltip',
        'appointmentschedulingui.scheduleAppointment.errorCancelingAppointmentRequest',
        'appointmentschedulingui.timeframeunits.DAYS',
        'appointmentschedulingui.timeframeunits.WEEKS',
        'appointmentschedulingui.timeframeunits.YEARS'

].flatten()
]) %>

<script type="text/javascript">
    var jsLocale = '${ angularLocale }';  // used by the ngGrid widget
</script>

<!-- list of patient appointment requests -->
<div id="appointmentscheduling-patientAppointmentRequests"  ng-controller='PatientAppointmentRequestsCtrl' ng-init="init('${ patient.patient.uuid }')">

    <!-- TODO: do we want "show scheduled appointment" flag here? -->
    <div ng-show="showAppointmentRequests">
        <h2>
            ${ ui.message("appointmentschedulingui.scheduleAppointment.patientAppointmentRequests") }
        </h2>

        <table id="appointmentRequestsGridTable" class="gridStyle" ng-grid="appointmentRequestsGrid" ></table>
    </div>

    <div id="confirm-cancel-appointment-request" class="dialog" ng-show="showCancelAppointmentRequest">
        <div class="dialog-header">
            <h3>${ ui.message("appointmentschedulingui.scheduleAppointment.cancelAppointmentRequest.title") }</h3>
        </div>
        <div class="dialog-content">
            ${ ui.message("appointmentschedulingui.scheduleAppointment.cancelAppointmentRequest.confirm.text") }
            <br/>
            <button class="button confirm right" ng-click="doCancelAppointmentRequest()"> ${ ui.message("appointmentschedulingui.scheduleAppointment.cancelAppointmentRequest.confirm.yes") }</button>
            <button class="button cancel" ng-click="doNotCancelAppointmentRequest()"> ${ ui.message("appointmentschedulingui.scheduleAppointment.cancelAppointmentRequest.confirm.no") }</button>
        </div>
    </div>

    <div id="appointment-request-notes" class="dialog" ng-show="showNotesDialog">
        <div class="dialog-header">
            <h3>${ ui.message("appointmentschedulingui.scheduleAppointment.appointmentRequestNotes") }</h3>
        </div>
        <div class="dialog-content" ng-bind="notesDialogContent">

        </div>
        <button class="button confirm right" ng-click="closeNotesDialog()"> ${ ui.message("uicommons.close") }</button>
    </div>

</div>
<!-- end of patient appointment requests -->