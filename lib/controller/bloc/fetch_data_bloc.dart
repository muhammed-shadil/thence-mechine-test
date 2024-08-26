import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:thence_mechine_test/model/data_model.dart';
import 'package:thence_mechine_test/utils/api_repositary.dart/apirepositary.dart';
part 'fetch_data_event.dart';
part 'fetch_data_state.dart';

class FetchDataBloc extends Bloc<FetchDataEvent, FetchDataState> {
  FetchDataBloc() : super(FetchDataInitial()) {
    on<Fetchplantslist>(fetchplantslists);
  }
  Apirepository apirepository = Apirepository();
  FutureOr<void> fetchplantslists(
      Fetchplantslist event, Emitter<FetchDataState> emit) async {
    emit(loadingfetch());
    late Fetchdata fetchdatas;
    try {
      final Response response = await apirepository.homescreenRepository();

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        fetchdatas = Fetchdata.fromMap(result);
        emit(successfetch(data: fetchdatas));
      } else {
        emit(failurefetch("somthing went wrong"));
      }
    } catch (e) {
      emit(failurefetch(e.toString()));
    }
  }
}
