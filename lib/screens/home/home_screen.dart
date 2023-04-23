import 'package:flutter/material.dart';
import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/providers/cart_provider.dart';
import 'package:vendor_pos/providers/categories_provider.dart';
import 'package:vendor_pos/providers/products_provider.dart';
import 'package:vendor_pos/screens/home/home_controller.dart';
import 'package:vendor_pos/style/colors.dart';
import 'package:vendor_pos/widgets/molecules/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:vendor_pos/widgets/organism/products_grid/products_grid.dart';
import 'package:vendor_pos/widgets/organism/shopping_cart/shopping_cart.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  HomeController _homeController = HomeController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(
        () => _homeController.onScroll(context, _scrollController));
    Provider.of<ProductsProvider>(context, listen: false).fetchProducts();
    Provider.of<CategoriesProvider>(context, listen: false).fetchCategories();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context);
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final List<ProductsModel> products = productsProvider.products;
    final categories = Provider.of<CategoriesProvider>(context).categories;
    final TextEditingController searchController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorTheme.backgroundColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/create-product');
          },
          child: Icon(Icons.add),
        ),
        body: Row(
          children: [
            Flexible(
              flex: 3,
              child: CustomScrollView(
                  controller: _scrollController,
                  slivers: <Widget>[
                    CustomSliverAppBar(
                      searchController: searchController,
                      categories: categories,
                      onSearch: (String query) {
                        setState(() {
                          _homeController.handleProducts(context, query);
                        });
                      },
                      onCategorySelected: (int index) {
                        setState(() {
                          _homeController.handleCategorySearch(
                              context, categories[index].id);
                        });
                      },
                    ),
                    const SliverToBoxAdapter(
                      child: Divider(),
                    ),
                    productsProvider.isLoading
                        ? const SliverFillRemaining(
                            child: Center(
                              child: CircularProgressIndicator(
                                color: ColorTheme.primaryColor,
                              ),
                            ),
                          )
                        : ProductsGrid(
                            productsData: products,
                            onAddToCart: cartProvider.addToCart,
                          ),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  final items = cartProvider.items;
                  final totalPrice = cartProvider.totalPrice;

                  return ShoppingCartWidget(
                    items: cartProvider.items,
                    totalPrice: cartProvider.totalPrice,
                    onIncrement: (index) => cartProvider
                        .incrementQuantity(cartProvider.items[index]),
                    onDecrement: (index) => cartProvider
                        .decrementQuantity(cartProvider.items[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
