import 'package:flutter/material.dart';
import 'models.dart';
import 'details_page.dart';

final Color mainColor = Color(0xFFFF5656);

// ----- DATA -----
final List<MountModel> mountItems = [
  MountModel(
    path: 'assets/images/semeru.jpg',
    name: 'Mount Semeru',
    description:
        'Semeru, or Mount Semeru, is an active volcano in East Java, Indonesia. '
        'It is located in the subduction zone, where the Indo-Australia plate '
        'subducts under the Eurasia plate. It is the highest mountain on the '
        'island of Java.',
    location: 'East Java',
  ),
  MountModel(
    path: 'assets/images/merbabu.jpg',
    name: 'Mount Merbabu',
    description:
        'Mount Merbabu is a dormant stratovolcano in Central Java province on '
        'the Indonesian island of Java. The name Merbabu could be loosely '
        'translated as Mountain of Ash from the Javanese combined words; '
        'Meru means mountain and awu or abu means ash.',
    location: 'Central Java',
  ),
  MountModel(
    path: 'assets/images/maunaloa.jpg',
    name: 'Mauna Loa',
    description:
        'Mauna Loa is one of five volcanoes that form the Island of Hawaii in '
        'the U.S. state of Hawaii in the Pacific Ocean. The largest subaerial '
        'volcano in both mass and volume, Mauna Loa has historically been '
        'considered the largest volcano on Earth.',
    location: 'Hawaii',
  ),
  MountModel(
    path: 'assets/images/vesuvius.jpg',
    name: 'Mount Vesuvius',
    description:
        'Mount Vesuvius is a somma-stratovolcano located on the Gulf of Naples '
        'in Campania, Italy, about 9 km east of Naples and a short distance '
        'from the shore. It is one of several volcanoes which form the '
        'Campanian volcanic arc.',
    location: 'Italy',
  ),
  MountModel(
    path: 'assets/images/popocatepetl.jpg',
    name: 'Mount Popocatépetl',
    description:
        'Popocatépetl is an active stratovolcano located in the states of '
        'Puebla, Morelos, and Mexico in central Mexico. It lies in the eastern '
        'half of the Trans-Mexican volcanic belt. At 5,426 m it is the second '
        'highest peak in Mexico.',
    location: 'Mexico',
  ),
];

final List<CategoryModel> categories = [
  CategoryModel(category: 'Mountain', icon: Icons.terrain),
  CategoryModel(category: 'Forest', icon: Icons.park),
  CategoryModel(category: 'Beach', icon: Icons.beach_access),
  CategoryModel(category: 'Hiking', icon: Icons.directions_walk),
];

// ----- MAIN PAGE -----
class MountsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Icon(Icons.terrain, color: mainColor, size: 40),
        ),
        iconTheme: IconThemeData(color: mainColor),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppHeader(),
                    AppSearch(),
                    SizedBox(height: 150, child: AppMountListView()),
                    AppCategoryList(),
                  ],
                ),
              ),
            ),
            AppBottomBar(),
          ],
        ),
      ),
    );
  }
}

// ----- HEADER -----
class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/5081804?v=4',
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Rendi Triyadi',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Good Morning',
                style: TextStyle(color: mainColor, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ----- SEARCH -----
class AppSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text('Search', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ----- MOUNT LIST (CLICKABLE) -----
class AppMountListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mountItems.length,
      itemBuilder: (context, index) {
        final mount = mountItems[index];

        return InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailsPage(mount),
              ),
            );
          },
          child: Container(
            width: 150,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(mount.path),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mount.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  mount.location,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ----- CATEGORY -----
class AppCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Category', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(
                'See More',
                style: TextStyle(
                  color: mainColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (_, index) {
              final cat = categories[index];
              return Container(
                width: 100,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(cat.icon, color: mainColor),
                    SizedBox(height: 5),
                    Text(
                      cat.category,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// ----- BOTTOM BAR -----
class AppBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: mainColor),
          Icon(Icons.explore, color: Colors.grey),
          Icon(Icons.turned_in_not, color: Colors.grey),
          Icon(Icons.person_outline, color: Colors.grey),
        ],
      ),
    );
  }
}
