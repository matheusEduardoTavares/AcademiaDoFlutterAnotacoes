class PostModel {
  PostModel({
    required this.userName,
    required this.userURL,
    required this.urlImage,
    required this.qtyLikes,
    required this.description,
  });

  final String userName;
  final String userURL;
  final String urlImage;
  final int qtyLikes;
  final String description;  
}
