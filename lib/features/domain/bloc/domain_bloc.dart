import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail_app/features/domain/bloc/domain_event.dart';
import 'package:temp_mail_app/features/domain/bloc/domain_state.dart';

class DomainBloc extends Bloc<DomainEvent,DomainState>{
  DomainBloc():super(DomainInitState()){
    on<GetDomainData>((event, emit) {
       emit(DomainLoadingState());
       
    });
  }
}