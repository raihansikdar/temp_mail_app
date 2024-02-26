import 'package:equatable/equatable.dart';
abstract class DomainEvent extends Equatable{}

class GetDomainData extends DomainEvent{

  @override
  List<Object?> get props => [];

}