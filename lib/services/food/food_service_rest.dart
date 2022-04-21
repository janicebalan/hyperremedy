import '../../app/dependencies.dart';
import '../../models/food.dart';
import '../rest.dart';
import 'food_service.dart';

class FoodServiceRest implements FoodService {
  RestService get rest => dependency();

  Future<List<Food>> getFoods() async {
    final List listJson = await rest.get('foods');
    return listJson.map((json) => Food.fromJson(json)).toList();
  }
}
