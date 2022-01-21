import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';

class Carditems extends StatelessWidget {
  const Carditems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            mainAxisSpacing: 9.0,
            crossAxisCount: 2,
            mainAxisExtent: 210),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return buildCardItems();
        },
      ),
    );
  }

  Widget buildCardItems() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5)
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_box_outlined),
                  color: Colors.black,
                ),
              ],
            ),
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Stack(children: [
                Image.network(
                  "https://www.nicepng.com/png/detail/477-4773280_plain-tshirt-png-white-blank-t-shirts.png",
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '\$ 15',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 20,
                          width: 45,
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                TextUtils(
                                    clr: Colors.white,
                                    txt: '4.7',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                                Icon(
                                  Icons.star,
                                  size: 13,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
