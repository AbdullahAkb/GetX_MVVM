import 'package:get/get_navigation/get_navigation.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Enter Email',
          'retry': 'Retry',
          'internet_exception': "We're unable to show result\n Please check your Data \n Connection",
          'general_exception': "We're unable to process your request\n Please try again",
        },
        'ur_PK': {
          'email_hint': 'ای میل درج کریں۔',
          'retry': 'دوبارہ کوشش کریں۔',
          'internet_exception':"ہم نتیجہ دکھانے سے قاصر ہیں۔ براہ کرم اپنا ڈیٹا کنکشن چیک کریں۔",
          'general_exception':"ہم آپ کی درخواست پر کارروائی کرنے سے قاصر ہیں۔ براہ کرم دوبارہ کوشش کریں۔"
        },
      };
}
