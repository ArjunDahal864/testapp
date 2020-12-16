import 'dart:io';

import 'package:app/bloc/notice/notice_event.dart';
import 'package:app/bloc/notice/notice_state.dart';
import 'package:app/exception/exception.dart';
import 'package:app/model/noti.dart';
import 'package:app/repo/repo.dart';
import 'package:bloc/bloc.dart';

class NoticeBloc extends Bloc<NoticeEvents, NoticeState> {
  final NoticeRepo notiRepo;
  List<Noti> noticeList;

  NoticeBloc({this.notiRepo}) : super(NoticeInitalState());

  @override
  Stream<NoticeState> mapEventToState(NoticeEvents event) async* {
    switch (event) {
      case NoticeEvents.fetchNotice:
        yield NoticeLoading();
        try {
          noticeList = await notiRepo.getNotices();
          yield NoticeLoaded(noti: noticeList);
        } on SocketException {
          yield NoticeError(error: NoInternetException("No Internet"));
        } on HttpException {
          yield NoticeError(error: NoServiceException("No Service Found") );
        } on FormatException {
          yield NoticeError(error: InvalidFormatException("Invalid Format") );
        } catch (e) {
          yield NoticeError(error: UnknownException("Unknown Error"));
        }
        break;
    }
  }
}
