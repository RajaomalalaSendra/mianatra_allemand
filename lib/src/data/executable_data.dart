List executable = [
              """CREATE TABLE IF NOT EXISTS grammar (
                    id_gram INTEGER PRIMARY KEY AUTOINCREMENT,
                    title_gram TEXT DEFAULT 'Title Grammar',
                    subtitle_gram TEXT DEFAULT 'Subtitle Grammar',
                    photo_gram TEXT,
                    num_sub_menu INTEGER
                );""",
              """CREATE TABLE IF NOT EXISTS exercise (
                  id_exo INTEGER PRIMARY KEY AUTOINCREMENT,
                  right_answer TEXT,
                  question_exo TEXT,
                  id_gram INTEGER
              );""",
              """CREATE TABLE IF NOT EXISTS vocabulary (
                    id_voc INTEGER PRIMARY KEY AUTOINCREMENT,
                    word_de TEXT DEFAULT 'Deutch',
                    word_mg TEXT DEFAULT 'Malagasy',
                    expl_de TEXT,
                    expl_mg TEXT,
                    id_type INTEGER
                );
              """,
              """CREATE TABLE IF NOT EXISTS conjugaison (
                id_verb INTEGER PRIMARY KEY AUTOINCREMENT,
                verb TEXT,
                present_ind TEXT,
                participe TEXT,
                past_ind TEXT,
                future_ind TEXT,
                id_group_verb INTEGER
              );
              """,
              """CREATE TABLE IF NOT EXISTS group_verb (
                id_group_verb INTEGER PRIMARY KEY AUTOINCREMENT,
                group_verb TEXT,
                group_expl TEXT
              );""",
              """CREATE TABLE IF NOT EXISTS type (
                id_type INTEGER PRIMARY KEY AUTOINCREMENT,
                type_mg_short TEXT,
                type_de_short TEXT,
                type_mg_long TEXT,
                type_de_long TEXT
              );""",
              """CREATE TABLE IF NOT EXISTS dialogue (
                id_dial INTEGER PRIMARY KEY AUTOINCREMENT,
                photo_dial TEXT,
                text_dial_de TEXT DEFAULT 'Keine text for the dialogue',
                text_dial_mg TEXT DEFAULT 'Tsisy text hoan ny dialogue',
                title_dial TEXT DEFAULT 'No title for the dialogue',
                expl_dial TEXT DEFAULT 'No explanation for the dialogue for now',
                audio_dial TEXT,
                video_dial TEXT
              );"""
            ];

var dataConjugaisons = [
  {"verb": "essen", "present_ind": "Ich esse", "participe": "gessen", "past_ind": "Ich esse", "future_ind": "Ich esse", "id_group_verb": 1},
  {"verb": "essen", "present_ind": "Ich esse", "participe": "gessen", "past_ind": "Ich esse", "future_ind": "Ich esse", "id_group_verb": 1},
  {"verb": "essen", "present_ind": "Ich esse", "participe": "gessen", "past_ind": "Ich esse", "future_ind": "Ich esse", "id_group_verb": 2},
  {"verb": "essen", "present_ind": "Ich esse", "participe": "gessen", "past_ind": "Ich esse", "future_ind": "Ich esse", "id_group_verb": 2}
];

var dataGroupVerbs = [
  {"group_verb":"Group of verb This", "group_expl":"This is the verb explanation fro now and then"},
  {"group_verb":"Group of verb This", "group_expl":"This is the verb explanation fro now and then"},
  {"group_verb":"Group of verb This", "group_expl":"This is the verb explanation fro now and then"},
  {"group_verb":"Group of verb This", "group_expl":"This is the verb explanation fro now and then"},
  {"group_verb":"Group of verb This", "group_expl":"This is the verb explanation fro now and then"}
];

var listGrammars = [
    { "imageUrl": "assets/images/n.png", "subtitle": "Subtitle for Nominatif", "title": "Nominatif", "numSubMenu": 2},
    {"imageUrl": "assets/images/a.png", "subtitle": "Subtitle for Accusatif", "title": "Accusatif", "numSubMenu": 2},
    {"imageUrl": "assets/images/d.png", "subtitle": "Subtitle for Datif", "title": "Datif", "numSubMenu": 2},
    {"imageUrl": "assets/images/g.png", "subtitle": "Subtitle for Genetif", "title": "Genetif", "numSubMenu": 2}
];

var contentDialogues = [
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},

  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},

  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'},
  {'photo_dial': 'assets/icon/icon.png', 'text_dial_de': 'Was machen sie hier fur heute', 'text_dial_mg': 'dialogue amin\'ny fiteny malagasy.', 'title_dial': 'dialogue 1', 'expl_dial': 'Das is die cultural fur die deutchland', 'audio_dial': 'audio for the apps', 'video_dial': 'no video for the dial 1'}
];


var listVocabularies = [
  {"de":"essen", "mg":"mihinana", "exp_de":"essen ist mihinana", "exp_mg":"mihinana dia essen\nohatra hoe: ich esse. Mihinana aho.", "typ":1},
  {"de":"essen", "mg":"mihinana", "exp_de":"essen ist mihinana", "exp_mg":"mihinana dia essen", "typ":1},
  {"de":"essen", "mg":"mihinana", "exp_de":"essen ist mihinana", "exp_mg":"mihinana dia essen", "typ":1},
  {"de":"essen", "mg":"mihinana", "exp_de":"essen ist mihinana", "exp_mg":"mihinana dia essen", "typ":1},
  {"de":"essen", "mg":"mihinana", "exp_de":"essen ist mihinana", "exp_mg":"mihinana dia essen", "typ":1},
  {"de":"essen", "mg":"mihinana", "exp_de":"essen ist mihinana", "exp_mg":"mihinana dia essen\nohatra hoe: ich esse. Mihinana aho.", "typ":1},
  {"de":"essen", "mg":"mihinana", "exp_de":"essen ist mihinana", "exp_mg":"mihinana dia essen", "typ":1}
];