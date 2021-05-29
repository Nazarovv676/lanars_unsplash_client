class Photo {
  final String? id;
  final String full;
  final String? regular;
  final String small;
  final String userName;
  final int? likes;
  final String blurHash;

  Photo({
    required this.full,
    required this.small,
    required this.userName,
    this.likes,
    required this.blurHash,
    this.regular,
    this.id,
  });
}
