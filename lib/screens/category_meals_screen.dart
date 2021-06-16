import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName='/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealScreen(this.categoryId,this.categoryTitle); 
 

  @override
  Widget build(BuildContext context) {
    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryTitle=routeArgs['title'];
    final categoryId=routeArgs['id'];
    final categorieMeal=DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);

    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body:  ListView.builder(itemBuilder: (ctx,index){
      return MealItem(title: categorieMeal[index].title, imageUrl: categorieMeal[index].imageUrl, duration: categorieMeal[index].duration, complexity: categorieMeal[index].complexity, affordability: categorieMeal[index].affordability);
        
      }, itemCount: categorieMeal.length,)

    );
  }
}