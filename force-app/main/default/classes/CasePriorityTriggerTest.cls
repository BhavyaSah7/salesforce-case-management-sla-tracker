@isTest
public class CasePriorityTriggerTest {

    @isTest
    static void testHighPriorityCase() {
        Case c = new Case(
            Subject = 'Test High Priority',
            Type = 'Mechanical',
            Origin = 'Phone',
            Priority = 'High'
        );

        Test.startTest();
        insert c;
        Test.stopTest();

        Case result = [SELECT Priority_Score__c, SLA_Deadline__c 
                       FROM Case WHERE Id = :c.Id];

        // Mechanical(30) + Phone(20) + High(25) = 75
        System.assertEquals(75, result.Priority_Score__c, 'Score should be 75');
        System.assertNotEquals(null, result.SLA_Deadline__c, 'SLA Deadline must be set');
    }
    
    @isTest
    static void testLowPriorityCase() {
        Case c = new Case(
            Subject = 'Test Low Priority',
            Type = 'Other',
            Origin = 'Web',
            Priority = 'Low'
        );

        Test.startTest();
        insert c;
        Test.stopTest();

        Case result = [SELECT Priority_Score__c, SLA_Deadline__c 
                       FROM Case WHERE Id = :c.Id];

        // Other(10) + Web(5) + Low(0) = 15 → 48 hour SLA
        System.assertEquals(15, result.Priority_Score__c, 'Score should be 15');
        System.assertNotEquals(null, result.SLA_Deadline__c, 'SLA Deadline must be set');
    }

    @isTest
    static void testBulkInsert() {
        List<Case> cases = new List<Case>();
        for (Integer i = 0; i < 200; i++) {
            cases.add(new Case(
                Subject = 'Bulk Test Case ' + i,
                Type = 'Electrical',
                Origin = 'Email',
                Priority = 'Medium'
            ));
        }

        Test.startTest();
        insert cases;
        Test.stopTest();

        List<Case> results = [SELECT Priority_Score__c FROM Case WHERE Subject LIKE 'Bulk Test%'];
        System.assertEquals(200, results.size(), 'All 200 cases should be inserted');
        for (Case r : results) {
            // Electrical(25) + Email(10) + Medium(15) = 50
            System.assertEquals(50, r.Priority_Score__c, 'Each case score should be 50');
        }
    }
}
