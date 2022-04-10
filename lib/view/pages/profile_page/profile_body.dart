part of profile_page;

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _ProfileListTile(),
        const Divider(),
        const _ShowNickName(),
        const Divider(),
        ProfilePageButton.iconButton(
          text: "Katıldığın Çekilişler",
          icon: Icons.airplane_ticket,
          iconColor: Theme.of(context).primaryColor,
          onPressed: () => context.router.navigate(const MyRafflesRoute()),
        ),
        ProfilePageButton.iconButton(
          text: 'Bilgileri güncelle',
          icon: Icons.person,
          iconColor: Colors.purple,
          onPressed: () => context.router.navigateNamed(
              RouteConsts.PROFILE_PAGE + "/" + RouteConsts.UPDATE_PROFILE_PAGE),
        ),
        ProfilePageButton.iconButton(
          text: 'Bize ulaş',
          icon: Icons.chat,
          iconColor: Colors.green,
          onPressed: () => context.router.navigateNamed(
              RouteConsts.PROFILE_PAGE + "/" + RouteConsts.CONTACT_US_PAGE),
        ),
        ProfilePageButton.iconButton(
          text: 'Çıkış yap',
          icon: Icons.exit_to_app,
          iconColor: Colors.red,
          onPressed: () => _logOut(context),
        ),
      ],
    );
  }

  void _logOut(BuildContext context) {
    getIt<GlobalRepository>().logOut();
    getIt.resetLazySingleton<PaginationBloc>();
    getIt<AuthRepository>().logOut().then(
        (value) => context.router.replaceAll([const AuthControllerRoute()]));
  }
}
