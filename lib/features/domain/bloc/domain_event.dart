import 'package:equatable/equatable.dart';
import 'package:temp_mail_app/features/domain/model/domain_model.dart';

abstract class DomainEvent extends Equatable{}

class GetDomainData extends DomainEvent{

  DomainModel domainModel = DomainModel();

  GetDomainData(this.domainModel);

  @override
  List<Object?> get props => [domainModel];

}