import '../../app/dependencies.dart';
import '../../models/food.dart';
import '../../services/food/food_service.dart';
import '../viewmodel.dart';

class FoodViewmodel extends Viewmodel {
  FoodService get _service => dependency();

  Food _food;
  // int _range = 0;

  // get range => _range;
  // set range(value) {
  //   turnBusy();
  //   _range = value;
  //   turnIdle();
  // }

  get food => _food;
  set food(value) => _food = value;

  List<Food> foodList;
  List<Food> _foodListLow = [];
  List<Food> _foodListHigh = [];
  List<Food> _foodListNormal = [];

  get foodListLow => _foodListLow;
  set foodListLow(value) => _foodListLow = value;

  get foodListHigh => _foodListHigh;
  set foodListHigh(value) => _foodListHigh = value;

  get foodListNormal => _foodListNormal;
  set foodListNormal(value) => _foodListNormal = value;

  FoodViewmodel() {
    getFoods();
  }

  void getFoods() async {
    turnBusy();
    foodList = await _service.getFoods();
    for (int i = 0; i < foodList.length; i++) {
      if (foodList[i].range == "low") {
        _foodListLow.add(foodList[i]);
      } else if (foodList[i].range == "normal") {
        _foodListNormal.add(foodList[i]);
      } else if (foodList[i].range == "high") {
        _foodListHigh.add(foodList[i]);
      }
    }
    turnIdle();
  }
}
