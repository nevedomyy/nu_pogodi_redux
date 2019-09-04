import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'square.dart';
import 'checker.dart';
import 'redux.dart';
import 'info.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            button: TextStyle(color: Colors.black87, fontSize: 35.0, fontFamily: 'Caveat-Regular'),
            body1: TextStyle(color: Colors.black87, fontSize: 26.0, fontFamily: 'Caveat-Regular'),
            title: TextStyle(color: Colors.black87, fontSize: 45.0, fontFamily: 'Caveat-Regular')
          )
        ),
        home: NuPogodi(),
      ),
    );
  }
}

class NuPogodi extends StatefulWidget {
   @override
  _NuPogodiState createState() => _NuPogodiState();
}

class _NuPogodiState extends State<NuPogodi> {
  final List<int> _padding = [0,9,18,27];

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width-20)/5;
    double height = (MediaQuery.of(context).size.height-40-35)/7;
    double size = width > height ? height : width;
    return Container(
      color: Color(0xFFA8B5A3),
      child: SafeArea(
        child: Material(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StoreConnector<AppState, Function()>(
                    converter: (store) => () => store.dispatch(ActionReset()),
                    builder: (context, reset){
                      return GestureDetector(
                        onTap: () => reset(),
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text('Заново', style: Theme.of(context).textTheme.button),
                        ),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Info())),
                    child: Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Text('Информация', style: Theme.of(context).textTheme.button),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Wrap(
                    children: List.generate(31, (i){
                      return Padding(
                        padding: EdgeInsets.only(left: _padding.contains(i) ? size/2 : 0),
                        child: StoreConnector<AppState, Function(String data)>(
                          converter: (store) => (data) => store.dispatch(ActionMove(data, i)),
                          builder: (context, callback){
                            return DragTarget(
                              key: UniqueKey(),
                              builder: (context, List<String> candidateData, rejectedData){
                                return StoreConnector<AppState,List<bool>>(
                                  converter: (store) => store.state.state,
                                  builder: (context, engaged){
                                    return SizedBox.fromSize(
                                      size: Size.square(size),
                                      child: Stack(
                                        children: <Widget>[
                                          CustomPaint(
                                            size: Size.square(size),
                                            painter: BlueSquare(),
                                          ),
                                          engaged[i]!=null ? Align(
                                            alignment: Alignment.center,
                                            child: Draggable(
                                              data: i.toString()+'-'+engaged[i].toString(),
                                              child: CustomPaint(
                                                size: Size.square(size*0.8),
                                                painter: Checker(engaged[i]),
                                              ),
                                              feedback: CustomPaint(
                                                size: Size.square(size*0.8),
                                                painter: Checker(engaged[i]),
                                              ),
                                              childWhenDragging: Container(),
                                            ),
                                          ) : Container()
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              onWillAccept: (_) => true,
                              onAccept: (data) => callback(data)
                            );
                          },
                        )
                      );
                    }),
                  ),
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}
