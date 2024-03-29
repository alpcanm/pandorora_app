part of profile_page;

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocBuilder<UpdateprofileCubit, UpdateprofileState>(
          buildWhen: (previous, current) => current is UpdateprofileCompleted,
          bloc: getIt<UpdateprofileCubit>(),
          builder: (context, state) {
            return _ProfileListTile();
          },
        ),
        const Divider(),
        BlocBuilder<UpdateprofileCubit, UpdateprofileState>(
          buildWhen: (previous, current) => current is UpdateprofileCompleted,
          bloc: getIt<UpdateprofileCubit>(),
          builder: (context, state) {
            final _user = getIt<GlobalRepository>().user;
            return _ShowNickName(
              user: _user!,
            );
          },
        ),
        const Divider(),
        ProfilePageButton.iconButton(
          text: "Katıldığın Çekilişler",
          icon: Icons.account_balance_wallet,
          iconColor: Theme.of(context).primaryColor,
          onPressed: () => context.router.navigate(const MyRafflesRoute()),
        ),
        ProfilePageButton.iconButton(
          text: 'Bilgileri güncelle',
          icon: Icons.person,
          iconColor: Colors.purple,
          onPressed: () => context.router.navigateNamed(RouteConsts.PROFILE_PAGE + "/" + RouteConsts.UPDATE_PROFILE_PAGE),
        ),
        ProfilePageButton.iconButton(
          text: 'Bize ulaş',
          icon: Icons.chat,
          iconColor: Colors.green,
          onPressed: () {
            String? encodeQueryParameters(Map<String, String> params) {
              return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
            }

            final Uri emailLaunchUri = Uri(
              scheme: 'mailto',
              path: 'alpcanm@gmail.com',
              query: encodeQueryParameters(<String, String>{'subject': 'Merhaba Pandorora müşteri temsilcisi'}),
            );

            launchUrl(emailLaunchUri);
          },
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
    getIt<AuthRepository>().logOut().then((value) => context.router.replaceAll([const AuthControllerRoute()]));
  }
}
