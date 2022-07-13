class PastBets {
  final String imgt1;
  final String imgt2;
  final String result;
  final int t1goals;
  final int t2goals;

  PastBets({
    required this.imgt1,
    required this.imgt2,
    required this.result,
    required this.t1goals,
    required this.t2goals,
  });
  static List<PastBets> mybets = [
    PastBets(
      imgt1: "https://upload.wikimedia.org/wikipedia/fr/thumb/5/54/Logo_FC_Liverpool.svg/1200px-Logo_FC_Liverpool.svg.png",
      imgt2: "https://upload.wikimedia.org/wikipedia/fr/thumb/a/a1/Logo_FC_Barcelona.svg/1200px-Logo_FC_Barcelona.svg.png",
      result: "Victory",
      t1goals: 4,
      t2goals: 0,
    ),
    PastBets(
      imgt1: "https://upload.wikimedia.org/wikipedia/fr/thumb/5/54/Logo_FC_Liverpool.svg/1200px-Logo_FC_Liverpool.svg.png",
      imgt2: "https://upload.wikimedia.org/wikipedia/fr/thumb/b/b9/Logo_Manchester_United.svg/1200px-Logo_Manchester_United.svg.png",
      result: "Victory",
      t1goals: 5,
      t2goals: 0,
    ),
    PastBets(
      imgt1: "https://upload.wikimedia.org/wikipedia/fr/thumb/5/54/Logo_FC_Liverpool.svg/1200px-Logo_FC_Liverpool.svg.png",
      imgt2: "https://upload.wikimedia.org/wikipedia/fr/thumb/b/ba/Logo_Manchester_City_2016.svg/1200px-Logo_Manchester_City_2016.svg.png",
      result: "Tie",
      t1goals: 0,
      t2goals: 0,
    ),
    PastBets(
      imgt1: "https://upload.wikimedia.org/wikipedia/fr/thumb/5/54/Logo_FC_Liverpool.svg/1200px-Logo_FC_Liverpool.svg.png",
      imgt2: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/FC_Internazionale_Milano_2021.svg/1200px-FC_Internazionale_Milano_2021.svg.png",
      result: "Defeat",
      t1goals: 1,
      t2goals: 2,
    ),
  ];
}
