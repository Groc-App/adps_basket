// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'dart:math' as math;

// class ScratchRoughPage extends StatefulWidget {
//   final String imageurl;
//   final bool scratchCard;
//   ScratchRoughPage(this.imageurl, this.scratchCard);
//   @override
//   State<StatefulWidget> createState() {
//     return _ScratchRoughPageState();
//   }
// }

// class _ScratchRoughPageState extends State<ScratchRoughPage> {
//   bool isScratched = false;
  
//   get model => null;
//   @override
//   void initState() {
//     super.initState();
//   }

//   _buildScratchCard() {
//     return Center(
//       child: SizedBox(
//         width: 320.0,
//         height: 320.0,
//         child: Stack(
//           children: [
//             ScratchCard(
//               cover: widget.scratchCard == false ?
//                Stack(
//                       fit: StackFit.expand,
//                       children: <Widget>[
//                         Image.asset(
//                           'assets/images/scratch_image.jpg',
//                           height: 320.0,
//                           width: 320.0,
//                           repeat: ImageRepeat.repeat,
//                         ),
//                       ],
//                     )
//                   : null!,
//               reveal: Card(
//                 child: Container(
//                     margin: EdgeInsets.only(top: 30.0),
//                     child: GridTile(
//                         child: Column(
//                       children: <Widget>[
//                         Expanded(
//                           flex: 2,
//                           child: Image.asset(
//                             'assets/images/scratch_image.jpg',

//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         Expanded(
//                             flex: 1,
//                             child: Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 15.0),
//                                 child: Text(
//                                  "You won",
//                                   style: TextStyle(fontSize: 35.0),
//                                 ))),
//                         Expanded(
//                             flex: 1,
//                             child: Text(
//                               'Rs 5',
//                               style: TextStyle(fontSize: 30.0),
//                             )),
//                       ],
//                     ))),
//               ),
//               strokeWidth: 25.0,
//               finishPercent: 10,
//               onPanDown: () {
//                 setState(() {
//                   isScratched = true;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     updateDbIfCardScratched(model) {
//       print('update db');
//       widget. = isScratched;
//       widget.scratchCard.scratched == true
//           ? model.scratchCardRef
//               .document(widget.scratchCard.id)
//               .updateData({'scratched': true})
//           : '';
//     }

//     Future<bool> _willPopCallback(model) async {
//       updateDbIfCardScratched(model);
//       Navigator.pop(context);
//       return true;
//     }

//     return WillPopScope(
//         onWillPop: () {
//           _willPopCallback(model);
//         },
//         child: Scaffold(
//             appBar: AppBar(
//               elevation: 12.0,
//               backgroundColor: Colors.black87,
//               leading: IconButton(
//                 icon: Icon(
//                   Icons.clear,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {
//                   updateDbIfCardScratched(model);
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//             body: Material(
//                 elevation: 12.0,
//                 color: Colors.black87,
//                 child: Container(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       _buildScratchCard(),
//                       SizedBox(
//                         height: 10.0,
//                       )
//                     ],
//                   ),
//                 ))));
//   }
// }

// class ScratchCard extends StatefulWidget {
//   const ScratchCard({
//     required Key key,
//     required this.cover,
//     required this.reveal,
//     this.strokeWidth = 25.0,
//     required this.finishPercent,
//     required this.onPanDown,
//   }) : super(key: key);

//   final Widget cover;
//   final Widget reveal;
//   final double strokeWidth;
//   final int finishPercent;
//   final VoidCallback onPanDown;

//   @override
//   _ScratchCardState createState() => _ScratchCardState();
// }

// class _ScratchCardState extends State<ScratchCard> {
//   _ScratchData _data = _ScratchData();

//   Null _lastPoint = null;

//   Offset _globalToLocal(Offset global) {
//     return (context.findRenderObject() as RenderBox).globalToLocal(global);
//   }

//   double _distanceBetween(Offset point1, Offset point2) {
//     return math.sqrt(math.pow(point2.dx - point1.dx, 2) +
//         math.pow(point2.dy - point1.dy, 2));
//   }

//   double _angleBetween(Offset point1, Offset point2) {
//     return math.atan2(point2.dx - point1.dx, point2.dy - point1.dy);
//   }

