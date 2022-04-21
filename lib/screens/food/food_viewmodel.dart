import '../../app/dependencies.dart';
import '../../models/food.dart';
import '../../services/food/food_service.dart';
import '../viewmodel.dart';

class FoodViewmodel extends Viewmodel {
  FoodService get _service => dependency();

  Food _food;

  get food => _food;
  set food(value) => _food = value;

  List<Food> foodList;
  FoodViewmodel() {
    getFoods();
  }

  void getFoods() async {
    turnBusy();
    foodList = await _service.getFoods();
    turnIdle();
  }
}
