import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weds360/pages/categorys/models/categorys_model.dart';

class CategorysProvider with ChangeNotifier {
  List<CategorysModel> forher = [
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/bridesmaid-makes-bow-knot-back-brides-wedding-dress_8353-5832.jpg',
        title: 'Designers',
        icon: FontAwesomeIcons.female,),
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/wedding-bands-hands-bride-groom-with-beautiful-wedding-bouquet-made-greenery-white-flowers_8353-11212.jpg',
        title: 'Rings',
        icon: FontAwesomeIcons.female,),
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/female-makeup-artist-makes-up-cute-beautiful-young-woman-beauty-salon_289152-143.jpg',
        title: 'Makeup Artists',
        icon: FontAwesomeIcons.female,),
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/skin-body-care-close-up-young-woman-getting-spa-treatment-beauty-salon-spa-face-massage-facial-beauty-treatment-spa-salon_118454-7049.jpg',
        title: 'Spas',
        icon: FontAwesomeIcons.female,),
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/female-hairdresser-making-hairstyle-blonde-woman-beauty-salon_176420-4458.jpg',
        title: 'Hairdressers',
        icon: FontAwesomeIcons.female,),
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/wedding-preparation-beautiful-happy-bride-dresses-earrings-before-wedding_8353-5813.jpg',
        title: 'Jewelry',
        icon: FontAwesomeIcons.female,),
  ];
  List<CategorysModel> forHim = [
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/businessman-adjusting-his-cufflinks_105092-77.jpg',
        title: 'Suits',
        icon: FontAwesomeIcons.male,),
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/portrait-happy-man-eating-fresh-salad-kitchen_23-2148075948.jpg',
        title: 'Health',
         icon: FontAwesomeIcons.male,
        ),
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/straight-razor-barbershop-beard-vintage-straight-razor-mens-haircut-man-barbershop_293990-260.jpg',
        title: 'Mens Grooming',
         icon: FontAwesomeIcons.male,),
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/young-fitness-man-studio_7502-5008.jpg',
        title: 'Fitness',
         icon: FontAwesomeIcons.male,),
  ];
  List<CategorysModel> forWedding = [
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/beautiful-photozone-with-big-wreath-decorated-with-greenery-roses-centerpiece-candles-sides-garland-hanged-trees_8353-11019.jpg',
        title: 'Venues',
         icon: FontAwesomeIcons.male,),
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/high-definition-cinema-camera-movie-set_39420-278.jpg',
        title: 'Videographers',
         icon: FontAwesomeIcons.male,),
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/detail-view-young-man-eyeglasses-taking-photos-street_8353-6507.jpg',
        title: 'Photographers',
         icon: FontAwesomeIcons.male,),
    CategorysModel(
        imagePath:
            'https://image.freepik.com/free-photo/close-up-dj-hands-controlling-music-table-night-club_102573-55.jpg',
        title: 'DJs',
         icon: FontAwesomeIcons.male,),
  ];
}
