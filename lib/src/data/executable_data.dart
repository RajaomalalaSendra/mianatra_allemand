List executable = [
              """CREATE TABLE IF NOT EXISTS grammar (
                    id_gram INTEGER PRIMARY KEY AUTOINCREMENT,
                    title_gram TEXT DEFAULT 'Title Grammar',
                    subtitle_gram TEXT DEFAULT 'Subtitle Grammar',
                    photo_gram TEXT,
                    num_sub_menu INTEGER
                );""",
              """CREATE TABLE IF NOT EXISTS exercise(
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
                future_ind TEXT
              );
              """,
              """CREATE TABLE IF NOT EXISTS group(
                id_group INTEGER PRIMARY KEY AUTOINCREMENT,
                group_verb TEXT,
                group_expl TEXT
              );""",
              """CREATE TABLE IF NOT EXISTS type(
                id_type INTEGER PRIMARY KEY AUTOINCREMENT,
                type_mg_short TEXT,
                type_de_short TEXT,
                type_mg_long TEXT,
                type_de_long TEXT
              );""",
              """CREATE TABLE IF NOT EXISTS dialogue(
                id_dial INTEGER PRIMARY KEY AUTOINCREMENT,
                photo_dial TEXT,
                text_dial TEXT DEFAULT "No text for the dialogue",
                title_dial TEXT DEFAULT "No title for the dialogue",
                expl_dial TEXT DEFAULT "No explanation for the dialogue for now",
                audio_dial TEXT,
                video_dial TEXT
              );"""
            ];