class usermodel {
  String? id;
  String? name;
  String? phone;
  String? pass;
  String? choosetype;

  usermodel({this.id, this.name, this.phone, this.pass, this.choosetype});

  usermodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    pass = json['pass'];
    choosetype = json['choosetype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['pass'] = this.pass;
    data['choosetype'] = this.choosetype;
    return data;
  }
}
