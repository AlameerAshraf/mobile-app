import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weds360/components/raised_button_costem.dart';
import 'package:weds360/components/text_field_custem.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/core/helpers/app_localizations.dart';
import 'package:weds360/pages/signup/view/signup_provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'Signup';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final signUpData = Provider.of<SignupProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        signUpData.clear();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kPADDING * 2),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)
                          .translate('signup_screen_label'),
                      style: Theme.of(context).textTheme.headline1.copyWith(
                            fontSize: 35.0,
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    Text(
                      'Wedding Planning is a piece of cake with Weds360 .',
                      // AppLocalizations.of(context).translate('login_screen_label'),
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            fontWeight: FontWeight.w600,
                            // fontSize: 35.0,
                            color:
                                Theme.of(context).accentColor.withOpacity(0.6),
                          ),
                    ),
                    TextFieldCustem(
                      label: 'Name',
                      prefexIcon: Icons.person,
                      keyboardType: TextInputType.name,
                      errorMessege: signUpData.isNameValid
                          ? null
                          : 'please enter valid name',
                      onChanged: (value) {
                        signUpData.onChangeName(value);
                      },
                      onSubmitted: (value) {
                        signUpData.nameValidation(value);
                      },
                    ),
                    TextFieldCustem(
                      label: 'Partner Name',
                      prefexIcon: Icons.person,
                      keyboardType: TextInputType.name,
                      errorMessege: signUpData.isPartnerNameValid
                          ? null
                          : 'please enter valid name',
                      onChanged: (value) {
                        signUpData.onChangePartnerName(value);
                      },
                      onSubmitted: (value) {
                        signUpData.parterNameValidation(value);
                      },
                    ),
                    TextFieldCustem(
                      label: 'Email',
                      prefexIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      errorMessege: signUpData.isEmailValid
                          ? null
                          : 'please enter valid email',
                      onChanged: (value) {
                        signUpData.onChangeEmail(value);
                      },
                      onSubmitted: (value) {
                        signUpData.emailValidation(value);
                      },
                    ),
                    TextFieldCustem(
                      label: 'Password',
                      prefexIcon: Icons.lock_outline,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      errorMessege: signUpData.isPasswordValid
                          ? null
                          : 'please enter valid password',
                      onChanged: (value) {
                        signUpData.onChangePassword(value);
                      },
                      onSubmitted: (value) {
                        signUpData.passwordValidation(value);
                      },
                    ),
                    TextFieldCustem(
                      label: 'Confirm Password',
                      prefexIcon: Icons.lock_outline,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      errorMessege: signUpData.isConfermPasswordValid
                          ? null
                          : 'please enter valid name',
                      onChanged: (value) {
                        signUpData.onChangeConfremPassword(value);
                      },
                      onSubmitted: (value) {
                        signUpData.confermPasswordValidation(value);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: kPADDING),
                      child: RaisedButtonCustem(
                        title: 'Signup',
                        onPressed: () {
                          signUpData.signup(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
