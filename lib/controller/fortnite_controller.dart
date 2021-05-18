import 'package:stats_fortnite/model/fortnite_model.dart';
import 'package:stats_fortnite/repository/request_fortnite.dart';
import 'package:mobx/mobx.dart';
part 'fortnite_controller.g.dart';

class FortniteController = _FortniteControllerBase with _$FortniteController;

abstract class _FortniteControllerBase with Store {
  FortniteRequest fetchData = FortniteRequest();

  @observable
  FortniteModel data;

  @action
  _setData(FortniteModel value) {
    data = value;
  }

  @observable
  String nickName;

  @action
  bridgeNickName(String value) {
    nickName = value;
  }

  @observable
  String platform;

  @action
  setPlatform(String value) {
    platform = value;
  }

  Future<FortniteModel> setFetch() async {
    FortniteModel tempData =
        await fetchData.dataFortRequest(nickName, platform);
    return _setData(tempData);
  }

  matchType(String tempType) {
    String type;
    if (tempType == 'p10') {
      type = 'Duo';
      return type;
    } else if (tempType == 'p9') {
      type = 'Squad';
      return type;
    } else {
      type = 'Solo';
      return type;
    }
  }

  itsWin(int winOrLose) {
    String type;
    if (winOrLose == 0) {
      type = 'Defeat';
      return type;
    } else {
      type = 'Victory';
      return type;
    }
  }
}
