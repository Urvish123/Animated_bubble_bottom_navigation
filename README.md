# animatedbubblebottomnav

Animated Bubble  Bottom Navigation 

## Getting Started

Add the plugin (pub coming soon):

```yaml
dependencies:
  ...
  animatedbubblebottomnav: ^0.0.1
```



## Basic Usage

Adding the widget
```dart
  @override
  Widget build(BuildContext context) {
    return BottomBar(
      iconArray: [ 'assets/images/icons/icon-home.png', 'assets/images/icons/icon-category.png',
        'assets/images/icons/icon-search.png', 'assets/images/icons/icon-cart.png','assets/images/icons/icon-user.png'],
      screenArray: [Home(),Category_(),Search(),Cart(),Profile()],
      /*bubblePrimaryColor: Colors.black87,
      bubbleSecondaryColor: Colors.deepOrange,
      circleEndColor: Colors.deepPurple,
      circleStartColor: Colors.green,*/
    );
  }
```