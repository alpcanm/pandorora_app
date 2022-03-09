part of home_body;

class _HomeListViewBuilder extends StatelessWidget {
  const _HomeListViewBuilder({
    Key? key,
    required this.productList,
  }) : super(key: key);
  final List<Product> productList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final _currentProductCard = ProductCard(product: productList[index]);
        // 0. indexte filtreler ve _productCard var;
        if (index == 0) {
          return Column(children: [const _HomeFilters(), _currentProductCard]);
        } else if (index >= productList.length - 1) {
          //son indexte _productCard ve MoreButton var;
          return Column(children: [_currentProductCard, const _MoreButton()]);
        }
        return _currentProductCard;
      },
    );
  }
}

class _MoreButton extends StatelessWidget {
  const _MoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.read<HomeBloc>().add(HomeFetched());
        },
        child: const Text('Daha fazla'));
  }
}
