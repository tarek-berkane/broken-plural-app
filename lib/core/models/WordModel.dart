class WordModel {
  WordModel.fromDict(Map data) {
    vocalized = data['vocalized'];
    unvocalized = data['unvocalized'];
    wordtype = data['wordtype'];
    root = data['root'];
    wazn = data['wazn'];
    category = data['category'];
    gender = data['gender'];
    feminin = data['feminin'];
    masculin = data['masculin'];
    brokenPlural = data['brokenPlural'];

    feminable = data['feminable'];
    masculinPlural = data['masculinPlural'];
    femininPlural = data['femininPlural'];
    mamnou3Sarf = data['mamnou3Sarf'];
    relative = data['relative'];
    pluralTanwinNasb = data['pluralTanwinNasb'];
  }

  String vocalized;
  String unvocalized;
  String wordtype;
  String root;
  String wazn;
  String category;
  String gender;
  String feminin;
  String masculin;
  String brokenPlural;

  int feminable;
  int masculinPlural;
  int femininPlural;
  int mamnou3Sarf;
  int relative;

  String pluralTanwinNasb;

  Map toDict() {
    Map data = {};

    data['vocalized'] = vocalized;
    data['unvocalized'] = unvocalized;
    data['wordtype'] = wordtype;
    data['root'] = root;
    data['wazn'] = wazn;
    data['category'] = category;
    data['gender'] = gender;
    data['feminin'] = feminin;
    data['masculin'] = masculin;
    data['brokenPlural'] = brokenPlural;
    data['feminable'] = feminable;
    data['masculinPlural'] = masculinPlural;
    data['femininPlural'] = femininPlural;
    data['mamnou3Sarf'] = mamnou3Sarf;
    data['relative'] = relative;
    data['pluralTanwinNasb'] = pluralTanwinNasb;

    return data;
  }
}
