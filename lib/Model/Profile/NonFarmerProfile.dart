import 'file:///D:/Flutter%20Project/freelancekisan_user/lib/Model/Profile/UserDetails.dart';
import 'package:freelancekisan_user/DataModel/Address.dart';

class NonFarmerProfile extends UserDetails {
     Address address;
     String occupation;

     NonFarmerProfile({this.address, this.occupation});

     Map<String, dynamic> toMap(NonFarmerProfile profile) {
          return {
               'lastName': profile.lastName,
               'userId': profile.userId,
               'userEmail': profile.userEmail,
               'firstName': profile.firstName,
               'dob': profile.dob,
               'profession': profile.profession,
               'contactNumber': profile.contactNumber,
               'address': address.toMap(),
               'profileCompleted' : true,
               'occupation': occupation
          };
     }

     NonFarmerProfile fromFireStore(Map<String,dynamic> fireStore){
          NonFarmerProfile profile;
          profile.lastName=fireStore['lastName'];
          profile.firstName=fireStore['firstName'];
          profile.userEmail=fireStore['userEmail'];
          profile.userId=fireStore['userId'];
          profile.dob=fireStore['dob'];
          profile.profession=fireStore['profession'];
          profile.contactNumber=fireStore['contactNumber'];
          profile.profileCompleted=fireStore['profileCompleted'];
          profile.address=Address.fromFirestore(fireStore['address']);
          profile.occupation=fireStore['occupation'];
          return profile;
     }
}