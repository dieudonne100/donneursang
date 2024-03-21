import 'package:donneursang/core/commons/custom_dropdown.dart';
import 'package:donneursang/core/commons/custom_text_field.dart';
import 'package:donneursang/core/commons/extensions/string_extension.dart';
import 'package:donneursang/core/constants/themes.dart';
import 'package:donneursang/core/providers/providers.dart';
import 'package:donneursang/main.dart';
import 'package:donneursang/views/auth/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class SignUpForm extends ConsumerStatefulWidget {
  final VoidCallback onEdit;
  const SignUpForm({
    super.key,
    required this.onEdit,
  });

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final List<String> bloodGroups = [
    'A+',
    'B+',
    'O+',
    'AB+',
    'A-',
    'B-',
    'O-',
    'AB-'
  ];
  final List<String> genderList = ["M.", "Mme."];
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    var loginController = ref.watch(loginControllerProvider);
    var pref = container.read(sharedPreferencesProvider);

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
                width: 96,
                child: CustomDropdown(
                  hint: 'M',
                  value: loginController.gender,
                  options: genderList,
                  // dropDownMenuText: (p0) => p0,
                  onChanged: (value) {
                    ref.read(loginControllerProvider).setGender(value!);
                  },
                )),
            const Gap(16),
            Expanded(
              child: CustomTextField(
                controller: loginController.firstNnameController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  widget.onEdit();
                },
                hint: "Firt Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Champ obligatoire";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
        const Gap(16),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: loginController.lastNnameController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  widget.onEdit();
                },
                hint: "Last Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Champ obligatoire";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const Gap(16),
            Expanded(
              child: CustomTextField(
                controller: loginController.phoneController,
                onChanged: (value) {
                  widget.onEdit();
                },
                keyboardType: TextInputType.phone,
                hint: "6XXXXXXXX",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone no is required';
                  }
                  return null;
                },
              ),
            )
          ],
        ),
        const Gap(16),
        CustomTextField(
          keyboardType: TextInputType.emailAddress,
          controller: loginController.emailController,
          onChanged: (value) {
            widget.onEdit();
          },
          hint: "Email ID",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email ID is required';
            } else if (!value.isEmail()) {
              return 'Please enter a valid Email ID';
            } else {
              return null;
            }
          },
        ),
        const Gap(16),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: loginController.passController,
                onChanged: (value) {
                  widget.onEdit();
                },
                suffix: showPassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
                hint: "Password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 6) {
                    return 'Password should be of more than 6 characters';
                  }
                  return null;
                },
              ),
            ),
            const Gap(16),
            Expanded(
              child: CustomDropdown<String>(
                hint: 'A+',
                value: loginController.bloodGroup,
                options: bloodGroups,
                dropDownMenuText: (p0) => p0.assetsName,
                onChanged: (value) {
                  ref.read(loginControllerProvider).setBloodGroup(value!);
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        const Gap(16),
        CustomTextField(
          suffix: const Icon(
            Icons.calendar_month_outlined,
            color: kPrimaryColor,
            size: 22,
          ),
          hint: loginController.birthDate == null
              ? "yyyy-MM-dd"
              : DateFormat('yyyy-MM-dd').format(loginController.birthDate!),
          readOnly: true,
          onTap: () {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                maxTime: DateTime.now(), onConfirm: (date) {
              ref.read(loginControllerProvider).setBirthDate(date);
            }, currentTime: DateTime.now(), locale: LocaleType.fr);
          },
          validator: (value) {
            if (value == "") {
              return "La date de naissance ne doit pas être vide";
            }

            return null;
          },
          onChanged: (_) {
            setState(() {});
          },
        ),
        const Gap(16),
        CustomTextField(
          readOnly: true,
          onChanged: (value) {
            widget.onEdit();
          },
          hint: pref.getString("country"),
          validator: (value) {
            if (value == null || value.isEmpty) return 'City is required';
            return null;
          },
        ),
        const Gap(16),
        Row(
          children: <Widget>[
            const Expanded(
              child: Text("Activate Donor",
                  style: TextStyle(fontWeight: FontWeight.w500)),
            ),
            Switch(
              onChanged: (value) {
                ref.read(loginControllerProvider).setIsdonor(value);
                setState(() {});
              },
              value: loginController.isDonor ?? false,
              activeColor: Colors.white,
              inactiveTrackColor: const Color(0xffB9BCB9),
              activeTrackColor: kPrimaryColor,
            )
          ],
        )
      ],
    );
  }
}
