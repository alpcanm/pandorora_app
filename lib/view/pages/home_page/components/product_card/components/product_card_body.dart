part of product_card;

class _ProductCardBody extends StatelessWidget {
  const _ProductCardBody({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 9,
      child: InkWell(
        onTap: () => context.router.push(ProductRoute(product: product)),
        child: Stack(
          children: [
            _PhotoStack(product: product),
            _BottomCardStack(product: product),
          ],
        ),
      ),
    );
  }
}

class _PhotoStack extends StatelessWidget {
  const _PhotoStack({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.network(
          product.photoURL ?? "",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}

class _BottomCardStack extends StatelessWidget {
  const _BottomCardStack({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: context.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 15,
                    child: Center(
                      child: Text(
                        product.title ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: CountDownArea(
                      dateTime: product.drawDate!.toDate,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
