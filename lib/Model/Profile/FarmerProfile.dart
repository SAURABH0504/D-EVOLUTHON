import 'package:freelancekisan_user/DataModel/Address.dart';
import 'package:freelancekisan_user/Model/Profile/UserDetails.dart';

class FarmerProfile extends UserDetails {

     UserAddress address;
     String farmType;
     String cultivatedLand;
     List<Crop> crops;
     FarmerProfile({this.address, this.farmType, this.cultivatedLand, this.crops});

     Map<String,dynamic> toMap(FarmerProfile profile){
         return{
              'lastName' : profile.lastName,
              'userId' : profile.userId,
              'userEmail' : profile.userEmail,
              'firstName' :profile.firstName,
              'dob': profile.dob,
              'profession':profile.profession,
              'contactNumber':profile.contactNumber,
              'address': address.toMap(),
              'farmType' : farmType,
              'cultivatedLand' : cultivatedLand,
              'crops' : Crop.ConvertCustomStepsToMap(crops),
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
          profile.address=UserAddress.fromFirestore(fireStore['address']);
          profile.farmType=fireStore['farmType'];
          profile.cultivatedLand=fireStore['cultivatedLand'];
          profile.profileCompleted=fireStore['profileCompleted'];
          profile.crops=(fireStore['crops'] as List).map((e) => Crop.fromFirestore(e.cast<String,dynamic>())).toList();
          return profile;
     }
}


class Crop {
     String cropName;
     Crop({this.cropName});

     Map<String, dynamic> toMap() {
          return {
               'cropName': cropName
          };
     }

     Crop.fromFirestore(Map<String, dynamic> firestore)
         : cropName=firestore['cropName'];

     static List<Map> ConvertCustomStepsToMap(List<Crop> customSteps) {
          List<Map> steps = [];
          customSteps.forEach((Crop customStep) {
               Map step = customStep.toMap();
               steps.add(step);
          });
          return steps;
     }
}
