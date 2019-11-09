import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:referease/uiutility/colors.dart';              
              
              class getClipper extends CustomClipper<Path> {
                @override
                Path getClip(Size size) {
                  var path = new Path();
              
                  path.lineTo(0.0, size.height / 4);
                  path.lineTo(size.width + 415, 0.0);
                  path.close();
                  return path;
                }
              
                @override
                bool shouldReclip(CustomClipper<Path> oldClipper) {
                  // TODO: implement shouldReclip
                  return true;
                }
              }
              
              class ArcClipper extends CustomClipper<Path> {
                @override
                Path getClip(Size size) {
                  var path = new Path();
                  path.lineTo(0.0, size.height - 30);
              
                  var firstControlPoint = new Offset(size.width / 4, size.height);
                  var firstPoint = new Offset(size.width / 2, size.height);
                  path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
                      firstPoint.dx, firstPoint.dy);
              
                  var secondControlPoint =
                  new Offset(size.width - (size.width / 4), size.height);
                  var secondPoint = new Offset(size.width, size.height - 30);
                  path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
                      secondPoint.dx, secondPoint.dy);
              
                  path.lineTo(size.width, 0.0);
                  path.close();
              
                  return path;
                }
              
                @override
                bool shouldReclip(CustomClipper<Path> oldClipper) => false;
              }
              
              class ProfileBackground extends StatelessWidget{
              
                Widget topHalf(BuildContext context) {
                  var deviceSize = MediaQuery.of(context).size;
                  return new Flexible(
                    flex: 1,
                    child: ClipPath(
                      clipper: new ArcClipper(),
                      child: Stack(
                        children: <Widget>[
                          new Container(
                            decoration: new BoxDecoration(
                                  color: kReferPrimary,
                                ),
                          ),
                           new Center(
                            child:  Container(
              
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
              
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/pilebook.png"),
                                       // NetworkImage('https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                                        fit: BoxFit.cover),
                                  /*  borderRadius: BorderRadius.all(Radius.circular(75.0)),
                                    boxShadow: [
                                      BoxShadow(blurRadius: 7.0, color: kReferAltDarkGrey, spreadRadius: 3.0)
                                    ]))*/
              
              
              
                          )
                            ))
                        ],
                      ),
                    ),
                  );
                }
              
                final bottomHalf = new Flexible(
                  flex: 4,
                  child: new Container(),
                );
              
                @override
                Widget build(BuildContext context) {
                  // TODO: implement build
                  return new Column(
                    children: <Widget>[topHalf(context), bottomHalf],
                  );
                }
              }