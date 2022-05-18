import 'package:flutter/material.dart';

class TestUI extends StatelessWidget {
  const TestUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DraggableScrollableSheet'),
        ),
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyFloatingActionButton(),
                Text('A'),
                Text('b'),
                // Column(
                //   children: [
                //     Text('X'),
                //     Text('Y'),
                //     Text('Z'),
                //   ],
                // )
              ],
            ),
            DraggableScrollableSheet(
              minChildSize: 0.025,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  color: Colors.blue[100],
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text('Item $index'));
                    },
                  ),
                );
              },
            ),
          ],
        ));
  }
}

class MyFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "btn19",
      onPressed: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            isScrollControlled: false,
            isDismissible: true,
            backgroundColor: Colors.white,
            context: context,
            builder: (context) => Column(
                  children: [
                    Text('Header'),
                    Expanded(
                      child: ListView.builder(
                        // controller: scrollController,
                        itemCount: 25,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(title: Text('Item $index'));
                        },
                      ),
                    )
                  ],
                ));
      },
    );
  }
}
