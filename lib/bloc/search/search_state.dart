import 'package:app/model/noti.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SearchState extends Equatable{
  @override
  List<Object> get props => [];
}


class NotSearched extends SearchState{

}

class Loading extends SearchState{

}

class Loaded extends SearchState{
  final List<Noti> noti;

  Loaded({@required this.noti});
}

class SearchError  extends SearchState{
  final error;
  SearchError({@required this.error});
}