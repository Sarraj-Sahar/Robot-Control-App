import './widgets.dart';

class DisplayData {
  String image;
  String description;
  ThemeButton? button;

  DisplayData({
    required this.image,
    required this.description,
    this.button,
  });
}

List<DisplayData> displayList = [
  DisplayData(
    description:
        "Lorem ipsum dolor sit amet,\nconsetetur sadipscing elitr, sed\n diam nonumy eirmod tempor\n invidunt ut labore et dolore magna",
    image: "assets/images/thief.png",
  ),
  DisplayData(
    description:
        "Lorem ipsum dolor sit amet,\nconsetetur sadipscing elitr, sed\n diam nonumy eirmod tempor\n invidunt ut labore et dolore magna",
    image: "assets/images/guard.png",
  ),
  DisplayData(
    description:
        "Lorem ipsum dolor sit amet,\nconsetetur sadipscing elitr, sed\n diam nonumy eirmod tempor\n invidunt ut labore et dolore magna",
    image: "assets/images/robot.png",
    button: ThemeButton(),
  ),
];
