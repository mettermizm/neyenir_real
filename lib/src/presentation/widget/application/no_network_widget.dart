import 'package:flutter/material.dart';
import 'package:neyenir_app/src/config/color/app_color.dart';
import 'package:neyenir_app/src/config/network_connectivity/network_connectivity_manager.dart';
import 'package:neyenir_app/src/core/components/texts/custom_texts.dart';
import 'package:neyenir_app/src/core/enums/network_connectivity_enums.dart';
import 'package:neyenir_app/src/core/mixins/widgets_binding_mixin.dart';

class NoNetworkWidget extends StatefulWidget {
  const NoNetworkWidget({Key? key}) : super(key: key);

  @override
  State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget> with StateMixin {
  late final NetworkConnectivityManager _networkChange;
  NetworkConnectivityResult? _networkResult;

  @override
  void initState() {
    super.initState();
    _networkChange = NetworkConnectivityManager();
    afterPageRendered(() => _networkChange.handleNetworkChange(_updateView));
  }

  void _updateView(NetworkConnectivityResult result) {
    setState(() => _networkResult = result);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 500),
      crossFadeState: _networkResult == NetworkConnectivityResult.online
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: const SizedBox(),
      secondChild: const OfflineBar(),
    );
  }
}

/// It's a container that displays a message when the user is offline
class OfflineBar extends StatelessWidget {
  const OfflineBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      alignment: Alignment.center,
      height: kToolbarHeight + MediaQuery.of(context).padding.bottom,
      color: AppColor.primary,
      child: const CustomTextMedium(
        'You are currently Offline',
        color: Colors.white,
      ),
    );
  }
}
