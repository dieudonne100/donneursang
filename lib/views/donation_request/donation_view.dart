import 'package:donneursang/core/common/models/user.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/commons/contain_widget.dart';

class DonationView extends StatefulWidget {
  const DonationView({super.key});

  @override
  State<DonationView> createState() => _DonationViewState();
}

class _DonationViewState extends State<DonationView> {
  List<UserModel> donorUser = [];
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var data =
        await supabase.from('users').select().filter("isdonor", "eq", true);
    donorUser = data.map((e) => UserModel.fromMap(e)).toList();
    print(donorUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Donation Request',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: "Poppins",
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: donorUser.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ContainWidget(userModel: donorUser[index]);
              },
              separatorBuilder: (_, __) {
                return const SizedBox(
                  height: 12,
                );
              },
            ),
          ),
        ));
  }
}
