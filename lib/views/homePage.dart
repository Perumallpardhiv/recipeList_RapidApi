import "package:flutter/material.dart";
import "package:rapid_api/widgets/card.dart";

class homePage extends StatefulWidget {
  const homePage({key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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
      body: RecipeCard(
        title: "My Recipe",
        cookTime: "2 hrs",
        rating: "4.3",
        thumbnailUrl:
            "https://lh3.googleusercontent.com/rhMiiS2p6jCK_LhVbfYCb8FzW4ipzDk4xBEbphS3Hm0z7_ARb21ZpAb3SvqIvJfVRO6s5fEW07uw2mUgJtR4ayvMXA0r8xC4VBE",
      ),
    );
  }
}
