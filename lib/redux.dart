import 'package:redux/redux.dart';


class ActionMove{
  final objectData;
  final targetIndex;

  ActionMove(this.objectData, this.targetIndex);
}

class ActionReset{}

class AppState{
  final List<bool> _state;

  AppState(this._state);

  List<bool> get state => _state;
}

AppState reducer(AppState currentState, dynamic action){
  AppState newState(AppState currentState, ActionMove action){
    List<bool> list = List.from(currentState.state);
    List data = action.objectData.split('-');
    bool isRed = data[1]=='true' ? true : false;
    int old = int.parse(data[0]);
    int target = action.targetIndex;
    if(list[target] == null){
      if(target==old-5 || target==old-4){
        list[old] = null;
        list[target] = isRed;
      }
      if(isRed){
        if(target==old+5 || target==old+4 || target==old-1 || target==old+1){
          list[old] = null;
          list[target] = true;
        }
      }
    }
    return AppState(list);
  }

  if(action is ActionMove) return newState(currentState, action);
  if(action is ActionReset) return AppState(initialList);
  return currentState;
}

final store = Store<AppState>(
  reducer, 
  initialState: AppState(initialList)
);

final List<bool> initialList = List.generate(31, (i){
  switch(i){
    case 15: return true;
    case 24:
    case 27:
    case 28:
    case 29:
    case 30: return false;
    default: return null;
  }
});