class Tournement {
  final String name;
  final String location;
  final String prize;
  final String datebegin;
  final String dateend;
  final int nbrMatch;

  Tournement({required this.name,required this.location, required this.prize,required this.datebegin,required this.dateend,required this.nbrMatch});


  static List<Tournement> tournements = [
    Tournement(
        name: "Coupe Madina",
        location: "Arena Madina",
        prize: "1200dt",
        datebegin: "20/04/2022",
        dateend: "24/04/2022",
        nbrMatch: 8
    ),
    Tournement(
        name: "Rades Challenger",
        location: "Sami Laaroussi complex",
        prize: "1800dt",
        datebegin: "22/04/2022",
        dateend: "27/04/2022",
        nbrMatch: 16
    ),Tournement(
        name: "Megrine cup",
        location: "Juventus Complex",
        prize: "1900dt",
        datebegin: "21/04/2022",
        dateend: "28/04/2022",
        nbrMatch: 32
    ),Tournement(
        name: "ben arous conference cup",
        location: "San Siro Complex",
        prize: "2000dt",
        datebegin: "21/04/2022",
        dateend: "28/04/2022",
        nbrMatch: 32
    )
  ];
}