part of home_page;

class _MoreButton extends StatelessWidget {
  const _MoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = getIt<PaginationBloc>();
    return BlocBuilder(
      bloc: _bloc,
      builder: (context, PaginationState state) {
        return TextButton(
          onPressed: () {
            _bloc.add(PaginationAllFetched(filters: getIt<TagList>().filters));
          },
          child: const Text('Daha fazla'),
        );
      },
    );
  }
}
