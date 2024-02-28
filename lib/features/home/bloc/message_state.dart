import 'package:equatable/equatable.dart';
import 'package:temp_mail_app/features/domain/model/domain_model.dart';
import 'package:temp_mail_app/features/home/model/message_model.dart';

abstract class MessageState extends Equatable{}

class MessageInitState extends MessageState{
  @override
  List<Object?> get props => [];

}

class MessageLoadingState extends MessageState{
  @override
  List<Object?> get props => [];

}

class MessageDataLoadedState extends MessageState{
  MessageModel messageModel = MessageModel();
  MessageDataLoadedState(this.messageModel);

  @override
  List<Object?> get props => [messageModel];

}
class MessageEmptyState extends MessageState{

  @override
  List<Object?> get props => [];

}
class MessageErrorState extends MessageState{
  final String errorMessage;
  MessageErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];

}