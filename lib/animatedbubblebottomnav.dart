library animatedbubblebottomnav;

import 'dart:async';

import 'package:animatedbubblebottomnav/animations/AnimatedIndexedStack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_button/like_button.dart';
import 'package:animatedbubblebottomnav/animations/AnimatedIndexedStack.dart';
import 'package:animatedbubblebottomnav/Utils/constants.dart'  as Constants;

class BottomBar extends StatefulWidget {

  List<String> iconArray = [];
  List<Widget> screenArray = [];
  Color circleStartColor, circleEndColor, bubblePrimaryColor, bubbleSecondaryColor, bottomItemActiveColor, bottomItemInactiveColor;
  BottomBar({@required this.iconArray,@required this.screenArray,this.circleStartColor =  Colors.black,
    this.circleEndColor = Colors.black , this.bubblePrimaryColor = Colors.black,this.bubbleSecondaryColor = Colors.deepOrangeAccent,
    this.bottomItemActiveColor =Colors.deepOrangeAccent ,this.bottomItemInactiveColor = Constants.graisss});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin{

  int _index = 0;
  final _resumeDetectorKey = UniqueKey();
  AnimationController _controller;
  Animation<double> _frontScale;
  Animation<double> _backScale;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _frontScale = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
    ));
    _backScale = new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.5, 1.0, curve: Curves.easeOut),
    );
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> onLikeButtonTapped(bool isLiked,id) async{
    tap(id);
    return !isLiked;
  }
  Future<void> tap(index) async {
      Timer(Duration(seconds: 1), () {
        _controller.reverse();
        setState(() {
          _index = index;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      print('data '+_index.toString());
      if(_index == 0){
        SystemNavigator.pop();
      }else{
        this.setState((){
          _index=0;
        });
      }
    }

    return WillPopScope(
      onWillPop: ()=>_onWillPop(),
      child: Container(
        color: Colors.white,
        child: SafeArea(
          top: false,
          child: Scaffold(
            body:AnimatedIndexedStack(
              index: _index,
              children:  widget.screenArray,
            ),
            bottomNavigationBar:
               Container(
                color: Colors.white,
                height: 56,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(child: Center(child:
                      Container(
                        width: 36,
                        height: 36,
                        child:
                        LikeButton(
                          onTap: (bool isLiked) {
                            return onLikeButtonTapped(isLiked,0);
                          },
                          circleColor:
                          CircleColor(start: widget.circleStartColor, end: widget.circleEndColor),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: widget.bubblePrimaryColor,
                            dotSecondaryColor: widget.bubbleSecondaryColor,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    widget.iconArray[0],
                                    fit: BoxFit.fill,
                                    color:(_index ==0)? widget.bottomItemActiveColor:widget.bottomItemInactiveColor,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                      )),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(child: Center(child:
                      Container(
                        width: 36,
                        height: 36,
                        child:
                        LikeButton(
                          onTap: (bool isLiked) {
                            return onLikeButtonTapped(isLiked,1);
                          },
                          circleColor:
                          CircleColor(start: widget.circleStartColor, end: widget.circleEndColor),
                          bubblesColor: BubblesColor(
                          dotPrimaryColor: widget.bubblePrimaryColor,
                            dotSecondaryColor: widget.bubbleSecondaryColor,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                      widget.iconArray[1],
                                    fit: BoxFit.fill,
                                    color:(_index ==1)? widget.bottomItemActiveColor:widget.bottomItemInactiveColor,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        /*Image.asset(
                widget.router,
                fit: BoxFit.fill,
                color:(widget._current_index == widget._index)? widget.bottomItemActiveColor:widget.bottomItemInactiveColor,
              ),*/
                      )

                      )),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(child: Center(child:
                      Container(
                        width: 36,
                        height: 36,
                        child:
                        LikeButton(
                          onTap: (bool isLiked) {
                            return onLikeButtonTapped(isLiked,2);
                          },
                          circleColor:
                          CircleColor(start: widget.circleStartColor, end: widget.circleEndColor),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: widget.bubblePrimaryColor,
                            dotSecondaryColor: widget.bubbleSecondaryColor,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    widget.iconArray[2],
                                    fit: BoxFit.fill,
                                    color:(_index ==2)? widget.bottomItemActiveColor:widget.bottomItemInactiveColor,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        /*Image.asset(
                widget.router,
                fit: BoxFit.fill,
                color:(widget._current_index == widget._index)? widget.bottomItemActiveColor:widget.bottomItemInactiveColor,
              ),*/
                      )

                      )),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(child: Center(child:
                      Container(
                        width: 56,
                        height: 56,
                        child:
                        LikeButton(
                          size: 40,
                          onTap: (bool isLiked) {
                            return onLikeButtonTapped(isLiked,3);
                          },
                          circleColor:
                          CircleColor(start: widget.circleStartColor, end: widget.circleEndColor),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: widget.bubblePrimaryColor,
                            dotSecondaryColor: widget.bubbleSecondaryColor,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    widget.iconArray[3],
                                    fit: BoxFit.fill,
                                    color:(_index ==3)? widget.bottomItemActiveColor:widget.bottomItemInactiveColor,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )

                      )),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(child: Center(child:
                      Container(
                        width: 36,
                        height: 36,
                        child:
                        LikeButton(
                          onTap: (bool isLiked) {
                            return onLikeButtonTapped(isLiked,4);
                          },
                          circleColor:
                          CircleColor(start: widget.circleStartColor, end: widget.circleEndColor),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: widget.bubblePrimaryColor,
                            dotSecondaryColor: widget.bubbleSecondaryColor,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                    widget.iconArray[4],
                                    fit: BoxFit.fill,
                                    color:(_index ==4)? widget.bottomItemActiveColor:widget.bottomItemInactiveColor,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        /*Image.asset(
                widget.router,
                fit: BoxFit.fill,
                color:(widget._current_index == widget._index)? widget.bottomItemActiveColor:widget.bottomItemInactiveColor,
              ),*/
                      )

                      )),
                    ),
                  ],
                ),
              ),

          ),
        ),
      ),
    );

  }
}
