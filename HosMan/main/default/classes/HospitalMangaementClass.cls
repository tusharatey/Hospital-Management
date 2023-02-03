public with sharing class HospitalMangaementClass {
    public  List<New_Patient__c> acc  {get;set;}
 
   public String searchKey {get;set;}
    private integer offsetSize=0;
    private integer limitSize=10;
    public  List<string> ids{set;get;}
    public string recID {set;get;}
    public PageReference flowPage{set;get;}
    public HospitalMangaementClass() {
        acc = new List<New_Patient__c>();
       acc=  Database.query('select id,Name,Name1__c,Sex__c,Date_Time__c,Email_ID__c,Mobile_No__c from New_Patient__c    ORDER BY name ASC  Limit '+limitSize+' Offset '+offsetSize   );
       
    }
    
     public  void  search(){
        
       string searchquery='select id,Name,Name1__c,Sex__c,Date_Time__c,Email_ID__c,Mobile_No__c from New_Patient__c where Name1__c like \'%'+searchKey+'%\' ORDER BY name ASC Limit '+limitSize+' Offset '+offsetSize;
       acc= Database.query(searchquery);
          
       
       if(searchKey == null){
           acc= Database.query('select id,Name,Name1__c,Sex__c,Date_Time__c,Email_ID__c,Mobile_No__c from New_Patient__c ORDER BY name ASC  Limit '+limitSize+' Offset '+offsetSize );
       }
         
    }

    
    public void clear(){
        acc.clear();
     searchKey = null;
        acc=  Database.query('select id,Name,Name1__c,Sex__c,Date_Time__c,Email_ID__c,Mobile_No__c from New_Patient__c ORDER BY name ASC   Limit '+limitSize+' Offset '+offsetSize );
        acc.clear();
        acc=  Database.query('select id,Name,Name1__c,Sex__c,Date_Time__c,Email_ID__c,Mobile_No__c from New_Patient__c ORDER BY name ASC   Limit '+limitSize+' Offset '+offsetSize );
    }
    public void previous()
    {
        offsetSize = offsetSize - limitSize;
        search();
        clear();
    }
    public void next(){
        OffsetSize= offsetSize + limitSize;
        search();
        clear();
    }
    public Boolean gethasPrevious()
{
  return (offsetSize > 0);
}
      public Boolean gethasNext()
{
    if (acc.size() < offsetSize){
        return false; 
    }
   
    else{
       return true;
    }
}
    public pagereference GotoFlow( ){
       
          //String urlParams = '?RecordId=' + string.join(FulfillmentOrdersId(acc), '&ids=');
       PageReference flowPage =  new PageReference('/flow/HospitalFlow?RecordId=');
         //  flowPage.getParameters()                                 
       flowPage.setRedirect(true);
       return flowPage;
    }
   public List<String> FulfillmentOrdersId(List<New_Patient__c> acc) {
      
         ids = new List<string>();

          for (New_Patient__c record : acc) {
              ids.add(record.Id);
                 }
        return ids;
    }
   
}