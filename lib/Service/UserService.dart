import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freelancekisan_user/Model/Profile/FarmerProfile.dart';
import 'package:freelancekisan_user/Model/Profile/NonFarmerProfile.dart';
import 'package:freelancekisan_user/Model/Profile/Worker.dart';

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

   Future<Worker> getWorkerDetails(String id)async{
     var snapshot = await _db.collection('Worker').doc(id).collection('Details').doc(id).get();
     Worker profile=Worker();
     profile = await profile.fromFirestore(snapshot.data());
     return profile;
   }

   Future<List<Worker>> getWorker(int latitude,int longitude,String category)async{
     var snapshot=await _db.collection('Worker List').get();
     List<Worker> workers;
     return workers;
   }
}