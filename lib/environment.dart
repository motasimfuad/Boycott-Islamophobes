import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String messagingSenderId = dotenv.get('MESSAGING_SENDER_ID');
  static String projectId = dotenv.get('PROJECT_ID');
  static String authDomain = dotenv.get('AUTH_DOMAIN');
  static String storageBucket = dotenv.get('STORAGE_BUCKET');

  static String webApiKey = dotenv.get('WEB_API_KEY');
  static String webAppId = dotenv.get('WEB_APP_ID');

  static String androidApiKey = dotenv.get('ANDROID_API_KEY');
  static String androidAppId = dotenv.get('ANDROID_APP_ID');
}
