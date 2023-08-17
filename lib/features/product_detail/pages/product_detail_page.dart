import 'package:flutter/material.dart';
import 'package:product_assessment/features/product_detail/models/product_detail_model.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPage();
}

class _ProductDetailPage extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    final eventObject = ModalRoute.of(context)?.settings.arguments as ProductDetailModel;

    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text(""),
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              SizedBox(
                  child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(eventObject.imagePath),
              )),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          eventObject.name,
                          style: const TextStyle(
                              fontSize: 18, fontFamily: 'Graphik', fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${eventObject.price} THB",
                          style: const TextStyle(
                              fontSize: 18, fontFamily: 'Graphik', fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          eventObject.description,
                          style: const TextStyle(
                              fontSize: 12, fontFamily: 'Graphik', fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
