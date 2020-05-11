

class Contact{

  String name;
  String date;
  String place;

  Contact({this.name, this.date, this.place})
          :assert(name != null, date != null);
}