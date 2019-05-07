class Place {
  String _image;
  String _name;
  String _price;
  String _detail;
  String _location;

  Place(this._image, this._name, this._price, this._detail, this._location);

  String getDetail() => _detail;

  String getPrice() => _price;

  String getName() => _name;

  String getImage() => _image;

  String getLocation() => _location;
}