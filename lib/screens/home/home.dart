import 'package:app1/constants/routes.dart';
import 'package:app1/firebase_helper/firebase_firestore/firebase_firestore.dart';
import 'package:app1/models/category_model/category_model.dart';
import 'package:app1/models/product_model/product_model.dart';
import 'package:app1/provider/app_provider.dart';
import 'package:app1/screens/category_view/category_view.dart';
import 'package:app1/screens/product_details/product_details.dart';
import 'package:app1/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> productModelList = [];
  bool isLoading = false;

  @override
  void initState() {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.getUserInfoFirebase();
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    if (!mounted) return; // Check if the widget is still mounted

    setState(() {
      isLoading = true;
    });

    try {
      categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
      productModelList =
          await FirebaseFirestoreHelper.instance.getBestProduts();

      productModelList.shuffle();
    } catch (error) {
      print("Error fetching data: $error");
      // Handle the error appropriately, e.g., show a snackbar or display an error message.
    } finally {
      if (mounted) {
        // Check again before calling setState
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? Center(
                child: Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TopTitles(
                            title: "Shopify",
                            subtitle: "",
                          ),
                          TextFormField(
                            decoration:
                                const InputDecoration(hintText: "search ...."),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    categoriesList.isEmpty
                        ? const Center(
                            child: Text("Categories is empty"),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categoriesList
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          Routes.instance.push(
                                              widget: CategoryView(
                                                categoryModel: e,
                                              ),
                                              context: context);
                                        },
                                        child: Card(
                                          color: Colors.white,
                                          elevation: 3.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image.network(e.image),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 12.0, left: 12.0),
                      child: Text(
                        "Top Selling",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    productModelList.isEmpty
                        ? const Center(
                            child: Text("Top selling is empty"),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GridView.builder(
                              padding: const EdgeInsets.only(bottom: 50),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: productModelList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                childAspectRatio: 0.7,
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (ctx, index) {
                                ProductModel singleProduct =
                                    productModelList[index];
                                return Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 12.0,
                                      ),
                                      Image.network(
                                        singleProduct.image,
                                        height: 100,
                                        width: 100,
                                      ),
                                      const SizedBox(
                                        height: 12.0,
                                      ),
                                      Text(
                                        singleProduct.name,
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Price: \$${singleProduct.price}"),
                                      const SizedBox(
                                        height: 30.0,
                                      ),
                                      SizedBox(
                                        height: 45,
                                        width: 140,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            Routes.instance.push(
                                                widget: ProductDetails(
                                                  singleProduct: singleProduct,
                                                ),
                                                context: context);
                                          },
                                          child: const Text(
                                            "Buy",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                    const SizedBox(
                      height: 12.0,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

/* List<String> categoriesList = [
  "https://cdn-icons-png.flaticon.com/128/1785/1785375.png",
  "https://cdn-icons-png.flaticon.com/512/876/876245.png",
  "https://cdn-icons-png.flaticon.com/512/2793/2793884.png",
  "https://cdn-icons-png.flaticon.com/512/1291/1291386.png",
]; */
/* List<ProductModel> bestProducts = [
  ProductModel(
    image:
        "https://freepngimg.com/thumb/dress/31612-1-dress-transparent-picture.png",
    price: "100.00",
    id: "1",
    name: "Yellow dress ",
    description:
        "This is the newest fashion trend of dresses. This yellow dress is very good and has beautiful color.",
    status: "pending",
    isFavourite: false,
  ),
  ProductModel(
    image:
        "https://freepngimg.com/thumb/jeans/54011-8-baby-clothes-free-photo-png.png",
    price: "51.00",
    id: "2",
    name: "Baby overalls",
    description: "Best quality for you baby.",
    status: "pending",
    isFavourite: false,
  ),
  ProductModel(
    image: "https://freepngimg.com/thumb/jeans/25-jeans-png-image.png",
    price: "25.00",
    id: "3",
    name: "Women Blue jeans ",
    description: "Blue jeans for women best quality available.",
    status: "pending",
    isFavourite: false,
  ),
  ProductModel(
    image: "https://www.pngall.com/wp-content/uploads/4/Skirt-PNG-HD-Image.png",
    price: "60.00",
    id: "4",
    name: "burberry skirt",
    description: "Black short dress for women with chic look.",
    status: "pending",
    isFavourite: false,
  ),
]; */
