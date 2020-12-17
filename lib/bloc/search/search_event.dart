import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
class SearchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchNotice extends SearchEvent {
  final query;

  FetchNotice({@required this.query});

  @override
  List<Object> get props => [query];
}

class ResetSearch extends SearchEvent {}
