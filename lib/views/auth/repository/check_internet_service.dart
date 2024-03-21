
// import 'package:connectivity_wrapper/connectivity_wrapper.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class CheckInternetService {
//   final WidgetRef ref;

//   CheckInternetService(this.ref);

//   void init() {
//     var subscription = Stream.periodic(const Duration(seconds: 2), (_) async {
//       ref.read(hasConnectionProvider.notifier).state =
//           await ConnectivityWrapper.instance.isConnected;
//     });

//     subscription.listen((event) {});
//   }
// }
