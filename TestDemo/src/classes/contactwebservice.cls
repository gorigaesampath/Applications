public class contactwebservice{

    public contact sampleContact{ get; set; }

    public contactwebservice() {

    }

 private String sapUserDet = 'sapintegration@hollister.com.dev' + ':' + 'H0llisterBIZtalk';
 public contactwebservice(ApexPages.StandardController controller) {
        sampleContact = (contact)controller.getRecord();
 }
public void createContact() {
        soapSforceComSchemasClassGlwebsitec.createContactRequest contactRequest = new soapSforceComSchemasClassGlwebsitec.createContactRequest();
        
        system.debug('contact === reuqest '+contactRequest);
        
        
    /*    contactRequest.firstName = sampleContact.firstName;
        contactRequest.lastName = sampleContact.lastName;
        contactRequest.email = sampleContact.email;*/





    soapSforceComSchemasClassGlwebsitec.GLWebSiteContactWebService service = new soapSforceComSchemasClassGlwebsitec.GLWebSiteContactWebService();
        service.timeout_x = 120000;
            //@AbhaS added on 09/03/14
            Blob headerValue = Blob.valueOf(sapUserDet);
            String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
            service.inputHttpHeaders_x = new Map<String,String>();
            service.inputHttpHeaders_x.put('Authorization', authorizationHeader);
            
            service.submitContactInformation(contactRequest);
         }
     }