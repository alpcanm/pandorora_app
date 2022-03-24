import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/countdown_cubit.dart';

class CountDownArea extends StatelessWidget {
  const CountDownArea({
    Key? key,
    required this.dateTime,
  }) : super(key: key);
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => CountdownCubit(dateTime),
      child: const _CountDown(),
    );
  }
}

class _CountDown extends StatelessWidget {
  const _CountDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cubit = context.read<CountdownCubit>();
    return GestureDetector(
      onTap: () => _cubit.setTime(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [_DayCard(), _HourCard(), _MinuteCard()],
      ),
    );
  }
}

class _DayCard extends StatelessWidget {
  const _DayCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountdownCubit, CountdownState>(
      buildWhen: (previous, current) => previous.day != current.day,
      builder: (context, state) {
        return _CountDownCard(state.day, 1);
      },
    );
  }
}

class _HourCard extends StatelessWidget {
  const _HourCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountdownCubit, CountdownState>(
      buildWhen: (previous, current) => previous.hour != current.hour,
      builder: (context, state) {
        return _CountDownCard(state.hour, 2);
      },
    );
  }
}

class _MinuteCard extends StatelessWidget {
  const _MinuteCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountdownCubit, CountdownState>(
      buildWhen: (previous, current) => previous.minute != current.minute,
      builder: (context, state) {
        return _CountDownCard(state.minute, 3);
      },
    );
  }
}

class _CountDownCard extends StatelessWidget {
  const _CountDownCard(
    this.text,
    this.timeKey, {
    Key? key,
  }) : super(key: key);
  final int text;
  final int timeKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Theme.of(context).primaryColor)),
          titleSelector(timeKey, context),
        ],
      ),
    );
  }

  Text titleSelector(int key, BuildContext context) {
    return Text(
      key == 1
          ? "Gün"
          : key == 2
              ? "Saat"
              : "Dakika",
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: Theme.of(context).primaryColor, fontSize: 9),
    );
  }
}
