import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/provider/cart.dart';
import 'package:shopapp/provider/products.dart';
import 'package:shopapp/screen/cart_screen.dart';
import 'package:shopapp/widget/app_drawer.dart';
import 'package:shopapp/widget/badge.dart';
import 'package:shopapp/widget/products_grid.dart';

enum FilterOptions { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    //Provider.of<Products>(context).fetchProducts();
//    Future.delayed(Duration.zero).then((value) {
//      Provider.of<Products>(context).fetchProducts();
//    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit)
      setState(() {
        _isLoading = true;
      });

    Provider.of<Products>(context).fetchProducts().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _isLoading = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('all'),
                value: FilterOptions.All,
              )
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              child: child,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(_showOnlyFavorites),
    );
  }
}
