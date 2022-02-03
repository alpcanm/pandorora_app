import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/locator_get_it.dart';
import '../bloc/profilepage_bloc.dart';

class ProfileExpansionTile extends StatelessWidget {
  const ProfileExpansionTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = getIt<ProfilepageBloc>();
    return BlocBuilder<ProfilepageBloc, ProfilepageState>(
      bloc: _bloc,
      builder: (context, state) {
        return ListTile(
          leading: const CircleAvatar(
            child: FlutterLogo(),
          ),
          title: Text(
            state.user?.name ?? "boş",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          subtitle: Text(state.user?.mail ?? "boş"),
          trailing: const Icon(Icons.settings),
        );
      },
    );
  }
}
