import 'UserDetails.dart';
import 'package:freelancekisan_user/DataModel/Address.dart';

class FarmerProfile extends UserDetails{
     Address address;
     String farmType;
     String cultivatedLand;
     List<String> crops;

     FarmerProfile({this.address, this.farmType, this.cultivatedLand, this.crops});


}
