import 'package:get/get.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../res/app_url/app_url.dart';
import '../viewModel/controllers/user_preference/user_preference_view_model.dart';


class SocketService {
  late IO.Socket _socket;
  // List to store received messages
  final _messageList = <Map<String, dynamic>>[].obs;
  final _friendList = <Map<String, dynamic>>[].obs;
  final  _onlineUserList = <dynamic>[].obs;

  List<Map<String, dynamic>> get messageList => _messageList;
  List<Map<String, dynamic>> get friendList => _friendList;
  List<dynamic> get onlineUserList => _onlineUserList;


  IO.Socket get socket => _socket;

  Future<SocketService> init() async {
    UserPreference userPreference = UserPreference();
    String token = await userPreference.getUser();
    String userId = await userPreference.getId();

    _socket = IO.io("${AppUrl.socketUrl}", <String, dynamic>{ //http://192.168.10.152:5001

      'transports': ['websocket'],
      'autoConnect': true, // Auto connect to the server
      'extraHeaders': {
        'token': token
      },
    });

    _socket.on('connect', (data) {
      print('Connected to the server');
      print('My user ID : : $userId');

      _socket.emit("connection",userId);
    });

    _socket.onConnect((_) {
      print('Connected to socket server');
    });

    _socket.on('onlineUser', (data) {
      onlineUserList.clear();
      for (var element in data) {
        if (element is String) {
          onlineUserList.add(element);
        }
      }
      print("last user active on server: : ${onlineUserList.length}");
      print("last user : ${onlineUserList}");
     // _handleIncomingFriends(data);
    });


    _socket.onDisconnect((_) {
      print('Disconnected from socket server');
    });

    // Return the SocketService instance
    return this;
  }

  void disconnect() {
    _socket.disconnect();
  }


  void _handleIncomingFriends(dynamic data) {
    if (data is Map<String, dynamic> && data.containsKey('receiver')) {
      _friendList.add(data);
      print('Friend received and added to list: ${_friendList.length}');
    }
  }
}
