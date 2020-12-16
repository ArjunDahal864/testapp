import 'package:app/model/noti.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class NoticeState extends Equatable{
  @override
  List<Object> get props => [];
}
class NoticeInitalState extends NoticeState {}
class NoticeLoading  extends NoticeState{}
class NoticeLoaded  extends NoticeState{
  final List<Noti> noti;
  NoticeLoaded({@required this.noti});
}

class NoticeError  extends NoticeState{
  final error;
  NoticeError({@required this.error});
}

