--liquibase formatted.sql
--changeset michael.cawayan:MONITOR.IOIT_V_RTDM_LOG_IF143_REL contextFilter:PH endDelimiter:/ runOnChange:true

CREATE OR REPLACE EDITIONABLE TRIGGER "MONITOR"."IOIT_V_RTDM_LOG_IF143_REL" 
INSTEAD OF INSERT ON monitor.V_RTDM_LOG_IF143_REL
FOR EACH ROW
BEGIN
  MERGE INTO monitor.RTDM_LOG_IF143_REL t
  USING
  (
    SELECT
 :NEW.CORRELATION_ID AS CORRELATION_ID
,:NEW.EVENT_NAME AS EVENT_NAME
,:NEW.EVENT_TIMESTAMP AS EVENT_TIMESTAMP
,:NEW.STATUS AS STATUS
,:NEW.STATUS_DESCRIPTION AS STATUS_DESCRIPTION
,:NEW.RTDM_HOSTNAME AS RTDM_HOSTNAME
,:NEW.ACCOUNT_STATUS AS ACCOUNT_STATUS
,:NEW.ACCOUNT_TYPE AS ACCOUNT_TYPE
,:NEW.ACCOUNT_NUMBER AS ACCOUNT_NUMBER
,:NEW.EVENT_TYPE_ENUM AS EVENT_TYPE_ENUM
,:NEW.TXN_SOURCEID_SOURCE_SYSTEM AS TXN_SOURCEID_SOURCE_SYSTEM
,:NEW.TXN_SOURCEID_SOURCE_TXID AS TXN_SOURCEID_SOURCE_TXID
,:NEW.TRUNCATED_PAN AS TRUNCATED_PAN
,:NEW.AUTH_AUTHORIZATION_MODE AS AUTH_AUTHORIZATION_MODE
,:NEW.AUTH_CU_MCC AS AUTH_CU_MCC
,:NEW.AUTH_CU_CA_CITY AS AUTH_CU_CA_CITY
,:NEW.AUTH_CU_CA_COUNTRY_CODE AS AUTH_CU_CA_COUNTRY_CODE
,:NEW.AUTH_CU_CA_NAME AS AUTH_CU_CA_NAME
,:NEW.AUTH_BILLING_AMOUNT_VALUE AS AUTH_BILLING_AMOUNT_VALUE
,:NEW.AUTH_TXN_AMOUNT_VALUE AS AUTH_TXN_AMOUNT_VALUE
,:NEW.AUTH_TXN_AMOUNT_CURRENCY AS AUTH_TXN_AMOUNT_CURRENCY
,:NEW.AUTH_TYPE	AS AUTH_TYPE
,:NEW.UPDATED_DTTM AS UPDATED_DTTM
      FROM dual
  ) s
  ON (t.CORRELATION_ID = s.CORRELATION_ID)
  WHEN MATCHED THEN
    UPDATE
    SET
 t.EVENT_NAME                 = s.EVENT_NAME                
