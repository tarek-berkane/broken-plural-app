class WordModel {
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

  int id;
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

  @override
  String toString() {
    return '''
    id            ${id ?? "not defined"}
    vocalized :   $vocalized
    unvocalized : $unvocalized
    root :        $root
    ''';
  }

  // constructure
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

  WordModel.fromList(List data) {
    vocalized = data[1];
    unvocalized = data[2];
    wordtype = data[3];
    root = data[4];
    wazn = data[5];
    category = data[6];
    gender = data[7];
    feminin = data[8];
    masculin = data[9];
    brokenPlural = data[10];
    feminable = data[11];
    masculinPlural = data[12];
    femininPlural = data[13];
    mamnou3Sarf = data[14];
    relative = data[15];
    pluralTanwinNasb = data[16];
  }
}
