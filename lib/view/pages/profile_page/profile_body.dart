part of profile_page;

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void dispose() {
    getIt<ProfilepageBloc>().close();
    super.dispose();
  }

  final _button = _ProfilePageButton();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _ProfileListTile(),
        ElevatedButton.icon(
            onPressed: () {
              context.router.navigate(const MyRafflesRoute());
            },
            icon: const Icon(Icons.queue_music_outlined),
            label: const Text("Katıldığın Çekilişler")),
        _button.iconButton(
          text: 'Bilgileri güncelle',
          icon: Icons.person,
          onPressed: () => context.router.navigateNamed(
              RouteConsts.PROFILE_PAGE + "/" + RouteConsts.UPDATE_PROFILE_PAGE),
        ),
        _button.iconButton(
          text: 'Şifreyi değiştir',
          icon: Icons.password,
          onPressed: () => context.router.navigateNamed(
              RouteConsts.PROFILE_PAGE +
                  "/" +
                  RouteConsts.CHANGE_PASSWORD_PAGE),
        ),
        _button.iconButton(
          text: 'Telefonu Doğrula',
          icon: Icons.phone,
          onPressed: () => context.router.navigateNamed(
              RouteConsts.PROFILE_PAGE + "/" + RouteConsts.VERIFY_PHONE_PAGE),
        ),
        _button.iconButton(
          text: 'Bize ulaş',
          icon: Icons.chat,
          onPressed: () => context.router.navigateNamed(
              RouteConsts.PROFILE_PAGE + "/" + RouteConsts.CONTACT_US_PAGE),
        ),
        const LogOutButton()
      ],
    );
  }
}
