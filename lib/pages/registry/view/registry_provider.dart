import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import 'package:weds360/pages/registry/models/registry_model.dart';

class RegistryProvider extends ChangeNotifier {
  List<RegistryModel> regestrylist = [];
  RegistryModel registryModel = RegistryModel();

  void getImage() async {
    final _picker = ImagePicker();
    final image = await _picker.getImage(source: ImageSource.gallery);
    if (image != null) {
      registryModel.image = File(image.path);
    }
  }

  void onChangeTitle(String value) {
    registryModel.title = value;
  }

  void onChangeAddress(String value) {
    registryModel.address = value;
  }

  void onChangeNote(String value) {
    registryModel.note = value;
  }

  void onChangeprice(String value) {
    registryModel.price = double.parse(value);
  }

  void addItem(BuildContext context) {
    if (registryModel.image == null ||
        registryModel.title == null ||
        registryModel.address == null ||
        registryModel.note == null) {
    } else {
      regestrylist.add(registryModel);
      registryModel = RegistryModel();
      notifyListeners();
      Navigator.pop(context);
    }
  }

  void edititem({
    @required RegistryModel registry,
    @required BuildContext context,
  }) {
    if (registryModel.image != null) {
      registry.image = registryModel.image;
    }
    int index = regestrylist.indexOf(registry);
    regestrylist[index] = registry;
    Navigator.pop(context);
    notifyListeners();
  }
}
