class RefereeJob {
  final String? team1img;
  final String? team2img;
  final String? team1;
  final String? team2;
  final String? date;
  final String? location;

  RefereeJob({this.team1img,this.team2img,this.team1, this.team2, this.date, this.location});


  static List<RefereeJob> jobs = [
    RefereeJob(
      team1img: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg/800px-FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg.png",
      team2img: "https://images8.alphacoders.com/601/thumb-1920-601296.jpg",
      team1: "bayern",
      team2: "Villarreal",
      date: "25/03/2021",
      location: "Aliens arena"
    ),
    RefereeJob(
        team1img: "https://upload.wikimedia.org/wikipedia/fr/thumb/a/a2/SL_Benfica_logo.svg/1200px-SL_Benfica_logo.svg.png",
        team2img: "https://static.posters.cz/image/750/affiches-et-posters/liverpool-fc-crest-i85392.jpg",
        team1: "Benfica",
        team2: "Liverpool",
        date: "10/02/2022",
        location: "Anfield"
    ),RefereeJob(
        team1img: "https://upload.wikimedia.org/wikipedia/fr/thumb/a/a1/Logo_FC_Barcelona.svg/640px-Logo_FC_Barcelona.svg.png",
        team2img: "https://upload.wikimedia.org/wikipedia/fr/thumb/c/c7/Logo_Real_Madrid.svg/1200px-Logo_Real_Madrid.svg.png",
        team1: "Barcelona",
        team2: "Real Madrid",
        date: "02/03/2022",
        location: "Bernabio"
    ),
    RefereeJob(
        team1img: "https://upload.wikimedia.org/wikipedia/fr/thumb/a/a1/Logo_FC_Barcelona.svg/640px-Logo_FC_Barcelona.svg.png",
        team2img: "https://upload.wikimedia.org/wikipedia/fr/thumb/c/c7/Logo_Real_Madrid.svg/1200px-Logo_Real_Madrid.svg.png",
        team1: "Barcelona",
        team2: "Real Madrid",
        date: "02/03/2022",
        location: "Bernabio"
    ),
    RefereeJob(
        team1img: "https://upload.wikimedia.org/wikipedia/fr/thumb/a/a1/Logo_FC_Barcelona.svg/640px-Logo_FC_Barcelona.svg.png",
        team2img: "https://upload.wikimedia.org/wikipedia/fr/thumb/c/c7/Logo_Real_Madrid.svg/1200px-Logo_Real_Madrid.svg.png",
        team1: "Barcelona",
        team2: "Real Madrid",
        date: "02/03/2022",
        location: "Bernabio"
    ),
  ];

}
