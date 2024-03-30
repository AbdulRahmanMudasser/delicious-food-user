class OnBoardModel {
  final String image;
  final String title;
  final String description;

  OnBoardModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnBoardModel> onBoardContents = [
    OnBoardModel(
      image: "assets/images/screen1.png",
      title: "Select From Our Menu",
      description: "Pick Your Food From Our Menu",
    ),

    OnBoardModel(
      image: "assets/images/screen2.png",
      title: "Easy Online Payment",
      description: "You Can Pay Cash Or Card",
    ),

    OnBoardModel(
      image: "assets/images/screen3.png",
      title: "Food Delivered To You",
      description: "Deliver Your Food At Your Door",
    ),
  ];
}
