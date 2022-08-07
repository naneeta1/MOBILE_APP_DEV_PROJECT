import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'RecipeView.dart';
import 'model.dart';
import 'package:http/http.dart';

class Search extends StatefulWidget {
  String query;
  Search(this.query);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isLoading = true;
  List<RecipeModel> recipeList = <RecipeModel>[];
  List<String> barfi = <String>[];
  List<String> cake = <String>[];
  TextEditingController searchController = TextEditingController();
  List reciptCatList = [
    {
      "imgUrl": "https://images.unsplash.com/photo-1593560704563-f176a2eb61db",
      "heading": "Chilli Food"
    },
    {
      "imgUrl": "https://images.unsplash.com/photo-1593560704563-f176a2eb61db",
      "heading": "Chilli Food"
    },
    {
      "imgUrl": "https://images.unsplash.com/photo-1593560704563-f176a2eb61db",
      "heading": "Chilli Food"
    },
    {
      "imgUrl": "https://images.unsplash.com/photo-1593560704563-f176a2eb61db",
      "heading": "Chilli Food"
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

        barfi.add(
            "https://thumbs.dreamstime.com/b/pistachio-barfi-five-pieces-nuts-dark-slate-77795261.jpg");
        barfi.add(
            "https://thumbs.dreamstime.com/z/indian-sweets-coconut-barfi-sweet-made-color-added-to-streets-hyderabad-34592029.jpg");
        barfi.add(
            "https://i1.wp.com/www.aywadeal.com/wp-content/uploads/2019/04/Barfi.jpg?fit=880%2C880&ssl=1");
        barfi.add(
            "https://thumbs.dreamstime.com/b/indian-sweets-mango-barfi-squares-traditional-sweet-made-coconut-condensed-milk-milk-powder-pulp-83341335.jpg");
        barfi.add(
            "https://thumbs.dreamstime.com/b/pineapple-barfi-delicious-fresh-unique-sweet-made-34192882.jpg");
        barfi.add(
            "https://thumbs.dreamstime.com/z/mango-barfi-indian-sweet-made-mango-pulp-condensed-milk-mawa-milk-powder-decorated-pistachio-shavings-163903755.jpg");

        barfi.add(
            "https://thumbs.dreamstime.com/b/lahori-barfi-delicious-fresh-unique-most-famous-pakistani-indian-peoples-34189004.jpg");
        barfi.add(
            "https://thumbs.dreamstime.com/b/lahori-barfi-delicious-fresh-unique-most-famous-pakistani-indian-peoples-34189004.jpg");
        barfi.add(
            "https://thumbs.dreamstime.com/z/indian-sweets-mango-kalakand-barfi-sweet-made-dairy-fruit-pulp-like-strawberry-chocolate-saffron-dry-fruits-garnished-83341332.jpg");
        barfi.add(
            "https://thumbs.dreamstime.com/b/indian-sweet-food-dryfruit-barfi-white-background-indian-sweet-dryfruit-barfi-also-know-as-cashew-barfi-mithai-barfee-mawa-158480037.jpg");
        barfi.add(
            "https://thumbs.dreamstime.com/z/indian-sweet-food-badam-barfi-indian-sweet-food-badam-barfi-also-know-as-mithai-barfee-mawa-barfi-mava-barfi-almond-sweet-khoya-158312474.jpg");

        cake.add(
            "https://images.unsplash.com/photo-1626263468007-a9e0cf83f1ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Y2hvY29sYXRlJTIwY2FrZXxlbnwwfHwwfHw%3D&w=1000&q=80");
        cake.add(
            "https://media.istockphoto.com/photos/delicious-slice-of-cake-picture-id1327828405?b=1&k=20&m=1327828405&s=170667a&w=0&h=un6DXk07yERDqDXeQnkzDdFLO99wekR0Fk5IWHwJtXI=");
        cake.add(
            "https://images.unsplash.com/photo-1605807646983-377bc5a76493?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8Y2hvY29sYXRlJTIwY2FrZXxlbnwwfHwwfHw%3D&w=1000&q=80");
        cake.add(
            "https://media.istockphoto.com/photos/peace-of-vegan-chocolate-davil-cake-on-grey-wooden-background-picture-id1251023015?k=20&m=1251023015&s=612x612&w=0&h=rGNgurojvxIDF8A5M4mEvKb101XF7ixpPIx0Q8wJaV0=");
        cake.add(
            "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-911517_11-e4e23bf.jpg");
        cake.add(
            "https://media.istockphoto.com/photos/dark-chocolate-cake-slice-picture-id1326149453?b=1&k=20&m=1326149453&s=170667a&w=0&h=AgWEe94Ti1abe2LjHTPW07UfNhEjyEgO0Qc3agvXKh4=");
        cake.add(
            "https://media.istockphoto.com/photos/chocolate-cake-with-chocolate-fudge-drizzled-icing-and-chocolate-picture-id478348860?k=20&m=478348860&s=612x612&w=0&h=NB6QXVUckdfLzkgpIkuqm1iGDNmEsBo3PsPfgVIXbGM=");

        cake.add(
            "https://images.unsplash.com/photo-1626263468007-a9e0cf83f1ac?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Y2hvY29sYXRlJTIwY2FrZXxlbnwwfHwwfHw%3D&w=1000&q=80");
        cake.add(
            "https://media.istockphoto.com/photos/cream-chocolate-cake-with-icing-on-white-background-picture-id467227928");
        cake.add(
            "https://media.istockphoto.com/photos/confectioner-decorating-chocolate-cake-closeup-picture-id1187830875?k=20&m=1187830875&s=612x612&w=0&h=LoRXyD8Jw9N-CfkKtXe23uHctZUetcH5zZFMwIzXapU=");
        cake.add(
            "https://media.istockphoto.com/photos/chocolate-cake-with-chocolate-fudge-drizzled-icing-and-chocolate-picture-id478348860?k=20&m=478348860&s=612x612&w=0&h=NB6QXVUckdfLzkgpIkuqm1iGDNmEsBo3PsPfgVIXbGM=");

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

    getRecipes(widget.query);
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Search(searchController.text)));
                            }
                          },
                          child: Container(
                            child: Icon(
                              Icons.search,
                              color: Colors.blueAccent,
                            ),
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Let's Cook Something!"),
                          ),
                        )
                      ],
                    ),
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
                                  margin: EdgeInsets.all(20),
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
                                            cake[index],
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
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ))),
                                      Positioned(
                                        right: 0,
                                        height: 40,
                                        width: 80,
                                        child: Container(
                                            decoration: BoxDecoration(
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
                                                    Icons.local_fire_department,
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
