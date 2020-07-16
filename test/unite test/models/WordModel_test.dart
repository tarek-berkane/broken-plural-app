import 'package:test/test.dart';
import 'package:broken_plural_ar/core/models/WordModel.dart';

void main() {
  Map _data = {
    'vocalized': "آفِلٌ",
    'unvocalized': "آفل",
    'wordtype': "فاعل:",
    'root': "أفل",
    'wazn': "فاعل",
    'category': "مذكر",
    'gender': "",
    'feminin': "",
    'masculin': "",
    'brokenPlural': "أُفَّلٌ;أُفُولُ",
    'feminable': 1,
    'masculinPlural': 1,
    'femininPlural': 1,
    'mamnou3Sarf': 0,
    'relative': 0,
    'pluralTanwinNasb': "",
  };

  setUp(() {});

  test("check property types of model", () {
    WordModel wordModel = WordModel.fromDict(_data);

    // check type
    expect(wordModel.vocalized, isA<String>());
    expect(wordModel.unvocalized, isA<String>());
    expect(wordModel.wordtype, isA<String>());
    expect(wordModel.root, isA<String>());
    expect(wordModel.wazn, isA<String>());
    expect(wordModel.category, isA<String>());
    expect(wordModel.gender, isA<String>());
    expect(wordModel.feminin, isA<String>());
    expect(wordModel.masculin, isA<String>());
    expect(wordModel.brokenPlural, isA<String>());
    expect(wordModel.pluralTanwinNasb, isA<String>());

    expect(wordModel.feminable, isA<int>());
    expect(wordModel.masculinPlural, isA<int>());
    expect(wordModel.femininPlural, isA<int>());
    expect(wordModel.mamnou3Sarf, isA<int>());
    expect(wordModel.relative, isA<int>());
  });
  test('instantiate model from Map using WordModel.fromDict', () {
    // instantiate the model using map
    WordModel wordModel = WordModel.fromDict(_data);

    // check type
    expect(wordModel.vocalized, equals('آفِلٌ'));
    expect(wordModel.unvocalized, equals('آفل'));
    expect(wordModel.wordtype, equals('فاعل:'));
    expect(wordModel.root, equals('أفل'));
    expect(wordModel.wazn, equals('فاعل'));
    expect(wordModel.category, equals('مذكر'));
    expect(wordModel.gender, equals(''));
    expect(wordModel.feminin, equals(''));
    expect(wordModel.masculin, equals(''));
    expect(wordModel.brokenPlural, equals('أُفَّلٌ;أُفُولُ'));
    expect(wordModel.pluralTanwinNasb, equals(''));

    expect(wordModel.feminable, equals(1));
    expect(wordModel.masculinPlural, equals(1));
    expect(wordModel.femininPlural, equals(1));
    expect(wordModel.mamnou3Sarf, equals(0));
    expect(wordModel.relative, equals(0));
  });

  test('check to if Map returned from WordModel.toDict is the same to _data',
      () {
    WordModel wordModel = WordModel.fromDict(_data);
    expect(wordModel.toDict(), equals(_data));
  });
}
