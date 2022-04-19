class Source
{
  final String ?id;
  final String ?name;

  //constructor 
  Source({this.id,this.name});

  //method to convert Json data into object
  factory Source.fromJson(Map<String,dynamic>json)
  {
    return Source
    (
      id: json['id'],
      name: json['name'],
    );
  }
}