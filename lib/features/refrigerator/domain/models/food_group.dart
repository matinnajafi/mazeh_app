class FoodGroup {
  final String name;
  final String iconPath;

  const FoodGroup(this.name, this.iconPath);
}

const List<FoodGroup> foodGroups = [
  FoodGroup('پروتئین‌ها', 'images/protein.png'),
  FoodGroup('حبوبات و مغزها', 'images/beans.png'),
  FoodGroup('میوه و سبزیجات', 'images/fruits.png'),
  FoodGroup('غلات و نشاسته‌ها', 'images/grains.png'),
  FoodGroup('لبنیات', 'images/dairy.png'),
  FoodGroup('چربی‌ها و شیرینی‌ها', 'images/sweets.png'),
  FoodGroup('ادویه‌ها', 'images/spices.png'),
];
