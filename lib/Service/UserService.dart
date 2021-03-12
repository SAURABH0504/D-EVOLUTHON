import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freelancekisan_user/Model/Profile/FarmerProfile.dart';
import 'package:freelancekisan_user/Model/Profile/NonFarmerProfile.dart';

class UserService{
   FirebaseFirestore _db= FirebaseFirestore.instance;

   Future<void> saveFarmerDetails(FarmerProfile profile)async{
        await _db.collection('Users').doc(profile.userId).collection('Details').doc(profile.userId).set(profile.toMap(profile));
   }
   Future<void> saveNonFarmerDetails(NonFarmerProfile profile)async{
     await _db.collection('Users').doc(profile.userId).collection('Details').doc(profile.userId).set(profile.toMap(profile));
   }
   Future<dynamic> getDetails(String userId)async{
     var snapshot = await _db.collection('Users').doc(userId).collection('Details').doc(userId).get();
     if(snapshot.data()['profession']=='farmer')
       {
         FarmerProfile profile=FarmerProfile().fromFireStore(snapshot.data());
         return profile;
       }
     else
       {
         NonFarmerProfile profile=NonFarmerProfile().fromFireStore(snapshot.data());
         return profile;
       }
   }
   Future<bool> checkProfile(String userId)async{
     var snapshot = await _db.collection('Users').doc(userId).collection('Details').doc(userId).get();
     if(snapshot.data()['profileCompleted']==true)
     {
       return true;
     }
     else
     {
       return false;
     }
   }
}