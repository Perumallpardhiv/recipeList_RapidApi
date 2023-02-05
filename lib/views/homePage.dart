import "package:flutter/material.dart";
import "package:rapid_api/models/recipe.dart";
import "package:rapid_api/models/recipeapi.dart";
import "package:rapid_api/widgets/card.dart";

class homePage extends StatefulWidget {
  const homePage({key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Recipe> _recipeList;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes1();
  }

  Future<void> getRecipes1() async {
    _recipeList = await RecipeApiClass.getRecipe();
    setState(() {
      isLoading = false;
    });
    print(_recipeList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.restaurant_menu,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Rapid API Recipe List",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
            itemCount: _recipeList.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                  title: _recipeList[index].name,
                  rating: _recipeList[index].rating.toString(),
                  cookTime: _recipeList[index].totalTime,
                  thumbnailUrl: _recipeList[index].images,
                );
              },
            ),
    );
  }
}
