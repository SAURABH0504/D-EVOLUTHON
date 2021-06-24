import 'package:freelancekisan_user/DataModel/Address.dart';
import 'package:freelancekisan_user/Model/Profile/UserDetails.dart';

class Worker extends UserDetails{
  List<Work> work;
  String rating;
  UserAddress address;
  String region;
  List<Review> reviews;

  Worker({this.work, this.rating, this.address, this.reviews,this.region});

  Map<String,dynamic> toMap(Worker profile){
    return {
      'lastName' : profile.lastName,
      'userId' : profile.userId,
      'userEmail' : profile.userEmail,
      'firstName' :profile.firstName,
      'dob': profile.dob,
      'profession':profile.profession,
      'contactNumber':profile.contactNumber,
      'work':Work.ConvertCustomStepsToMap(work),
      'rating':rating,
      'region':region,
      'address':address.toMap(),
      'reviews':Review.ConvertCustomStepsToMap(reviews)
    };
  }
  Worker fromFirestore(Map<String,dynamic> fireStore) {
    Worker profile=Worker();
    profile.region=fireStore['region'];
    profile.lastName=fireStore['lastName'];
    profile.firstName=fireStore['firstName'];
    profile.userEmail=fireStore['userEmail'];
    profile.userId=fireStore['userId'];
    profile.dob=fireStore['dob'];
    profile.profession=fireStore['profession'];
    profile.contactNumber=fireStore['contactNumber'];
    profile.work = (fireStore['work'] as List).map((e) =>
        Work.fromFirestore(e.cast<String, dynamic>())).toList();
    profile.rating=fireStore['rating'];
    profile.address=UserAddress.fromFirestore(fireStore['address']);
    profile.reviews=(fireStore['reviews'] as List).map((e) => Review.fromFirestore(e.cast<String,dynamic>())).toList();
    return profile;
  }
}

class Work {
  String workName;
  String experience;

  Work({this.workName, this.experience});

  Map<String,dynamic> toMap(){
    return {
      'workName':workName,
      'experience':experience
    };
  }

  Work.fromFirestore(Map<String,dynamic> firestore):
        workName=firestore['workName'],
        experience=firestore['experience'];

  static List<Map> ConvertCustomStepsToMap(List<Work> customSteps) {
    List<Map> steps = [];
    customSteps.forEach((Work customStep) {
      Map step = customStep.toMap();
      steps.add(step);
    });
    return steps;
  }
}

class Review{
  String review;
  String rating;

  Review({this.review, this.rating});

  Map<String,dynamic> toMap(){
    return {
      'review':review,
      'rating':rating
    };
  }

  Review.fromFirestore(Map<String,dynamic> firestore):
        review=firestore['review'],
        rating=firestore['rating'];

  static List<Map> ConvertCustomStepsToMap(List<Review> customSteps) {
    List<Map> steps = [];
    customSteps.forEach((Review customStep) {
      Map step = customStep.toMap();
      steps.add(step);
    });
    return steps;
  }
}