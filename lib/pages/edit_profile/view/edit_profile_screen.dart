import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/pages/edit_profile/view/circle_edit_image.dart';
import 'package:weds360/pages/edit_profile/view/data_filed.dart';
import 'package:weds360/pages/edit_profile/view/edit_dialog.dart';
import 'package:weds360/pages/edit_profile/view/edit_profle_provider.dart';

class EditProfileScreen extends StatefulWidget {
  static const String id = 'EditProfile';

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<EditProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: Theme.of(context).accentColor,
            ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kPADDING * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Profile',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontSize: 35.0,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: CircleEditImage(
                    onTap: () {
                      data.getImage();
                    },
                    imagePath: 'assets/images/alimotie.jpg',
                  ),
                ),
                DataFiled(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditDialog(
                        label: 'username',
                        errorMassege:
                            data.isUsernameValid ? null : 'enter Valid Name',
                        onPressed: () {
                          data.onEditUsername(data.newUsername, context);
                        },
                        onChanded: (value) {
                          data.onChangeUserName(value);
                        },
                        icon: Icons.person,
                        keyboard: TextInputType.name,
                        onSubmeted: (value) {
                          data.onEditUsername(value, context);
                        },
                      ),
                    );
                  },
                  label: 'Username',
                  data: data.user.username,
                ),
                DataFiled(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditDialog(
                        label: 'email',
                        errorMassege:
                            data.isEmailValid ? null : 'enter Valid email',
                        onPressed: () {
                          data.onEditEmail(data.newEmail, context);
                        },
                        onChanded: (value) {
                          data.onChangeEmail(value);
                        },
                        icon: Icons.email_rounded,
                        keyboard: TextInputType.emailAddress,
                        onSubmeted: (value) {
                          data.onEditEmail(value, context);
                        },
                      ),
                    );
                  },
                  label: 'Email',
                  data: data.user.email,
                ),
                DataFiled(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditDialog(
                        label: 'phone',
                        errorMassege:
                            data.isPhoneValed ? null : 'enter Valid phone No.',
                        onPressed: () {
                          data.onEditPhone(data.newPhone, context);
                        },
                        onChanded: (value) {
                          data.onChangePhone(value);
                        },
                        icon: Icons.phone,
                        keyboard: TextInputType.phone,
                        onSubmeted: (value) {
                          data.onEditPhone(value, context);
                        },
                      ),
                    );
                  },
                  label: 'Phone',
                  data: data.user.phone,
                ),
                DataFiled(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditDialog(
                        label: 'birthDay',
                        errorMassege:
                            data.isBirthDayValid ? null : 'enter Valid Date',
                        onPressed: () {
                          data.onEditBithDay(data.newBirthDay, context);
                        },
                        onChanded: (value) {
                          data.onChangeBirthDay(value);
                        },
                        icon: Icons.calendar_today,
                        keyboard: TextInputType.datetime,
                        onSubmeted: (value) {
                          data.onEditBithDay(value, context);
                        },
                        isBirthday: true,
                      ),
                    );
                  },
                  label: 'Date of brith',
                  data: data.user.birthDay,
                ),
                DataFiled(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditDialog(
                        label: 'Fiance Name',
                        errorMassege:
                            data.isFinanceNameValid ? null : 'enter Valid Name',
                        onPressed: () {
                          data.onEditFinanceName(data.newFinaceName, context);
                        },
                        onChanded: (value) {
                          data.onChangeFinanceName(value);
                        },
                        icon: Icons.person,
                        keyboard: TextInputType.name,
                        onSubmeted: (value) {
                          data.onEditFinanceName(value, context);
                        },
                      ),
                    );
                  },
                  label: 'Fiance Name',
                  data: data.user.financeName,
                ),
                DataFiled(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditDialog(
                        label: 'birthDay',
                        errorMassege: data.isFinanceBirthDayValid
                            ? null
                            : 'enter Valid Date',
                        onPressed: () {
                          data.onEditFinanceBirthDay(
                              data.newFinanceBirthDay, context);
                        },
                        onChanded: (value) {
                          data.onChangeFinanceBirhDay(value);
                        },
                        icon: Icons.calendar_today,
                        keyboard: TextInputType.datetime,
                        onSubmeted: (value) {
                          data.onEditFinanceBirthDay(value, context);
                        },
                        isBirthday: true,
                      ),
                    );
                  },
                  label: 'Fiance Date of brith',
                  data: data.user.financeBirthDay == null
                      ? 'not Exist'
                      : data.user.financeBirthDay,
                ),
                DataFiled(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditDialog(
                        label: 'Fiance phone',
                        errorMassege: data.isFinancePhoneValid
                            ? null
                            : 'enter Valid Phone No.',
                        onPressed: () {
                          data.onEditFinancePhone(data.newFinacePhone, context);
                        },
                        onChanded: (value) {
                          data.onChangeFinancePhone(value);
                        },
                        icon: Icons.phone,
                        keyboard: TextInputType.phone,
                        onSubmeted: (value) {
                          data.onEditFinancePhone(value, context);
                        },
                      ),
                    );
                  },
                  label: 'Fiance Phone Number',
                  data: data.user.financePhone == null
                      ? 'not Exist'
                      : data.user.financePhone,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
