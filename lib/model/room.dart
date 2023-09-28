import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

var _serverHost = Platform.environment['SERVER_HOST'] ?? 'localhost:4000';

class RoomLocation {
  String? id;
  int roomNumber;

  RoomLocation({this.id, required this.roomNumber});

  RoomLocation.import(Map<String, dynamic> data)
      : id = data['id'] as String,
        roomNumber = data['roomNumber'] as int;

  Map<String, dynamic> get export => {
        'id': id,
        'roomNumber': roomNumber,
      };
}

class Room {
  String? id;
  RoomLocation location;
  bool isOccupied;

  Room({this.id, required this.location, this.isOccupied = false});

  Room.import(Map<String, dynamic> data)
      : id = data['id'] as String,
        location = RoomLocation.import(data['location']),
        isOccupied = data['isOccupied'] as int != 0;

  Map<String, dynamic> get export => {
        'id': id,
        'location': location.export,
        'isOccupied': isOccupied ? 1 : 0,
      };
}

Future<List<Room>?> getRooms() async {
  final url = Uri.http(_serverHost, '/room/getall');
  var response = await http.get(url);
  if (response.statusCode != 200) {
    return null;
  }
  var responseObj = jsonDecode(response.body) as Map<String, dynamic>;
  var result = <Room>[];

  for (final room in responseObj['rooms'] as List) {
    result.add(Room.import(room));
  }
  return result;
}

Future<Room?> saveRoom(Room room) async {
  final url = Uri.http(_serverHost, '/room/create');
  var response = await http.post(url, body: jsonEncode(room.location.export));
  if (response.statusCode != 201) {
    return null;
  }
  return Room.import(jsonDecode(response.body));
}

Future<bool> alert() async {
  final url = Uri.http(_serverHost, '/alert');
  var response = await http.post(url);
  return response.statusCode == 200;
}

Future<bool> disocupy(Room room) async {
  final url = Uri.http(_serverHost, '/room/disoccupy');
  var response = await http.post(url, body: '{ "id": "${room.id!}" }');
  return response.statusCode != 404;
}
