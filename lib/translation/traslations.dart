import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'title': 'Hello World %s',
          'i_new_you': 'I Know you',
          'change_to_kh': 'Chnage Language to KHMER'
        },
        'kh': {
          'title': 'សួរស្តីជាភាសារខ្មែរ។',
          'i_new_you': 'ខ្មុំស្គាល់អ្នក',
          'change_to_kh': 'ផ្លាស់ប្តូរមូលដ្ឋានទៅជាភាសាអង់គ្លេស'
        },
      };
}
