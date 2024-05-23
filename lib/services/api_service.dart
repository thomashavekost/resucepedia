import 'package:appwrite/appwrite.dart';

Client client = Client();
class APIService {

  void init(){
    client.setEndpoint('https://cloud.appwrite.io/v1').setProject('6646f91c003949be2103').setSelfSigned(status: true);
  }
}