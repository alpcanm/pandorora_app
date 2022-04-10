part of profile_page;

class _ProfileListTile extends StatelessWidget {
  const _ProfileListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = getIt<GlobalRepository>().user;
    return ListTile(
      leading: Icon(
        Icons.person,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        "${_user?.name} ${_user?.surname}",
        style: Theme.of(context).textTheme.bodyText1,
      ),
      // title: Text(
      //   "${_user?.name} ${_user?.surname}",
      //   style: Theme.of(context).textTheme.bodyText1,
      // ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${_user?.mail}"),
          (_user?.mailVerified == true)
              ? const Icon(
                  Icons.verified_user_outlined,
                  size: 16,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.warning_amber_outlined,
                  size: 16,
                  color: Colors.orange,
                ),
        ],
      ),
    );
  }
}

class _ShowNickName extends StatefulWidget {
  const _ShowNickName({
    Key? key,
  }) : super(key: key);

  @override
  State<_ShowNickName> createState() => _ShowNickNameState();
}

class _ShowNickNameState extends State<_ShowNickName> {
  bool _isIconActive = false;
  @override
  Widget build(BuildContext context) {
    final _user = getIt<GlobalRepository>().user;
    makeObscure(_user?.name ?? "");
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
                _isIconActive
                    ? "${_user?.raffleNickName}"
                    : makeObscure("${_user?.raffleNickName}"),
                style: Theme.of(context).textTheme.bodyText1),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isIconActive = !_isIconActive;
              });
            },
            child: Icon(_isIconActive
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined),
          ),
        )
      ],
    );
  }

  String makeObscure([String text = ""]) {
    String result = text;

    for (int i = 0; i < text.length; i++) {
      result = result.replaceRange(i, null, "*");
    }

    return result;
  }
}
