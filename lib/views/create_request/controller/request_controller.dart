import 'package:donneursang/core/common/helper/show_loading_dialog.dart';
import 'package:donneursang/core/utils/utils.dart';
import 'package:donneursang/core/common/models/request_donation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum RequestAction { paymentStatus, usersDonorConfirm, cancel, rejet }

final requestControllerProvider =
    ChangeNotifierProvider((ref) => RequestController(ref));
    
final getRequestDonationProvider = FutureProvider<List<RequestDonation>>((ref) {
  var requestDonationController = ref.watch(requestControllerProvider);
  return requestDonationController.getRequestDonation();
});

class RequestController extends ChangeNotifier {
  final Ref ref;
  RequestController(this.ref);
  final supabase = Supabase.instance.client;

  Future<void> createRequestDonation(BuildContext context,
      {required RequestDonation requestDonation}) async {
    try {
      if (!context.mounted) return;
      showLoadingDialog(
        context: context,
        message: "Create request donation ... ",
      );
      await supabase.from('request_donation').insert([
        {
          'usersDonor': requestDonation.usersDonor,
          'usersRequestDonation': requestDonation.usersRequestDonation,
          'createAt': requestDonation.createAt,
          'usersDonorConfirm': requestDonation.usersDonorConfirm,
          'paymentStatus': requestDonation.paymentStatus,
          'cancel': requestDonation.cancel,
          'rejet': requestDonation.rejet
        }
      ]);
      if (!context.mounted) return;
      Navigator.pop(context);
      if (!context.mounted) return;
      Utils.showSnackBar(
          context: context,
          content:
              "Create request donation registered successfully,wait the confirnation to ${requestDonation.usersDonor.email}. ",
          isError: false);
    } catch (e, _) {
      if (!context.mounted) return;
      Navigator.pop(context);
      if (!context.mounted) return;
      Utils.showSnackBar(
        context: context,
        content: "Error: ${e.toString()}",
      );
    }
  }

  Future<void> updateRequestDonation(BuildContext context,
      {required int id, required RequestAction requestAction}) async {
    try {
      if (!context.mounted) return;
      showLoadingDialog(
        context: context,
        message: "Update request donation ... ",
      );

      switch (requestAction) {
        case RequestAction.paymentStatus:
          break;
        default:
      }

      switch (requestAction) {
        case RequestAction.paymentStatus:
          await supabase
              .from('request_donation')
              .update({"id": id}).eq("paymentStatus", true);
          break;
        case RequestAction.rejet:
          await supabase
              .from('request_donation')
              .update({"id": id}).eq("rejet", true);
          break;
        case RequestAction.cancel:
          await supabase
              .from('request_donation')
              .update({"id": id}).eq("cancel", true);
          break;
        case RequestAction.usersDonorConfirm:
          await supabase
              .from('request_donation')
              .update({"id": id}).eq("usersDonorConfirm", true);
          break;

        default:
      }

      if (!context.mounted) return;
      Navigator.pop(context);
      if (!context.mounted) return;
      Utils.showSnackBar(
          context: context,
          content: " request donation update successfully",
          isError: false);
    } catch (e) {
      if (!context.mounted) return;
      Navigator.pop(context);
      if (!context.mounted) return;
      Utils.showSnackBar(
        context: context,
        content: "Error: ${e.toString()}",
      );
    }
  }

  Future<List<RequestDonation>> getRequestDonation() async {
    var data = await supabase.from('request_donation').select();
    return data.map((e) => RequestDonation.fromMap(e)).toList();
  }
}
