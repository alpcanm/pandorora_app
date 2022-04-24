import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pandorora_app/feature/repositories/global_repository.dart';

import '../../../../../core/utils/locator_get_it.dart';
import '../../../../../feature/repositories/raffle_repository.dart';
import '../../../home_page/bloc/pagination_bloc.dart';

part 'rewarded_ad_state.dart';

class RewardedAdCubit extends Cubit<RewardedAdState> {
  final String raffleId;
  RewardedAdCubit(
    this.raffleId,
  ) : super(const RewardedAdInitial(RewardedStatus.initial)) {
    _createRewardedAd();
  }

  static const AdRequest _request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  final int _maxFailedLoadAttempts =
      3; // Reklamı yüklemeyi kaç defa deneyeceğinin sayısı.
  int _numRewardedLoadAttempts = 0; // Kaçıncı yüklemede olduğunun sayısı

  RewardedAd? _rewardedAd;

  void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917', // test
      // adUnitId: 'ca-app-pub-5718318837539139/7245560855', // product
      request: _request,
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          print('$ad loaded.');
          _rewardedAd = ad;
          _numRewardedLoadAttempts = 0;
          emit(const RewardedAdReady(RewardedStatus.ready));
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('RewardedAd failed to load: $error');
          _rewardedAd = null;
          _numRewardedLoadAttempts += 1;
          if (_numRewardedLoadAttempts < _maxFailedLoadAttempts) {
            _createRewardedAd();
          }
          emit(const RewardedAdFailed(RewardedStatus.failed));
        },
      ),
    );
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
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createRewardedAd();
        emit(const RewardedAdFailed(RewardedStatus.failed));
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');

      emit(const RewardedAdRewardSucces(RewardedStatus.rewardSucces));
    });
    _rewardedAd = null;
  }

  @override
  Future<void> close() async {
    //TODO çekilişe katıldıktan sonra o çekilişe katıldığın
    //ismi yalnızca bu fonksyion ile güncelleyebiliyorsun.
    //Daha iyi bir çözüm bulunmalı!!
    await getIt<GlobalRepository>().tryGetCurrentUser();

    _rewardedAd?.dispose();
    return super.close();
  }

  void _onUserEarnedReward() {
    //! Feature Reklam izlendiğinde gerçekleştirilecek olan olaylar

    getIt<RaffleRepository>()
        .subscribeARaffle(
            raffleId, DateTime.now().millisecond) //* Çekilişe katılır.
        .then((_) {
      getIt<RaffleRepository>()
          .getSubscribedRaffles() //* Katıldığın çekilişleri getir. (çekilişe katıldığının güncellenmesi için)
          .then((e) {
        getIt<PaginationBloc>() //* Tüm çekilişleri tekrar getir. (güncellemelerin yansıması için.)
            .add(const PaginationAllFetched(status: PaginationStatus.initial));
      });
    });
  }
}