,t.EVENT_TIMESTAMP            = s.EVENT_TIMESTAMP           
,t.STATUS                     = s.STATUS                    
,t.STATUS_DESCRIPTION         = s.STATUS_DESCRIPTION        
,t.RTDM_HOSTNAME              = s.RTDM_HOSTNAME             
,t.ACCOUNT_STATUS	          = s.ACCOUNT_STATUS	         
,t.ACCOUNT_TYPE	              = s.ACCOUNT_TYPE	             
,t.ACCOUNT_NUMBER	          = s.ACCOUNT_NUMBER	         
,t.EVENT_TYPE_ENUM	          = s.EVENT_TYPE_ENUM	         
,t.TXN_SOURCEID_SOURCE_SYSTEM = s.TXN_SOURCEID_SOURCE_SYSTEM	
,t.TXN_SOURCEID_SOURCE_TXID	  = s.TXN_SOURCEID_SOURCE_TXID	 
,t.TRUNCATED_PAN              = s.TRUNCATED_PAN             
,t.AUTH_AUTHORIZATION_MODE	  = s.AUTH_AUTHORIZATION_MODE	 
,t.AUTH_CU_MCC	              = s.AUTH_CU_MCC	             
,t.AUTH_CU_CA_CITY	          = s.AUTH_CU_CA_CITY	         
,t.AUTH_CU_CA_COUNTRY_CODE	  = s.AUTH_CU_CA_COUNTRY_CODE	 
,t.AUTH_CU_CA_NAME	          = s.AUTH_CU_CA_NAME	         
,t.AUTH_BILLING_AMOUNT_VALUE  = s.AUTH_BILLING_AMOUNT_VALUE 
,t.AUTH_TXN_AMOUNT_VALUE	  = s.AUTH_TXN_AMOUNT_VALUE	 
,t.AUTH_TXN_AMOUNT_CURRENCY   = s.AUTH_TXN_AMOUNT_CURRENCY  
,t.AUTH_TYPE	              = s.AUTH_TYPE	             
,t.UPDATED_DTTM	              = s.UPDATED_DTTM	             
,t.LOG_SOURCE                 = 'ESP'
	WHERE t.STATUS IS NULL
  WHEN NOT MATCHED THEN
    INSERT (
        t.REL_LOG_ID
       ,t.CORRELATION_ID
,t.EVENT_NAME                
,t.EVENT_TIMESTAMP           
,t.STATUS                    
,t.STATUS_DESCRIPTION        
,t.RTDM_HOSTNAME             
,t.ACCOUNT_STATUS	         
,t.ACCOUNT_TYPE	             
,t.ACCOUNT_NUMBER	         
,t.EVENT_TYPE_ENUM	         
,t.TXN_SOURCEID_SOURCE_SYSTEM
,t.TXN_SOURCEID_SOURCE_TXID	 
,t.TRUNCATED_PAN             
,t.AUTH_AUTHORIZATION_MODE	 
,t.AUTH_CU_MCC	             
,t.AUTH_CU_CA_CITY	         
,t.AUTH_CU_CA_COUNTRY_CODE	 
,t.AUTH_CU_CA_NAME	         
,t.AUTH_BILLING_AMOUNT_VALUE 
,t.AUTH_TXN_AMOUNT_VALUE	 
,t.AUTH_TXN_AMOUNT_CURRENCY  
,t.AUTH_TYPE	             
,t.UPDATED_DTTM	             
,t.LOG_SOURCE                
    )
    VALUES (
        monitor.GET_IF143_ID
,s.CORRELATION_ID
,s.EVENT_NAME                
,s.EVENT_TIMESTAMP           
,s.STATUS                    
,s.STATUS_DESCRIPTION        
,s.RTDM_HOSTNAME             
,s.ACCOUNT_STATUS	         
,s.ACCOUNT_TYPE	             
,s.ACCOUNT_NUMBER	         
,s.EVENT_TYPE_ENUM	         
,s.TXN_SOURCEID_SOURCE_SYSTEM
,s.TXN_SOURCEID_SOURCE_TXID	 
,s.TRUNCATED_PAN             
,s.AUTH_AUTHORIZATION_MODE	 
,s.AUTH_CU_MCC	             
,s.AUTH_CU_CA_CITY	         
,s.AUTH_CU_CA_COUNTRY_CODE	 
,s.AUTH_CU_CA_NAME	         
,s.AUTH_BILLING_AMOUNT_VALUE 
,s.AUTH_TXN_AMOUNT_VALUE	 
,s.AUTH_TXN_AMOUNT_CURRENCY  
,s.AUTH_TYPE	             
,s.UPDATED_DTTM	             
,'ESP'
    );
END;
/
ALTER TRIGGER "MONITOR"."IOIT_V_RTDM_LOG_IF143_REL" ENABLE
/