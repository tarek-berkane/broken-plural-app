class WordModels {
  WordModels.fromDict(Map data) {
    vocalized = data['vocalized'];
    unvocalized = data['unvocalized'];
    wordtype = data['wordtype'];
    root = data['root'];
    wazn = data['wazn'];
    category = data['category'];
    gender = data['gender'];
    feminin = data['feminin'];
    masculin = data['masculin'];
    broken_plural = data['broken_plural'];

    feminable = data['feminable'];
    masculin_plural = data['masculin_plural'];
    feminin_plural = data['feminin_plural'];
    mamnou3_sarf = data['mamnou3_sarf'];
    relative = data['relative'];
    plural_tanwin_nasb = data['plural_tanwin_nasb'];
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
  String broken_plural;

  int feminable;
  int masculin_plural;
  int feminin_plural;
  int mamnou3_sarf;
  int relative;

  String plural_tanwin_nasb;

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
    data['broken_plural'] = broken_plural;
    data['feminable'] = feminable;
    data['masculin_plural'] = masculin_plural;
    data['feminin_plural'] = feminin_plural;
    data['mamnou3_sarf'] = mamnou3_sarf;
    data['relative'] = relative;
    data['plural_tanwin_nasb'] = plural_tanwin_nasb;

    return data;
  }
}
