import 'package:freelancekisan_user/DataModel/Address.dart';
import 'package:freelancekisan_user/Model/Profile/UserDetails.dart';

class Worker extends UserDetails{
  List<Work> work;
  String rating;
  UserAddress address;

}

class Work{
  String workName;
}