part of raffle_detail_page;

class _RaffleDetailFAB extends StatelessWidget {
  const _RaffleDetailFAB(
    this.raffle, {
    Key? key,
  }) : super(key: key);
  final Raffle raffle;

  @override
  Widget build(BuildContext context) {
    final _globarRepo = getIt<GlobalRepository>();
    final _haveSubscribe = _globarRepo.checker(raffle.raffleId!);
    if (_globarRepo.user == null) {
      return signForJoin(context);
    } else {
      return _haveSubscribe == false
          ? _JoinRaffleButton(raffleId: raffle.raffleId ?? "")
          : watchRaffle(context);
    }
  }

  SlideAction signForJoin(BuildContext context) {
    return SlideAction(
      text: "Giriş yap",
      alignment: Alignment.bottomCenter,
      onSubmit: () {},
      outerColor: Theme.of(context).primaryColor,
    );
  }

  Widget watchRaffle(BuildContext context) {
    String? raffleNickName;
    final _subscribedRaffles = // Çekiliş isim kontrolü.
        getIt<GlobalRepository>().user?.subscribedRaffles;
    if (_subscribedRaffles != null) {
      for (MiniRaffleModel? item in _subscribedRaffles) {
        if (item?.raffleId == raffle.raffleId) {
          raffleNickName = item?.raffleNickName;
        }
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SlideAction(
          text: "Çekiliş izle",
          reversed: true,
          alignment: Alignment.bottomCenter,
          onSubmit: () {
            const _url = "https://pub.dev/packages/url_launcher"; // TEST MODE
            // const _url = "https://localhost/raffles/${raffle.raffleId}"; //PRODUCT MODE
            UrlLaucnherManager.launcHttp(_url).then((value) => !value
                ? PrintMessage.showFailed(context, "Bir hata oluştu")
                : null); //* TEST MODE
          },
          innerColor: Theme.of(context).primaryColor,
          outerColor: Theme.of(context).secondaryHeaderColor,
        ),
        Text("Çekiliş ismi:$raffleNickName")
      ],
    );
  }
}

class _JoinRaffleButton extends StatefulWidget {
  const _JoinRaffleButton({
    Key? key,
    required this.raffleId,
  }) : super(key: key);
  final String raffleId;
  @override
  State<_JoinRaffleButton> createState() => __JoinRaffleButtonState();
}

class __JoinRaffleButtonState extends State<_JoinRaffleButton> {
  late RewardedAdCubit _cubit;
  @override
  void initState() {
    _cubit = RewardedAdCubit(widget.raffleId);
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RewardedAdCubit, RewardedAdState>(
      buildWhen: (previous, current) => previous.status != current.status,
      bloc: _cubit,
      builder: (context, state) {
        if (state is RewardedAdReady) {
          return SlideAction(
            alignment: Alignment.bottomCenter,
            onSubmit: () {
              _cubit.showRewardedAd();
            },
            text: "Çekilişe katıl",
            innerColor: Theme.of(context).secondaryHeaderColor,
            outerColor: Theme.of(context).primaryColor,
          );
        } else if (state is RewardedAdFailed) {
          return const SizedBox();
        } else if (state is RewardedAdRewardSucces) {
          // PrintMessage.showSucces(context);
          return const _RewardSuccesWidget();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _RewardSuccesWidget extends StatelessWidget {
  const _RewardSuccesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          constraints: const BoxConstraints.expand(height: 60),
          child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(52),
              child: const Center(
                child: Text(
                  "Çekilişe Katıldın",
                  style: TextStyle(
                    color: Colors.green,
                    fontFamily: ConstFontName.inter,
                    fontSize: 24,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
