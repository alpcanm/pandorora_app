part of 'rewarded_ad_cubit.dart';

enum RewardedStatus { initial, ready, failed, rewardSucces }

abstract class RewardedAdState extends Equatable {
  const RewardedAdState(
    this.status,
  );
  final RewardedStatus status;
  @override
  List<Object> get props => [status];
}

class RewardedAdInitial extends RewardedAdState {
  const RewardedAdInitial(RewardedStatus status) : super(status);
}

class RewardedAdReady extends RewardedAdState {
  const RewardedAdReady(RewardedStatus status) : super(status);
}

class RewardedAdFailed extends RewardedAdState {
  const RewardedAdFailed(RewardedStatus status) : super(status);
}

class RewardedAdRewardSucces extends RewardedAdState {
  const RewardedAdRewardSucces(RewardedStatus status) : super(status);
}
