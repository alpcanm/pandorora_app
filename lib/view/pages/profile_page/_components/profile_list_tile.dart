part of profile_page;

class _ProfileListTile extends StatelessWidget {
  const _ProfileListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = getIt<GlobalRepository>().user;
    return ListTile(
      leading: const CircleAvatar(
        child: FlutterLogo(),
      ),
      title: Text(
        _user?.name ?? "boş",
        style: Theme.of(context).textTheme.bodyText1,
      ),
      subtitle: Text(_user?.mail ?? "boş"),
    );
  }
}
