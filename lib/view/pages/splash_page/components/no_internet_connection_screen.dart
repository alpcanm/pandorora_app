part of splash_page;

class _NoInternetConnectionScreen extends StatelessWidget {
  const _NoInternetConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("İnternet bağlantısı yok."),
    );
  }
}
