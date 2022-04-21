import '../../models/food.dart';

abstract class FoodService {
  Future<List<Food>> getFoods();
}