//   void _onPanDown(DragDownDetails details) {
//     _lastPoint = _globalToLocal(details.globalPosition) as Null;
//   }

//   void _onPanUpdate(DragUpdateDetails details) {
//     final currentPoint = _globalToLocal(details.globalPosition);
//     var lastPoint = _lastPoint;
//     final distance = _distanceBetween(lastPoint, currentPoint);
//     var lastPoint2 = _lastPoint;
//     final angle = _angleBetween(lastPoint2, currentPoint);
//     for (double i = 0.0; i < distance; i++) {
//       _data.addPoint(Offset(
//         _lastPoint.dx + (math.sin(angle) * i),
//         _lastPoint.dy + (math.cos(angle) * i),
//       ));
//     }
//     _lastPoint = currentPoint as Null;
//   }

//   void _onPanEnd() {
//     final areaRect = context.size.width * context.size.height;
//     double touchArea = math.pi * widget.strokeWidth * widget.strokeWidth;
//     double areaRevealed =
//         _data._points.fold(0.0, (double prev, Offset point) => touchArea);
//     print('areaRect $areaRect $areaRevealed');
//     widget.onPanDown();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
//       onPanDown: _onPanDown,
//       onPanUpdate: _onPanUpdate,
//       onPanEnd: (_) {
//         _onPanEnd();
//       },
//       child: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           widget.reveal,
//           _ScratchCardLayout(
//             strokeWidth: widget.strokeWidth,
//             data: _data,
//             child: widget.cover,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ScratchCardLayout extends SingleChildRenderObjectWidget {
//   _ScratchCardLayout({
//     Key? key,
//     this.strokeWidth = 40.0,
//     required this.data,
//     required this.child,
//   }) : super(
//           key: key,
//           child: child,
//         );

//   final Widget child;
//   final double strokeWidth;
//   final _ScratchData data;

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     var child2 = null;
//     return _ScratchCardRender(
//       strokeWidth: strokeWidth,
//       data: data, child: child2, 
//     );
//   }

//   @override
//   void updateRenderObject(
//       BuildContext context, _ScratchCardRender renderObject) {
//     renderObject
//       ..strokeWidth = strokeWidth
//       ..data = data;
//   }
// }

// class _ScratchCardRender extends RenderProxyBox {
//   _ScratchCardRender({
//     required RenderBox child,
//     required double strokeWidth,
//     required _ScratchData data,
//   })  : assert(data != null),
//         _strokeWidth = strokeWidth,
//         _data = data,
//         super(child);

//   double _strokeWidth;
//   _ScratchData _data;

//   set strokeWidth(double strokeWidth) {
//     assert(strokeWidth != null);
//     if (_strokeWidth == strokeWidth) {
//       return;
//     }
//     _strokeWidth = strokeWidth;
//     markNeedsPaint();
//   }

//   set data(_ScratchData data) {
//     assert(data != null);
//     if (_data == data) {
//       return;
//     }
//     if (attached) {
//       _data.removeListener(markNeedsPaint);
//       data.addListener(markNeedsPaint);
//     }
//     _data = data;
//     markNeedsPaint();
//   }

//   @override
//   void attach(PipelineOwner owner) {
//     super.attach(owner);
//     _data.addListener(markNeedsPaint);
//   }

//   @override
//   void detach() {
//     _data.removeListener(markNeedsPaint);
//     super.detach();
//   }

//   @override
//   void paint(PaintingContext context, Offset offset) {
//     if (child != null) {
//       context.canvas.saveLayer(offset & size, Paint());
//       context.paintChild(child as RenderObject, offset);
//       Paint clear = Paint()..blendMode = BlendMode.clear;
//       _data._points.forEach((point) =>
//           context.canvas.drawCircle(offset + point, _strokeWidth, clear));
//       context.canvas.restore();
//     }
//   }

//   @override
//   bool get alwaysNeedsCompositing => child != null;
// }

// class _ScratchData extends ChangeNotifier {
//   List<Offset> _points = [];

//   void addPoint(Offset offset) {
//     _points.add(offset);
//     notifyListeners();
//   }
// }
