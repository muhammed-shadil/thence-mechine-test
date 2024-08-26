part of 'fetch_data_bloc.dart';

@immutable
sealed class FetchDataState {}

final class FetchDataInitial extends FetchDataState {}

class successfetch extends FetchDataState {
  final Fetchdata data;

  successfetch({required this.data});
}

class failurefetch extends FetchDataState {final String? message;

  failurefetch(this.message);}

class loadingfetch extends FetchDataState {}
