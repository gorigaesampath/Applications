trigger OpportunityTrigger on Opportunity  (before insert, before update) {
        for(opportunity o : trigger.new){
                if(o.StageName == 'Closed Lost')
                            o.Territory2Id  = null;
           }
}