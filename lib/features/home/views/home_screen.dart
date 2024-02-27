import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temp_mail_app/common_widgets/body_header.dart';
import 'package:temp_mail_app/common_widgets/custom_appbar.dart';
import 'package:temp_mail_app/constants/app_colors.dart';
import 'package:temp_mail_app/constants/custom_size_extension.dart';
import 'package:temp_mail_app/features/home/bloc/message_bloc.dart';
import 'package:temp_mail_app/features/home/bloc/message_event.dart';
import 'package:temp_mail_app/features/home/bloc/message_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<MessageBloc>().add(GetMessageData());
    });
    return Scaffold(
      appBar: const CustomAppBar(leading: true, action: true,),
      body: SingleChildScrollView(
        child: BlocBuilder<MessageBloc, MessageState>(
          builder: (context, _messageState) {
            if (_messageState is MessageLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (_messageState is MessageDataLoadedState) {
              return Column(
                children: [
                  BodyHeader(
                    headerText: _messageState.messageModel.hydraMember?.first.to?.first.address ?? '',
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.rSp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.rSp,),
                        Text('Message', style: TextStyle(fontSize: 24.rSp, fontWeight: FontWeight.w600, color: AppColors.appBarColors),),
                        ListView.separated(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: EdgeInsets.all(16.rSp),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Form", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.appBarColors),),
                                    Text("name", style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("To", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.appBarColors),),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(height: 8.rSp,),
                        )
                      ],
                    ),
                  )
                ],
              );
            } else if (_messageState is MessageErrorState) {
              return Center(child: Text(_messageState.errorMessage));
            } else {

              return Container();
            }
          },
        ),
      ),
    );
  }
}
