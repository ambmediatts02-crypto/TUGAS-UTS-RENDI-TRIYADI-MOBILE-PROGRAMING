import 'package:flutter/material.dart';
import 'models.dart';

class DetailsPage extends StatelessWidget {
  final MountModel mount;

  DetailsPage(this.mount, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedItem = mount;

    ImageProvider bgImage = selectedItem.path.startsWith('assets')
        ? AssetImage(selectedItem.path)
        : NetworkImage(selectedItem.path);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: bgImage, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 30,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedItem.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          selectedItem.location,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    iconTheme: IconThemeData(color: Colors.white),
                    title: Center(
                      child: Icon(Icons.terrain, color: Colors.white, size: 40),
                    ),
                    actions: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.pending,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                DetailsRatingBar(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        child: Text(
                          'About ${selectedItem.name}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 20,
                        ),
                        child: Text(
                          '${selectedItem.description}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                DetailsBottomActions(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsRatingBar extends StatelessWidget {
  final Map<String, String> sampleRatingData = {
    'Rating': '4.6',
    'Price': '\$12',
    'Open': '24hrs',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          sampleRatingData.entries.length,
          (index) => Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  sampleRatingData.entries.elementAt(index).key,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  sampleRatingData.entries.elementAt(index).value,
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailsBottomActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(15),
              color: Colors.redAccent,
              child: InkWell(
                highlightColor: Colors.white.withOpacity(0.2),
                splashColor: Colors.white.withOpacity(0.2),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(21),
                  alignment: Alignment.center,
                  child: Text(
                    'Book Now',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              border: Border.all(color: Colors.redAccent, width: 2),
            ),
            child: Icon(Icons.turned_in_not, color: Colors.redAccent, size: 25),
          ),
        ],
      ),
    );
  }
}
