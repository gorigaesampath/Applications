public class birthday{
    public void execute(){
        emailTemplate e = [select Id from emailTemplate where name = 'Birthday'];
        List<contact> conList = [select Id,Birthdate,email from contact where Id in ('00328000003WTRI','00328000003VPr2')];
        List<string> emailList = new List<string>();
        for(contact c : conList)
          emailList.add(c.email);
          string[] ccAddresses  = emailList;
          for(contact c : conList) {
              Id bdayId = null;
               if(c.birthdate != null && c.Birthdate.format()== system.today().format()){
                bdayId=c.Id;
                }
                if(bdayId != null){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();      
                contact con = [select Id from contact where Id=:bdayId];
                mail.setTargetObjectId(con.Id);
                mail.setCCAddresses(emailList);
               mail.setTemplateId(e.Id);      
               Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
               }
           }
       }
 }