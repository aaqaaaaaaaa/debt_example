import 'package:debt_example/config/constants/local_data.dart';
import 'package:debt_example/presentation/pages/home_page/data/models/debt_model.dart';

abstract class DebtRemoteDatasource {
  Future<List<DebtModel>> getDebtData();
}

class DebtRemoteDatasourceImpl implements DebtRemoteDatasource {
  @override
  Future<List<DebtModel>> getDebtData() async {
    List<DebtModel> list = [];
    try {
      for (int i = 0; i < jsonData.length; i++) {
        list.add(DebtModel.fromJson(jsonData[i]));
      }
      return list;
    } catch (e) {
      return [];
    }
  }
}
