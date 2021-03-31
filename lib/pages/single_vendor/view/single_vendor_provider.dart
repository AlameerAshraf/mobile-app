import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weds360/pages/single_vendor/models/review_model.dart';
import 'package:weds360/pages/single_vendor/models/single_vendor_model.dart';

class SingleVendorProvider extends ChangeNotifier {
  SingleVendrorModel singleVendrorModel = new SingleVendrorModel(
      imageUrls: [
        'https://image.freepik.com/free-photo/wedding-couple-stairs-park_240347-105.jpg',
        'https://image.freepik.com/free-photo/elegant-curly-bride-stylish-groom_79762-879.jpg',
        'https://image.freepik.com/free-photo/young-wedding-couple-enjoying-romantic-moments_1328-4127.jpg',
        'https://image.freepik.com/free-photo/beautiful-guy-girl-bride-white-wedding-dress-groom-classic-blue-suit-against-nature-background-wedding-family-creation_99433-1312.jpg',
      ],
      title: 'Kepinski Nile Hotel Cairo',
      descreption:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      phone: '01001289970',
      facebookUrl: 'https://www.facebook.com/ali.motie/',
      instagramUrl: 'https://www.instagram.com/ali_motie3/',
      websiteUrl: 'https://weds360.com/en/home',
      reviews: 1000,
      rate: 4.2,
      isFavorite: false,
      category: 'Designers',
      address: '6B Aswan Square 5th floor Mohandessin.',
      reviewsList: [
        ReviewModel(imagePath: 'assets/images/alimotie.jpg', name: 'Ali Motie', rate: 3.5, content: 'Lorem Ipsum is simply dummy text of the printing and typesettin',),
        ReviewModel(imagePath: 'assets/images/alimotie.jpg', name: 'Ali Motie', rate: 3.5, content: 'Lorem Ipsum is simply dummy text of the printing and typesettin',),
        ReviewModel(imagePath: 'assets/images/alimotie.jpg', name: 'Ali Motie', rate: 3.5, content: 'Lorem Ipsum is simply dummy text of the printing and typesettin',),
        ReviewModel(imagePath: 'assets/images/alimotie.jpg', name: 'Ali Motie', rate: 3.5, content: 'Lorem Ipsum is simply dummy text of the printing and typesettin',),
      ]);
  int activeimageSlider = 0;
  void onSliderpageChange(int index) {
    activeimageSlider = index;
    notifyListeners();
  }

  void launchURL(String url) async {
    await canLaunch(url)
        ? await launch(
            url,
            universalLinksOnly: true,
          )
        : throw 'Could not launch $url';
  }

  void onFavoriteClick() {
    singleVendrorModel.isFavorite = !singleVendrorModel.isFavorite;
    notifyListeners();
  }
}
