import 'package:flutter/material.dart';
import 'package:vendor_pos/models/products_model.dart';
import 'package:vendor_pos/providers/cart_provider.dart';
import 'package:vendor_pos/providers/categories_provider.dart';
import 'package:vendor_pos/providers/products_provider.dart';
import 'package:vendor_pos/style/colors.dart';
import 'package:vendor_pos/widgets/molecules/custom_app_bar/custom_sliver_app_bar.dart';
import 'package:vendor_pos/widgets/organism/products_grid/products_grid.dart';
import 'package:vendor_pos/widgets/organism/shopping_cart/shopping_cart.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({key}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    Provider.of<ProductsProvider>(context, listen: false).fetchProducts();
    Provider.of<CategoriesProvider>(context, listen: false).fetchCategories();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      Provider.of<ProductsProvider>(context, listen: false).fetchProducts();
    }
  }

  void _handleProducts(String searchQuery) {
    Provider.of<ProductsProvider>(context, listen: false)
        .fetchProducts(searchQuery: searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    final ProductsProvider productsProvider =
        Provider.of<ProductsProvider>(context);
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final List<ProductsModel> _products = productsProvider.products;
    final categories = Provider.of<CategoriesProvider>(context).categories;
    int _selectedCategoryId = 0;

    final TextEditingController searchController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorTheme.backgroundColor,
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
                          _handleProducts(query);
                        });
                      },
                      onCategorySelected: (int) {},
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
                            productsData: _products,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/addNewProduct');
          },
          backgroundColor: ColorTheme.primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
