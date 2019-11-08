var columnsTitle = ["Masculin", "Feminin", "Neutre", "Pluriel"];
var titlesCases = ["Nominatif", "Accusatif", "Datif", "Genetif"];

var contentLists = [
  {
  "definit": ["der", "die", "das", "die"],
  "indefinit": ["ein", "eine", "ein", "-"],
  "negation": ["kein", "keine", "kein", "keine"]
}, {
  "definit": ["den", "die", "das", "die"],
  "indefinit": ["einen", "eine", "ein", "-"],
  "negation": ["keinen", "keine", "kein", "keine"]
},{
  "definit": ["den", "die", "das", "die"],
  "indefinit": ["einen", "eine", "ein", "-"],
  "negation": ["keinen", "keine", "kein", "keine"]
},{
  "definit": ["den", "die", "das", "die"],
  "indefinit": ["einen", "eine", "ein", "-"],
  "negation": ["keinen", "keine", "kein", "keine"]
}  
];

var examplesByCases = {
  "Deutch": {
    "Nominatif": {
      "one": [
        "a) Ich bin die Bruder von Ndria.",
        "b) Meine Mutter ist hier.",
        "d) Dein Frau ist here.",
        "e) Meine Schwester habe 3 Kulie"
      ],
      "two": [
        "a) Die kalter Tee kann man nicht triken.",
        "b) Das grosse Frau habe 5 Brudern",
        "d) Die neue Lehrerin ist da heute.",
        "e) Die Ei ist zehr gut."
      ]
    }, 
    "Accusatif": {
      "one": [
        "a) Ich habe keine Freunde.",
        "b) Ich bringe einen Slushell.",
        "d) Mein Vater isst ein Brot.",
        "e) Seine Mutter nimmt ein Zimmer"
      ], 
      "two": [
        "a) Maria trinke einen heissen Kaffee",
        "b) Ich habe einen neuen Fahrrad.",
        "d) Die Studenten brauchen einen shnellen Druker.",
        "e) Du isst einen Ei."
      ]
    },
    "Datif": {
        "one": [
          "a) Ich habe keine Freunde.",
          "b) Ich bringe einen Slushell.",
          "d) Mein Vater isst ein Brot.",
          "e) Seine Mutter nimmt ein Zimmer"
        ],
        "two": [
          "a) Maria trinke einen heissen Kaffee",
          "b) Ich habe einen neuen Fahrrad.",
          "d) Die Studenten brauchen einen shnellen Druker.",
          "e) Du isst einen Ei."
        ]
    },
    "Genetif": {
      "one": [
          "a) Ich habe keine Freunde.",
          "b) Ich bringe einen Slushell.",
          "d) Mein Vater isst ein Brot.",
          "e) Seine Mutter nimmt ein Zimmer"
      ],
      "two": [
          "a) Maria trinke einen heissen Kaffee",
          "b) Ich habe einen neuen Fahrrad.",
          "d) Die Studenten brauchen einen shnellen Druker.",
          "e) Du isst einen Ei."
      ]
    }
  },
  "Malagasy": {
      "Nominatif": {
        "one": [
          "Izaho no rahalahin'i Ndria.",
          "Eto ny reniko.",
          "Eto ny vadinao.",
          "Manana penina 3 ny anabaviko/rahavaviko."
        ],
        "two": [
          "Tsy afaka misotro dite mangatsiaka ny olona.",
          "Ny vehivavy lehibe dia manana anadahy 3.",
          "Eto ny mpampianatra vehivavy vaovao androany.",
          "Tsara be ny atody."
        ]
      },
      "Accusatif": {
        "one": [
          "Tsy  manana namana aho.",
          "Mitondra ny fanalahidy aho.",
          "Mihinana mofo ny dadako.",
          "Namandrika efitra iray ny reniny."
        ],
        "two": [
          "Misotro kafe mafana i Maria.",
          "Manana bisikileta vaovao aho.",
          "Maniry ny hahavita ny imprimante telo ny mpianatra.",
          "Mihinana atody ianao."
        ]
      },
      "Datif": {
        "one": [
          "Tsy  manana namana aho.",
          "Mitondra ny fanalahidy aho.",
          "Mihinana mofo ny dadako.",
          "Namandrika efitra iray ny reniny."
        ],
        "two": [
          "Misotro kafe mafana i Maria.",
          "Manana bisikileta vaovao aho.",
          "Maniry ny hahavita ny imprimante telo ny mpianatra.",
          "Mihinana atody ianao." 
        ]
      },
      "Genetif": {
        "one": [
          "Tsy  manana namana aho.",
          "Mitondra ny fanalahidy aho.",
          "Mihinana mofo ny dadako.",
          "Namandrika efitra iray ny reniny."
        ],
        "two": [
          "Misotro kafe mafana i Maria.",
          "Manana bisikileta vaovao aho.",
          "Maniry ny hahavita ny imprimante telo ny mpianatra.",
          "Mihinana atody ianao." 
        ]
      }
  }
};