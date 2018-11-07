@IsTest
public class mm_RegisterForEventUnansweredTest {
	static testMethod void mm_RegisterForEvent_CreateNewRegistration() {
        //create test custom setting:
        //privateKey
        insert new EventTokenHashKey__c(Crypto__c = '123456789123456789112234');
        
        // Create account
        Account acc = new Account();
        acc.Name = 'Matson Money Default';
        
        insert acc;
        //create Track
        Track__c tra = new Track__c();
        tra.Name = 'testtrack';
        
        insert tra;
        
        //Create a Venue
        Venue__c ven = new Venue__c();
        
        ven.Name = 'testVenue';
        ven.Street_Address_1__c = '18760 N Pima Rd';
        ven.City__c ='Scottsdale';
        ven.Venue_State__c = 'AZ';
        ven.Postal_Code_Zip__c = '85255';
        ven.Country__c = 'United States';
        ven.Concierge__c = 'Mason';
        
        insert ven;
        
        //Create an Event
        Event__c evt = new Event__c();
        evt.Name = 'American Dream Experience Test Event name';
        evt.Event_Type__c = 'Training Event';
        evt.Maximum_Registration__c = 50;
        evt.Event_Start_Date__c = System.today() + 5;
        evt.Course_Name__c = 'Other'; 
        evt.Venue__c = ven.Id;
        evt.Track__c = tra.Id;
        evt.Event_Start_Date__c = System.today() + 55;
        evt.Event_End_Date__c  = System.today() + 56;
        evt.ShowOnWebsite__c = true;
        evt.Event_Description__c = 'test';
        evt.Email_Invite_Body__c = 'test';
        evt.Email_Registered_Body__c = 'test';
        evt.Email_Cancelled_Body__c = 'test';
        
        insert evt;
        
        // Create EventQuestions
        EventQuestion__c pQ = new EventQuestion__c();
        pQ.Answer_Type__c = 'Picklist';
        pQ.Question_Text__c = 'How many dogs do you have?';
        
        insert pQ;
        
        EventQuestionOption__c pQO1 = new EventQuestionOption__c();
        pQO1.Event_Question__c = pQ.Id;
        pQO1.Option__c = 'Exactly One Doggie';
        pQO1.Sort_Order__c = 1;
        
        insert pQO1;
        
        EventQuestionOption__c pQO2 = new EventQuestionOption__c();
        pQO2.Event_Question__c = pQ.Id;
        pQO2.Option__c = 'Two Doggers';
        pQO2.Sort_Order__c = 1;
        
        insert pQO2;
        
        EventQuestionOption__c pQO3 = new EventQuestionOption__c();
        pQO3.Event_Question__c = pQ.Id;
        pQO3.Option__c = 'Three Or More Dogglemutts';
        pQO3.Sort_Order__c = 1;
        
        insert pQO3;
        
        EventQuestion__c mQ = new EventQuestion__c();
        mQ.Answer_Type__c = 'MultiSelect';
        mQ.Question_Text__c = 'What kind of animals do you have?';
        
        insert mQ;
        
        EventQuestionOption__c mQO1 = new EventQuestionOption__c();
        mQO1.Event_Question__c = mQ.Id;
        mQO1.Option__c = 'Cats';
        mQO1.Sort_Order__c = 1;
        
        insert mQO1;
        
        EventQuestionOption__c mQO2 = new EventQuestionOption__c();
        mQO2.Event_Question__c = mQ.Id;
        mQO2.Option__c = 'Dogs';
        mQO2.Sort_Order__c = 1;
        
        insert mQO2;
        
        EventQuestionOption__c mQO3 = new EventQuestionOption__c();
        mQO3.Event_Question__c = mQ.Id;
        mQO3.Option__c = 'Children';
        mQO3.Sort_Order__c = 1;
        
        insert mQO3;
        
        EventQuestion__c tQ = new EventQuestion__c();
        tQ.Answer_Type__c = 'Text';
        tQ.Question_Text__c = 'What are the names of your animals?';
        
        insert tQ;
        
        EventQuestion__c cQ = new EventQuestion__c();
        cQ.Answer_Type__c = 'Checkbox';
        cQ.Question_Text__c = 'Check if you love puppies';
        
        insert cQ;
        
        // Create EventEventQuestions
        EventEventQuestion__c pEQ = new EventEventQuestion__c();
        pEQ.Event_Question__c = pQ.Id;
        pEQ.Is_Required__c = true;
        pEQ.IsActive__c = true;
        pEQ.Matson_Event__c = evt.Id;
        pEQ.Question_Type__c = 'Registration';
        pEQ.Sort_Order__c = 1;
        
        insert pEQ;
        
        EventEventQuestion__c mEQ = new EventEventQuestion__c();
        mEQ.Event_Question__c = mQ.Id;
        mEQ.Is_Required__c = true;
        mEQ.IsActive__c = true;
        mEQ.Matson_Event__c = evt.Id;
        mEQ.Question_Type__c = 'Registration';
        mEQ.Sort_Order__c = 2;
        
        insert mEQ;
        
        EventEventQuestion__c tEQ = new EventEventQuestion__c();
        tEQ.Event_Question__c = tQ.Id;
        tEQ.Is_Required__c = true;
        tEQ.IsActive__c = false;
        tEQ.Matson_Event__c = evt.Id;
        tEQ.Question_Type__c = 'Registration';
        tEQ.Sort_Order__c = 3;
        
        insert tEQ;
        
        EventEventQuestion__c cEQ = new EventEventQuestion__c();
        cEQ.Event_Question__c = cQ.Id;
        cEQ.Is_Required__c = true;
        cEQ.IsActive__c = false;
        cEQ.Matson_Event__c = evt.Id;
        cEQ.Question_Type__c = 'Registration';
        cEQ.Sort_Order__c = 4;
        
        insert cEQ;
        
        // Create a contact
        Contact con = new Contact();
        con.FirstName = 'Darth';
        con.LastName = 'Vader' ;
        con.Email ='Vader@Vader.com';
        con.Office_Phone__c = '4561328888';
        con.MailingStreet = '1 DeathStar rd';
        con.MailingCity = 'Mason';
        con.MailingState = 'Ohio';
        con.MailingPostalCode = '45040';
        con.AccountId = acc.Id;
        
        insert con;
        
        // Create a guest contact
        Contact guest = new Contact();
        guest.FirstName = 'Luke';
        guest.LastName = 'Skywalker';
        guest.Email = 'luke@skywalker.com';
        
        insert guest;
        
        // Create another guest contact
        Contact guest2 = new Contact();
        guest2.FirstName = 'Jar Jar';
        guest2.LastName = 'Binks';
        guest2.Email = 'jarjar@binks.com';
        
        insert guest2;
        
        // Create an Advisor 
        RecordType RT2 = [SELECT Id,Name FROM RecordType WHERE Name = 'Adviser Prospect' and SobjectType='Adviser__c'];
        Adviser__c adv = new Adviser__c();
        adv.Company__c = 'Test comp';
        adv.RecordTypeId = RT2.Id;
        adv.Primary_Contact__c = con.Id;
        adv.X3_Biggest_Money_Problems__c ='some text';
        adv.Pain_Money_Total__c =356;
        adv.Status__c= 'Active Prospect';
        adv.Service_Team__c = '2' ;
        adv.Designation__c  ='BD' ; 
        adv.Adviser_Coach__c = '00536000001OWzVAAW';
        adv.Firm_ID__c = '22222222' ;
        adv.Legacy_RepNo__c = 123456;
        
        insert adv;
        Test.startTest();
        
        // Create an Event Registration
        Event_Registration__c eventRegistration = new Event_Registration__c();
        eventRegistration.Event__c = evt.Id;
        eventRegistration.Status__c = 'Registered';
        eventRegistration.T_Shirt_Size__c = 'XL';
        eventRegistration.Reg_Adviser__c = adv.Id;
        eventRegistration.Attendee_Type__c = 'Adviser';
        eventRegistration.Waiver_Status__c = 'Electronically Signed';
        
        insert eventRegistration;
        
        // Create an event registration to delete
        Event_Registration__c erdel = new Event_Registration__c();
        erdel.Event__c = evt.Id;
        erdel.Status__c = 'Registered';
        erdel.T_Shirt_Size__c = 'XL';
        erdel.Contact__c = guest.Id;
        erdel.Parent_Registration__c = eventRegistration.id;
        erdel.Attendee_Type__c = 'Guest';
        erdel.Waiver_Status__c = 'Electronically Signed';
        
        insert erdel;
    
        // Create an event registration to update
        Event_Registration__c erupd = new Event_Registration__c();
        erupd.Event__c = evt.Id;
        erupd.Status__c = 'Registered';
        erupd.T_Shirt_Size__c = 'XL';
        erupd.Contact__c = guest2.Id;
        erupd.Parent_Registration__c = eventRegistration.id;
        erupd.Attendee_Type__c = 'Guest';
        erupd.Waiver_Status__c = 'Electronically Signed';
        insert erupd;
        
        
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        
        req.requestURI = '/services/apexrest/mm_RegisterForEvent/';
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        RestRequest request = new RestRequest();
        
        List<mm_RegisterForEvent.Option> qOptions = new List<mm_RegisterForEvent.Option>();
        mm_RegisterForEvent.Option rQO1 = new mm_RegisterForEvent.Option();
        rQO1.Id = pQO1.Id;
        rQO1.Selected = false;
        qOptions.Add(rQO1);
        mm_RegisterForEvent.Option rQO2 = new mm_RegisterForEvent.Option();
        rQO2.Id = pQO2.Id;
        rQO2.Selected = false;
        qOptions.Add(rQO2);
        mm_RegisterForEvent.Option rQO3 = new mm_RegisterForEvent.Option();
        rQO3.Id = pQO3.Id;
        rQO3.Selected = false;
        qOptions.Add(rQO3);
        
        List<mm_RegisterForEvent.Guest> guests = new List<mm_RegisterForEvent.Guest>();
                
        mm_RegisterForEvent.Question rPQ = new mm_RegisterForEvent.Question();
        rPQ.Id = pEQ.Id;
        rPQ.AnswerType = 'PickList';
        rPQ.Options = qOptions;
        
        mm_RegisterForEvent.Question rMQ = new mm_RegisterForEvent.Question();
        rMQ.Id = mEQ.Id;
        rMQ.AnswerType = 'MultiSelect';
        rMQ.Options = qOptions;
        
        mm_RegisterForEvent.Question rTQ = new mm_RegisterForEvent.Question();
        rTQ.Id = tEQ.Id;
        rTQ.AnswerType = 'Text';
        rtQ.Answer = null;
        
        mm_RegisterForEvent.Question rCQ = new mm_RegisterForEvent.Question();
        rCQ.Id = cEQ.Id;
        rCQ.AnswerType = 'Checkbox';
        rCQ.Checked = null;
        
        mm_RegisterForEvent.Guest gToDelete = new mm_RegisterForEvent.Guest();
        gToDelete.ContactId = guest.Id;
        gToDelete.EmailAddress = guest.Email;
        gToDelete.FirstName = guest.FirstName;
        gToDelete.IsDeleted = true;
        gToDelete.LastName = guest.LastName;
        gToDelete.ParentEventRegistrationId = erdel.Parent_Registration__c;
        gToDelete.RegistrationStatus = 'Registered';
        gToDelete.ShirtSize = 'XL';
        guests.Add(gToDelete);
        
        mm_RegisterForEvent.Guest gToAdd = new mm_RegisterForEvent.Guest();
        gToAdd.EmailAddress = 'guest@example.com';
        gToAdd.FirstName = 'Snuffy';
        gToAdd.LastName = 'Mc.SnarfyPants';
        gToAdd.RegistrationStatus = 'Invited';
        gToAdd.ShirtSize = 'L';
        guests.Add(gToAdd);
        
        mm_RegisterForEvent.Guest gToUpdate = new mm_RegisterForEvent.Guest();
        gToUpdate.EmailAddress = guest2.Email;
        gToUpdate.FirstName = guest2.FirstName;
        gToUpdate.LastName = guest2.LastName;
        gToUpdate.RegistrationStatus = 'Invited';
        gToUpdate.ShirtSize = 'L';
        gToUpdate.ContactId = guest2.Id;
        gToUpdate.ParentEventRegistrationId = erupd.Parent_Registration__c;
        guests.add(gToUpdate);
        
        List<mm_RegisterForEvent.Question> registrantQs = new List<mm_RegisterForEvent.Question>();
        
        registrantQs.add(rPQ);
        registrantQs.add(rMQ);
        registrantQs.add(rTQ);
        registrantQs.add(rCQ);
        
        mm_RegisterForEvent.Registration registration = new mm_RegisterForEvent.Registration();
        registration.ContactId = con.Id;
        registration.EventId = evt.Id;
        registration.AttendeeType = eventRegistration.Attendee_Type__c;
        registration.ContactType = 'Guest';
        registration.EmailAddress = con.Email;
        registration.FirstName = con.FirstName;
        registration.LastName = con.LastName;
        registration.ShirtSize = eventRegistration.T_Shirt_Size__c;
        registration.Guests = guests;
        registration.Questions = registrantQs;
        
        RestContext.request.requestBody = Blob.valueof(JSON.serialize(registration));
        
        mm_RegisterForEvent.Register();
        
        System.assert(RestContext.response.responseBody != null);
        
        Test.stopTest();
    }
}