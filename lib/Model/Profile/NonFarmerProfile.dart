
import 'package:freelancekisan_user/DataModel/Address.dart';

import 'UserDetails.dart';

class NonFarmerProfile extends UserDetails{
     Address address;
     String occupation;
     NonFarmerProfile({this.address, this.occupation});
}