import 'package:flutter/cupertino.dart';
import 'package:weds360/pages/vendors/models/location_filter_chip_model.dart';
import 'package:weds360/pages/vendors/models/vendorModel.dart';

class VendorsProvuder extends ChangeNotifier {
  List<VendorModel> vendorsList = [
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/portrait-beautiful-woman-with-make-up_23-2148780009.jpg',
        title: 'Hafez',
        rate: 3.5),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/girl-pinup-with-brunette-hair-retro-make-up-with-red-lips-bathrobe-dark-background-girl-sitting-bed-vintage-image_148665-269.jpg',
        title: 'Hafez',
        rate: 1.2),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/fashionable-young-woman_217529-1.jpg',
        title: 'Hafez',
        rate: 5.0),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/enchanting-white-girl-with-trendy-jewelry-posing-with-plant-close-up-shot-amazed-female-model-with-golden-accessories-green-leaf_197531-14067.jpg',
        title: 'Hafez',
        rate: 4.2),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/portrait-beautiful-woman-with-make-up_23-2148780009.jpg',
        title: 'Hafez',
        rate: 3.0),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/girl-pinup-with-brunette-hair-retro-make-up-with-red-lips-bathrobe-dark-background-girl-sitting-bed-vintage-image_148665-269.jpg',
        title: 'Hafez',
        rate: 2.1),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/fashionable-young-woman_217529-1.jpg',
        title: 'Hafez',
        rate: 3.5),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/enchanting-white-girl-with-trendy-jewelry-posing-with-plant-close-up-shot-amazed-female-model-with-golden-accessories-green-leaf_197531-14067.jpg',
        title: 'Hafez',
        rate: 3.5),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/portrait-beautiful-woman-with-make-up_23-2148780009.jpg',
        title: 'Hafez',
        rate: 3.5),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/girl-pinup-with-brunette-hair-retro-make-up-with-red-lips-bathrobe-dark-background-girl-sitting-bed-vintage-image_148665-269.jpg',
        title: 'Hafez',
        rate: 3.5),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/fashionable-young-woman_217529-1.jpg',
        title: 'Hafez',
        rate: 3.5),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/enchanting-white-girl-with-trendy-jewelry-posing-with-plant-close-up-shot-amazed-female-model-with-golden-accessories-green-leaf_197531-14067.jpg',
        title: 'Hafez',
        rate: 3.5),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/portrait-beautiful-woman-with-make-up_23-2148780009.jpg',
        title: 'Hafez',
        rate: 3.5),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/girl-pinup-with-brunette-hair-retro-make-up-with-red-lips-bathrobe-dark-background-girl-sitting-bed-vintage-image_148665-269.jpg',
        title: 'Hafez',
        rate: 3.5),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/fashionable-young-woman_217529-1.jpg',
        title: 'Hafez',
        rate: 3.5),
    VendorModel(
        imagePath:
            'https://image.freepik.com/free-photo/enchanting-white-girl-with-trendy-jewelry-posing-with-plant-close-up-shot-amazed-female-model-with-golden-accessories-green-leaf_197531-14067.jpg',
        title: 'Hafez',
        rate: 3.5),
  ];
  List<String> carsualiamges = [
    'https://image.freepik.com/free-photo/wondered-curly-haired-woman-has-curious-excited-gaze-shows-product-empty-space-gives-advice-dressed-brown-sweatshirt-says-click-link-isolated-beige-wall_273609-37595.jpg',
    'https://image.freepik.com/free-photo/photo-delighted-cheerful-afro-american-woman-with-crisp-hair-points-away-shows-blank-space-happy-advertise-item-sale-wears-orange-jumper-demonstrates-where-clothes-shop-situated_273609-26392.jpg',
    'https://image.freepik.com/free-photo/amazed-shocked-afro-woman-shows-good-sale-offer-deal-holds-breath-demonstrates-empty-copy-space-isolated-blue-background_273609-34443.jpg',
    'https://image.freepik.com/free-photo/young-caucasian-woman-isolated-blue-background-impressed-holding-copy-space-palm_1187-120139.jpg',
  ];
  List<LocationFiltterChipModel> locationList = [
    LocationFiltterChipModel(label: 'nasr city', isSelcted: false),
    LocationFiltterChipModel(label: '6 October', isSelcted: false),
    LocationFiltterChipModel(label: 'Masr elGededa', isSelcted: false),
    LocationFiltterChipModel(label: ' 5th Settlement', isSelcted: false),
    LocationFiltterChipModel(label: ' Maadi', isSelcted: false),
  ];

  int activeimageSlider = 0;
  void onLocationChipChange(LocationFiltterChipModel model) {
    int index = locationList.indexOf(model);
    locationList[index].isSelcted = !locationList[index].isSelcted;
    notifyListeners();
  }

  void onSliderpageChange(int index) {
    activeimageSlider = index;
    notifyListeners();
  }

  void onFavoriteClick(int index) {
    vendorsList[index].isFavorite = !vendorsList[index].isFavorite;
    notifyListeners();
  }
}
