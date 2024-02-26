import 'package:equatable/equatable.dart';
import 'package:temp_mail_app/features/domain/model/domain_model.dart';

abstract class DomainState extends Equatable{}

class DomainInitState extends DomainState{
  @override
  List<Object?> get props => [];

}

class DomainLoadingState extends DomainState{
  @override
  List<Object?> get props => [];

}

class DomainDataLoadedState extends DomainState{
  DomainModel domainModel = DomainModel();
  DomainDataLoadedState(this.domainModel);

  @override
  List<Object?> get props => [domainModel];

}

class DomainErrorState extends DomainState{
  final String errorMessage;
  DomainErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];

}