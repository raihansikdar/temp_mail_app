import 'package:equatable/equatable.dart';
abstract class DomainEvent extends Equatable{
  const DomainEvent();
}

class GetDomainData extends DomainEvent{

  @override
  List<Object?> get props => [];

}