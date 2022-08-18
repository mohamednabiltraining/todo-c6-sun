class Task{
  static const String collectionName = 'tasks';
  String? id;
  String? title;
  String? desc;
  DateTime? dateTime;
  bool? isDone;
  Task({
    this.id,
    this.title,
    this.desc,
    this.dateTime,
    this.isDone});

  Task.fromFirestore(Map<String,dynamic> data)
  :this(
    id: data['id'],
    title: data['title'],
    desc: data['desc'],
    isDone: data['isDone'],
      dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']));

  Map<String,dynamic> toFirestore(){
    return {
      'id':id,
      'title':title,
      'desc' :desc,
      'isDone':isDone,
      'dateTime' : dateTime?.millisecondsSinceEpoch
    };
  }
}