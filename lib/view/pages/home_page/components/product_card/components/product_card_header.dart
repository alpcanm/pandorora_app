part of product_card;

class _ProductCardHeader extends StatelessWidget {
  const _ProductCardHeader({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              product.tag ?? "",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: 14, color: Colors.yellow),
            ),
            Text(
              Checker.applyCheck(product.productId ?? "") ? "Katıldın" : "",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.yellow),
            )
          ],
        ),
      ),
    );
  }
}
