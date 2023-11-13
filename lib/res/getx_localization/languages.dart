import 'package:get/get_navigation/get_navigation.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Email',
          'password_hint': 'Password',
          'welcome': 'Welcome\nback',
          'retry': 'Retry',
          'login': 'Login',
          'internet_exception':
              "We're unable to show result\n Please check your Data \n Connection",
          'general_exception':
              "We're unable to process your request\n Please try again",
        },
        'ur_PK': {
          'email_hint': 'ای میل',
          'password_hint': 'پاس ورڈ',
          'welcome': 'خوش آمدید',
          'login': 'لاگ ان',
          'retry': 'دوبارہ کوشش کریں۔',
          'internet_exception':
              "ہم نتیجہ دکھانے سے قاصر ہیں۔ براہ کرم اپنا ڈیٹا کنکشن چیک کریں۔",
          'general_exception':
              "ہم آپ کی درخواست پر کارروائی کرنے سے قاصر ہیں۔ براہ کرم دوبارہ کوشش کریں۔"
        },
      };
}
