class seat {
  String id;
  bool status;

  seat(this.id, this.status);

  bool getStatus() {
    return status;
  }
  bool setStatus(bool value){
    this.status = value;
  }

  String getId(){
    return id;
  }
}
