package com.ishanitech.ipalika.dao;

import com.ishanitech.ipalika.utils.ApprovalStatusUtil;
import org.jdbi.v3.sqlobject.customizer.Define;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.transaction.Transaction;

public interface CommonDAO {

    @SqlUpdate("UPDATE registration_report SET <currentStatus> = <currentStatus> -1 , <futureStatus> = <futureStatus> + 1 WHERE form_info_id = :formInfoId ")
    void updateRegistrationReports(@Define String currentStatus, @Define String futureStatus, Integer formInfoId);

    @SqlUpdate("UPDATE registration_report SET <futureStatus> = <futureStatus> + 1, total = total + 1 WHERE form_info_id = :formInfoId  ")
    void updateRegistrationReports( @Define String futureStatus, Integer formInfoId);

    @Transaction
    default void updateRegistrationReportForm(Integer futureStatus, Integer formInfoId) {
        switch (futureStatus) {
            case 1:
                updateRegistrationReports(ApprovalStatusUtil.UNVERIFIED.getStatusLevel(), formInfoId);
                break;
            case 2:
                updateRegistrationReports(ApprovalStatusUtil.UNVERIFIED.getStatusLevel(), ApprovalStatusUtil.STAMPED.getStatusLevel(), formInfoId);
                break;
            case 3:
                updateRegistrationReports(ApprovalStatusUtil.STAMPED.getStatusLevel(), ApprovalStatusUtil.REGISTERED.getStatusLevel(), formInfoId);
                break;
            case 4:
                updateRegistrationReports(ApprovalStatusUtil.REGISTERED.getStatusLevel(), ApprovalStatusUtil.PROCESSED.getStatusLevel(), formInfoId);
                break;
            case 5:
                updateRegistrationReports(ApprovalStatusUtil.PROCESSED.getStatusLevel(), ApprovalStatusUtil.VERIFIED.getStatusLevel(), formInfoId);
                break;

        }
    }
}
