import 'package:country_picker/country_picker.dart';
import 'package:donneursang/core/common/helper/show_alert_dialog.dart';
import 'package:donneursang/core/common/widgets/custom_icon_button.dart';
import 'package:donneursang/core/commons/custom_button.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/views/auth/controller/login_controller.dart';
import 'package:donneursang/views/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  bool isLoading = false;

  sendCodeToPhone() {
    var loginController = ref.watch(loginControllerProvider);

    final phoneNumber = loginController.phoneController.text;
    final countryName = countryNameController.text;

    if (phoneNumber.isEmpty) {
      return showAlertDialog(
        context: context,
        message: "Please enter your phone number",
      );
    } else if (phoneNumber.length < 9) {
      return showAlertDialog(
        context: context,
        message:
            'The phone number you entered is too short for the country: $countryName\n\nInclude your area code if you haven\'t',
      );
    } else if (phoneNumber.length > 10) {
      return showAlertDialog(
        context: context,
        message:
            "The phone number you entered is too long for the country: $countryName",
      );
    }

    ref.read(loginControllerProvider).signInWithPhone(
          context,
        );
  }

  showCountryPickerBottomSheet() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['CM'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).colorScheme.background,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: const TextStyle(color: Colors.grey),
        inputDecoration: InputDecoration(
          labelStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(
            Icons.language,
            color: Colors.green,
          ),
          hintText: 'Search country by code or name',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(.2),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
        ),
      ),
      onSelect: (country) {
        countryNameController.text = country.name;
        countryCodeController.text = country.phoneCode;
      },
    );
  }

  iniCountry() async {
    final preferences = await SharedPreferences.getInstance();
    countryNameController =
        TextEditingController(text: preferences.getString("country"));
    countryCodeController = TextEditingController(text: "237");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    iniCountry();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var loginController = ref.watch(loginControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: const Text(
          'Enter your phone number',
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onPressed: () {},
            icon: Icons.more_vert,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                text: 'Dare To Donate will need to verify your number. ',
                style: TextStyle(
                  color: Colors.grey,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: "What's my number?",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomTextField(
              onTap: showCountryPickerBottomSheet,
              controller: countryNameController,
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.green,
                size: 22,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    onTap: showCountryPickerBottomSheet,
                    controller: countryCodeController,
                    prefixText: '+',
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    controller: loginController.phoneController,
                    onChanged: (_) {
                      setState(() {});
                    },
                    hintText: 'phone number',
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Carrier charges may apply',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomButton(
          isFullWidth: true,
          onPressed: sendCodeToPhone,
          text: 'VERIFY',
        ),
      ),
    );
  }
}
