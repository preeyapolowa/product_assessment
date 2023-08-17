import 'package:flutter/material.dart';
import 'package:product_assessment/features/product_detail/models/product_detail_model.dart';
import 'package:product_assessment/features/routes.dart';
import 'package:product_assessment/features/search_result/models/search_result_models.dart';
import 'package:product_assessment/mock_datas/product_mock.dart';
import 'package:product_assessment/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  final String filterButtonTitle = "ตัวกรอง";
  final String title = "ยินดีต้อนรับ คุณริว!";
  final String searchPlaceholder = "คุณกำลังมองหาสินค้าอะไร​? (รองรับเฉพาะภาษาไทย)";
  final String newTitle = "มีอะไรมาใหม่!";
  final String errorTitle = "มีบางอย่างผิดพลาด";
  final String errorDescription = "กรุณากรอกสิ่งที่ต้องการค้นหา";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> showAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            widget.errorTitle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(widget.errorDescription),
          actions: <Widget>[
            TextButton(
              child: const Text('ตกลง'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 12, top: 20),
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                        shadowColor: MaterialStateProperty.all(Colors.transparent),
                        backgroundColor: MaterialStateProperty.all(colorFromHex("#F05349")),
                        minimumSize: MaterialStateProperty.all(
                            const Size(0, 26)), // Adjust the height as needed
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 8)),
                      ),
                      onPressed: (() => {debugPrint("clicked filter button")}),
                      icon: const Icon(
                        Icons.filter_alt,
                        size: 20,
                        color: Colors.white,
                      ),
                      label: Text(widget.filterButtonTitle,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Graphik',
                              fontWeight: FontWeight.w500)),
                    ))),
            Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 26, fontFamily: 'Graphik', fontWeight: FontWeight.w600),
                )),
            Padding(
                padding: const EdgeInsets.only(left: 10, top: 20),
                child: TextField(
                  onSubmitted: ((value) {
                    if (value.isNotEmpty) {
                      Navigator.pushNamed(context, AppRoute.searchResultPage,
                          arguments: SearchResultModels(value));
                    } else {
                      showAlert();
                    }
                  }),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.grey,
                      ),
                      prefixIconConstraints: const BoxConstraints(minWidth: 30),
                      contentPadding: const EdgeInsets.only(bottom: 8),
                      hintText: widget.searchPlaceholder,
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'Graphik',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(Images.banner),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(children: [
                      Text(
                        widget.newTitle,
                        style: const TextStyle(
                            fontSize: 20, fontFamily: 'Graphik', fontWeight: FontWeight.w600),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: GestureDetector(
                            onTap: () {
                              final firstProduct = ProductMock.products[0];
                              Navigator.pushNamed(context, AppRoute.productDetailPage,
                                  arguments: ProductDetailModel(
                                      imagePath: firstProduct['image'],
                                      name: firstProduct['name'],
                                      price: firstProduct['price'],
                                      description: firstProduct['description']));
                            },
                            child: SizedBox(
                                width: 102,
                                height: 118,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.asset(Images.tshirt1),
                                )),
                          ))
                    ]))),
          ],
        ));
  }
}
