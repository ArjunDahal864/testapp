import 'dart:io';

import 'package:app/bloc/search/search_event.dart';
import 'package:app/bloc/search/search_state.dart';
import 'package:app/exception/exception.dart';
import 'package:app/model/noti.dart';
import 'package:app/repo/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepo notiRepo;
  List<Noti> noticeList;

  SearchBloc({this.notiRepo}) : super(NotSearched());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is FetchNotice) {
      yield Loading();
      try {
        noticeList = await notiRepo.searchNotice(event.query);
        yield Loaded(noti: noticeList);
      } on SocketException {
        yield SearchError(error: NoInternetException("No Internet"));
      } on HttpException {
        yield SearchError(error: NoServiceException("No Service Found"));
      } on FormatException {
        yield SearchError(error: InvalidFormatException("Invalid Format"));
      } catch (e) {
        yield SearchError(error: UnknownException("Unknown Error: $e"));
      }
    }else if (event is ResetSearch){
      yield NotSearched();
    }
  }
}
