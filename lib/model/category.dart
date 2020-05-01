class Category {
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((v) => new Category(v['name'], v['numOfCourses'], v['image']))
    .toList();

var categoriesData = [
  {
    "name": "Marketing",
    'numOfCourses': 17,
    'image': "assets/images/marketing.png"
  },
  {
    "name": "UX Design",
    'numOfCourses': 25,
    'image': "assets/images/ux_design.png"
  },
  {
    "name": "Photography",
    'numOfCourses': 13,
    'image': "assets/images/photography.png"
  },
  {
    "name": "Business",
    'numOfCourses': 17,
    'image': "assets/images/business.png"
  },
];
