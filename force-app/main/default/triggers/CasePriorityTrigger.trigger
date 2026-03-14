trigger CasePriorityTrigger on Case (before insert, before update) {
    for(case c : Trigger.new) {
        Integer score = 0;
        
        if(c.Type == 'Mechanical') score += 30;
        else if(c.Type =='Electrical') score += 25;
        else if(c.Type == 'Structural') score += 20;
        else score += 10;
        
        if (c.Origin == 'Phone') score += 20;
        else if (c.Origin == 'Email') score += 10;
        else if (c.Origin == 'Web') score += 5;
        
        if (c.Priority == 'High') score += 25;
        else if (c.Priority == 'Medium') score += 15;
        
        c.Priority_Score__c = score;
        
        DateTime now = DateTime.now();
        if(score >= 60) c.SLA_Deadline__c = now.addHours(4);
        else if(score >= 40) c.SLA_Deadline__c = now.addHours(8);
        else if(score >= 20) c.SLA_Deadline__c = now.addHours(24);
        else c.SLA_Deadline__c = now.addHours(48);   
    }
}
