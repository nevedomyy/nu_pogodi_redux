import 'package:flutter/material.dart';


class Info extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFA8B5A3),
      child: SafeArea(
        child: Material(
          child: Column(
            children: <Widget>[
              Center(
                child: Text('Ну, погоди!', style: Theme.of(context).textTheme.title),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Настольная игра для двоих.\nПравила игры: волки (черные) могут передвигаться только вперед. Заяц (красный) может двигаться в любую сторону. Заяц побеждает, если ему удается пройти через цепь волков. Победу одерживают волки, если им удается остановить зайца - лишить его возможности передвижения.',
                  style: Theme.of(context).textTheme.body1
                ),
              ),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.asset(
                      'assets/info.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text('Закрыть', style: Theme.of(context).textTheme.button),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}