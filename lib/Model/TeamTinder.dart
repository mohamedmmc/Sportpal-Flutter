class TeamTinder {
  final String id;
  final String name;
  final String description;
  final String img;
  final int nbrPlayers;
  final int? rating;

  const TeamTinder({required this.id,required this.name, required this.description, required this.img,required this.nbrPlayers,this.rating});
}