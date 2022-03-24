part of profile_page;

class _ProfileListTile extends StatelessWidget {
  const _ProfileListTile({
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
