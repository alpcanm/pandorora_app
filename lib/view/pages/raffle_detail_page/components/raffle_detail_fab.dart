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
          ? joinRaffle(context)
          : watchRaffle(context);
    }
  }

  SlideAction joinRaffle(BuildContext context) {
    return SlideAction(
      alignment: Alignment.bottomCenter,
      onSubmit: () {
        getIt<RaffleRepository>()
            .subscribeARaffle(raffle.raffleId!, DateTime.now().millisecond)
            .then((_) {
          getIt<RaffleRepository>().myRaffles().then((e) {
            getIt<PaginationBloc>().add(
                const PaginationAllFetched(status: PaginationStatus.initial));
          });
        });
      },
      text: "Çekilişe katıl",
      innerColor: Theme.of(context).secondaryHeaderColor,
      outerColor: Theme.of(context).primaryColor,
    );
  }

  SlideAction signForJoin(BuildContext context) {
    return SlideAction(
      text: "Giriş yap",
      alignment: Alignment.bottomCenter,
      onSubmit: () {
        AdMobClass().showRewardedAd();
      },
      outerColor: Theme.of(context).primaryColor,
    );
  }

  SlideAction watchRaffle(BuildContext context) {
    return SlideAction(
      text: "Çekiliş izle",
      reversed: true,
      alignment: Alignment.bottomCenter,
      onSubmit: () {
        String uri =
            "https://localhost/raffles/${raffle.raffleId}"; // Product mode
        // String uri = "https://pub.dev/packages/url_launcher";    // Developer mode
        canLaunch(uri).then((value) async {
          if (value) {
            if (!await launch(uri)) {
              throw 'Could not launch $uri';
            }
          } else {
            PrintMessage.showFailed(context, "Bir hata oluştu");
          }
        });
      },
      innerColor: Theme.of(context).primaryColor,
      outerColor: Theme.of(context).secondaryHeaderColor,
    );
  }
}

class AdMobClass {
  AdMobClass() {
    _createRewardedAd();
  }

  static const AdRequest _request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  int _maxFailedLoadAttempts = 3;
  int _numRewardedLoadAttempts = 0;

  RewardedAd? _rewardedAd;

  void _createRewardedAd() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/5224354917'
            : 'ca-app-pub-3940256099942544/1712485313',
        request: _request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            _rewardedAd = ad;
            _numRewardedLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
            _rewardedAd = null;
            _numRewardedLoadAttempts += 1;
            if (_numRewardedLoadAttempts < _maxFailedLoadAttempts) {
              _createRewardedAd();
            }
          },
        ));
  }

  void showRewardedAd() {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
    });
    _rewardedAd = null;
  }

  close() {
    _rewardedAd?.dispose();
  }
}
