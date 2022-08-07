import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'RecipeView.dart';
import 'model.dart';
import 'search.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  List<RecipeModel> recipeList = <RecipeModel>[];
  TextEditingController searchController = TextEditingController();
  List<String> food = <String>[];

  List reciptCatList = [
    {
      "imgUrl":
          "https://media.istockphoto.com/photos/bowls-with-chow-mein-picture-id1038065454?k=20&m=1038065454&s=612x612&w=0&h=baT92wmd9olOGpkqvbFMI_6m2xSVOrNObx0URwiYupg=",
      "heading": "chinese"
    },
    {
      "imgUrl":
          "https://media.istockphoto.com/photos/vegetarian-soups-picture-id1310610720?b=1&k=20&m=1310610720&s=170667a&w=0&h=7f1FSzq3nDqq-74dTvWVsiWSGJcpMaEwPgf-Jstj3CA=",
      "heading": "French"
    },
    {
      "imgUrl":
          "https://media.istockphoto.com/photos/pasta-with-meatballs-and-parsley-picture-id160231786?k=20&m=160231786&s=612x612&w=0&h=nmA5rALCo5KugQFpeGEsPguYefbqLcpsEAwLOo0PGJw=",
      "heading": "Italian"
    },
    {
      "imgUrl":
          "https://thumbs.dreamstime.com/b/mexican-food-delicious-taco-shells-ground-beef-home-made-salsa-77872135.jpg",
      "heading": "mexican"
    },
    {
      "imgUrl":
          "https://media.istockphoto.com/photos/various-indian-dishes-featuring-rogan-josh-chicken-tikka-masala-picture-id1168659055?b=1&k=20&m=1168659055&s=170667a&w=0&h=sthRwqSWg1WSnr5xQbmCYC-Qd0WHjmVkrQvvc7ODeF0=",
      "heading": "Indian"
    },
    {
      "imgUrl":
          "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/dessert-main-image-molten-cake-0fbd4f2.jpg?quality=90&resize=768,574",
      "heading": "Dessert"
    },
    {
      "imgUrl":
          "https://media.istockphoto.com/photos/selection-of-american-food-picture-id931308812?k=20&m=931308812&s=612x612&w=0&h=Tudia4RSCvfpWZhli0ehScrzeCtbwvTqB9BZaCta_qA=",
      "heading": "Fast Food"
    },
    {
      "imgUrl":
          "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NHx8fGVufDB8fHx8&w=1000&q=80",
      "heading": "Chatpata"
    },
    {
      "imgUrl":
          "https://images.unsplash.com/photo-1551024709-8f23befc6f87?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGRyaW5rfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
      "heading": "Drinks"
    }
  ];
  getRecipes(String query) async {
    String url =
        "https://api.edamam.com/search?q=$query&app_id=e176fb08&app_key=447e37b8de98f08f6341d9b77700605a";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["hits"].forEach((element) {
        RecipeModel recipeModel = RecipeModel();
        recipeModel = RecipeModel.fromMap(element["recipe"]);
        recipeList.add(recipeModel);
        food.add(
            "https://thumbs.dreamstime.com/b/fast-food-menu-chicken-nuggets-hamburger-french-fries-33671451.jpg");
        food.add(
            "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80");
        food.add(
            "https://media.istockphoto.com/photos/cheeseburger-with-cola-and-french-fries-picture-id1154731746?k=20&m=1154731746&s=612x612&w=0&h=joDhpgUgTjtiYoPZtPH11PSjpyfAFPxZisz1ssj3YJ4=");
        food.add(
            "https://media.istockphoto.com/photos/delicious-panna-cotta-with-berries-picture-id182026106?k=20&m=182026106&s=612x612&w=0&h=-12CnyO0be_A88616ir0fAWV4Y6ay0WDzquv2crWSNU=");
        food.add(
            "https://media.istockphoto.com/photos/delisious-traditional-english-dessert-eton-mess-picture-id537467632?k=20&m=537467632&s=612x612&w=0&h=6WAxBJ75wAh1cX6dy3GfXF1A5pal0gFNrqmxo8hYeAg=");
        food.add(
            "https://media.istockphoto.com/photos/mousse-of-chocolate-picture-id615839726?k=20&m=615839726&s=612x612&w=0&h=CUwY0qFKjP7Qm0JCrqUsR_VG73Da7EE8uW3LWQT7EX0=");
        food.add(
            "https://media.istockphoto.com/photos/blueberry-ice-cream-popsicles-picture-id1256313433?k=20&m=1256313433&s=612x612&w=0&h=34NWWsI19uQ4V7ZbRRcMA7VdQQiBDcLlRERIOtRYmg8=");
        food.add(
            "https://images.unsplash.com/photo-1567639430132-a058446e6425?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&w=1000&q=80");
        food.add(
            "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80");
        food.add(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaFzPLiXkGj4OMnoi6RKr6n9FrnWnH-_6sOw&usqp=CAU");
        food.add(
            "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80");
        food.add("");
        food.add(
            "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80");
        setState(() {
          isLoading = false;
        });
        log(recipeList.toString());
      });
    });

    recipeList.forEach((Recipe) {
      print(Recipe.applabel);
      print(Recipe.appcalories);
    });
  }

  @override
  void initState() {
    super.initState();
    getRecipes("food");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://media.istockphoto.com/photos/culinary-background-with-traditional-ingredients-of-italian-cuisine-picture-id1278745986?k=20&m=1278745986&s=612x612&w=0&h=a0rvabf6vBWLwxYbBDSp2-nGrpp_jO96VHK9cd1GcTc="),
                  fit: BoxFit.cover),
              gradient: LinearGradient(
                  colors: [Color(0xff213A50), Color(0xff071938)]),
            ),
          ),

          /*
      * InWell - Tap,DoubleTaP,etc.
      * Gesture Detector
      *
      * Hover - Color
      * Tap - Splash
      *
      * Getsure -
      * Swipe,'
      *
      * Card - elevation background color,radius child
      *
      * ClipRRect - Frame - Photo Rectangle
      *
      * ClipPath - Custom CLips
      *
      * positioned  - Stack - topleft , top,down,left - 2.2
      *
      * */
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "CHATPATA KITCHEN",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                    ],
                  ),
                ),
                //Search Bar
                SafeArea(
                  child: Container(
                    //Search Wala Container

                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if ((searchController.text).replaceAll(" ", "") ==
                                "") {
                              print("Blank search");
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Search(searchController.text)));
                            }
                          },
                          child: Container(
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Let's check some recipes"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                      itemCount: reciptCatList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Search(
                                        reciptCatList[index]["heading"])));
                          },
                          child: Card(
                              margin: EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              elevation: 0.0,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(18.0),
                                      child: Image.network(
                                        reciptCatList[index]["imgUrl"],
                                        fit: BoxFit.cover,
                                        width: 200,
                                        height: 250,
                                      )),
                                  Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      top: 0,
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.black26),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                reciptCatList[index]["heading"],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 28),
                                              ),
                                            ],
                                          ))),
                                ],
                              )),
                        ));
                      }),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "TRY OUT OUR LATEST RECIPES!!",
                        style: TextStyle(fontSize: 33, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                    child: isLoading
                        ? CircularProgressIndicator()
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: recipeList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RecipeView(
                                              recipeList[index].appurl)));
                                },
                                child: Card(
                                  margin: const EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 0.0,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            food[index],
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: 200,
                                          )),
                                      Positioned(
                                          left: 0,
                                          right: 0,
                                          bottom: 0,
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.black26),
                                              child: Text(
                                                recipeList[index].applabel,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ))),
                                      Positioned(
                                        right: 0,
                                        height: 40,
                                        width: 80,
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10))),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.heart_broken,
                                                    size: 15,
                                                  ),
                                                  Text(recipeList[index]
                                                      .appcalories
                                                      .toString()
                                                      .substring(0, 6)),
                                                ],
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
