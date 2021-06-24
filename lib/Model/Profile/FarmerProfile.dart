import 'package:freelancekisan_user/Model/Profile/UserDetails.dart';

class FarmerProfile extends UserDetails {

     String farmType;
     String cultivatedLand;
     FarmerProfile({ this.farmType, this.cultivatedLand});

     Map<String,dynamic> toMap(FarmerProfile profile){
         return{
              'lastName' : profile.lastName,
              'userId' : profile.userId,
              'userEmail' : profile.userEmail,
              'firstName' :profile.firstName,
              'dob': profile.dob,
              'profession':profile.profession,
              'contactNumber':profile.contactNumber,
              'farmType' : farmType,
              'cultivatedLand' : cultivatedLand,
              'profileCompleted' : true,
           };
     }
     FarmerProfile fromFireStore(Map<String,dynamic> fireStore){
          FarmerProfile profile;
          profile.lastName=fireStore['lastName'];
          profile.firstName=fireStore['firstName'];
          profile.userEmail=fireStore['userEmail'];
          profile.userId=fireStore['userId'];
          profile.dob=fireStore['dob'];
          profile.profession=fireStore['profession'];
          profile.contactNumber=fireStore['contactNumber'];
          profile.farmType=fireStore['farmType'];
          profile.cultivatedLand=fireStore['cultivatedLand'];
          profile.profileCompleted=fireStore['profileCompleted'];
          return profile;
     }
}

