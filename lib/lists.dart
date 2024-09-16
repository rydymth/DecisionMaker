import 'dart:core';

class lists {
  String? title;
  List? decisions = <String>[];
  int numDecisions = 0;
  String? PrevAns;
  
  lists (String title, List<String> dec)
  : title = title,
    decisions = dec,
    numDecisions = dec.length;
    
  lists.fromJson(Map<String, dynamic> json)
  : title = json["title"] as String,
    decisions = json["decisions"] as List<String>;
    
  Map<String, dynamic> toJson() => {
    'title': title,
    'decisions': decisions,
  };
}