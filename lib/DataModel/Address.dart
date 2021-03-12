class Address{
  String houseNo;
  String flatNo;
  String area;
  String road;
  String city;
  String pinCode;

  Address({this.houseNo, this.flatNo, this.area, this.road, this.city,
      this.pinCode});

  Map<String,dynamic> toMap(){
    return {
      'houseNo' :houseNo,
      'flatNo' : flatNo,
      'area' : area,
      'road':road,
      'city':city,
      'pinCode':pinCode
    };
  }

  Address.fromFirestore(Map<String,dynamic> fireStore):
      houseNo=fireStore['houseNo'],
      flatNo=fireStore['flatNo'],
      area=fireStore['area'],
      road=fireStore['road'],
      city=fireStore['city'],
      pinCode=fireStore['pinCode'];

}