codeunit 60010 "Substitute Reports"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnSubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        if ReportId = Report::"Sales - Invoice" then
            NewReportId := Report::"AP Sales - Invoice";
    end;
}