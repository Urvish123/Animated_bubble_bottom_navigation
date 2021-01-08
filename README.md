# animated_bubblebottom_nav

Animated Bubble  Bottom Navigation 



## Getting Started

Add the plugin (pub coming soon):

```yaml
dependencies:
  ...
  animated_bubblebottom_nav: ^0.0.3
```



## Basic Usage

Adding the widget
```dart
  @override
  Widget build(BuildContext context) {
    return BottomBar(
     //Array of icon which you want in bottom item.   #Required
      iconArray: [ 'assets/images/icons/icon-home.png', 'assets/images/icons/icon-category.png',
        'assets/images/icons/icon-search.png', 'assets/images/icons/icon-cart.png','assets/images/icons/icon-user.png'],
      //Array of Screen which you want open when bottom item clicked   #Required
      screenArray: [Home(),Category_(),Search(),Cart(),Profile()]
    );
  }
```

Change BottomItem color
there are two types of color we have one is bottomItemActiveColor & second is bottomItemInactiveColor
```dart
  @override
  Widget build(BuildContext context) {
    return BottomBar(
      iconArray: [ 'assets/images/icons/icon-home.png', 'assets/images/icons/icon-category.png',
        'assets/images/icons/icon-search.png', 'assets/images/icons/icon-cart.png','assets/images/icons/icon-user.png'],
      screenArray: [Home(),Category_(),Search(),Cart(),Profile()],
      bottomItemActiveColor: Colors.lightBlue,
      bottomItemInactiveColor: Colors.blueGrey.withOpacity(0.5),
    );
  }
```


Change color of bubble
there are two types of bubble we have that why we should put two color one is bubblePrimaryColor & second is bubbleSecondaryColor
```dart
  @override
  Widget build(BuildContext context) {
    return BottomBar(
      iconArray: [ 'assets/images/icons/icon-home.png', 'assets/images/icons/icon-category.png',
             'assets/images/icons/icon-search.png', 'assets/images/icons/icon-cart.png','assets/images/icons/icon-user.png'],
           screenArray: [Home(),Category_(),Search(),Cart(),Profile()],
           bubblePrimaryColor: Colors.black87,
           bubbleSecondaryColor: Colors.deepOrange,
    );
  }
```


Change color of circle
there are two types of circle we have that why we should put two color one is circleStartColor & second is circleEndColor
```dart
  @override
  Widget build(BuildContext context) {
    return BottomBar(
      iconArray: [ 'assets/images/icons/icon-home.png', 'assets/images/icons/icon-category.png',
        'assets/images/icons/icon-search.png', 'assets/images/icons/icon-cart.png','assets/images/icons/icon-user.png'],
      screenArray: [Home(),Category_(),Search(),Cart(),Profile()],
      circleEndColor: Colors.deepPurple,
      circleStartColor: Colors.green,
    );
  }
```