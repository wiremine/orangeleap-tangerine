UPDATE PICKLIST_ITEM SET INACTIVE=false;

UPDATE PICKLIST_ITEM pi, PICKLIST p SET INACTIVE=true where pi.PICKLIST_ID=p.PICKLIST_ID and PICKLIST_NAME_ID='currencyCode';
UPDATE PICKLIST_ITEM pi, PICKLIST p SET INACTIVE=false where pi.PICKLIST_ID=p.PICKLIST_ID and PICKLIST_NAME_ID='currencyCode' and ITEM_NAME='USD';


