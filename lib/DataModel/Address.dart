class UserAddress{
  String houseNo;
  String area;
  String complete;
  String city;
  String pinCode;
  String latitude;
  String longitude;
  UserAddress({this.houseNo,this.area, this.complete, this.city,
      this.pinCode,this.latitude,this.longitude});

  Map<String,dynamic> toMap(){
    return {
      'houseNo' :houseNo,
      'area' : area,
      'complete':complete,
      'city':city,
      'pinCode':pinCode,
      'latitude' : latitude,
      'longitude' : longitude
    };
  }

  UserAddress.fromFirestore(Map<String,dynamic> fireStore):
      houseNo=fireStore['houseNo'],
      area=fireStore['area'],
      complete=fireStore['complete'],
      city=fireStore['city'],
      pinCode=fireStore['pinCode'],
      latitude=fireStore['latitude'],
      longitude=fireStore['longitude'];
}