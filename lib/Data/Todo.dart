class todo
{
  static const String collectionName= 'Tasks';
  String id;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;
  todo ({required this.title, required this.dateTime,required this.description,  this.isDone=false,required this. id});

  todo.fromJson(Map<String, Object?> json)
      : this(
    id : json['id']! as String ,
    title: json['title']! as String,
      description: json ['description'] ! as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(json ['dateTime']  as int),
      isDone: json ['isDone'] as bool);

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'isDone': isDone
    };
  }}