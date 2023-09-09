class Post {
  int _userId;
  int _id;
  String _name;
  String _email;
  String _body;

  Post(this._userId, this._id, this._name, this._email, this._body);

  int get userId => _userId;
  set userId(int value) {
    _userId = value;
  }

  int get id => _id;
  set id(int value) {
    _id = value;
  }

  String get body => _body;
  set body(String value) {
    _body = value;
  }

  String get name => _name;
  set name(String value) {
    _name = value;
  }
  String get email => _email;
  set email(String value) {
    _email = value;
  }
}
