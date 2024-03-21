import 'package:donneursang/core/common/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final homeControllerProvider =
    ChangeNotifierProvider((ref) => HomeController(ref));

final getIsdoneActivateProvider = FutureProvider<List<UserModel>>((ref) {
  var isdoneActivateController = ref.watch(homeControllerProvider);
  return isdoneActivateController.getIdoneActivate();
});

class HomeController extends ChangeNotifier {
  final Ref ref;
  HomeController(this.ref);
  final supabase = Supabase.instance.client;

  Future<List<UserModel>> getIdoneActivate() async {
    var data =
        await supabase.from('users').select().filter("isdonor", "eq", true);
    return data.map((e) => UserModel.fromMap(e)).toList();
  }
}
