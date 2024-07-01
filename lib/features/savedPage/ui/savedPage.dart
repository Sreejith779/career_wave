import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portel/features/utils/texts.dart';

import '../bloc/saved_bloc.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SavedBloc()..add(SaveInitialEvent()),
      child: BlocBuilder<SavedBloc, SavedState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case SavedLoadingState:
              return Center(child: CircularProgressIndicator());

            case SavedLoadedState:
              final loadedState = state as SavedLoadedState;
              return Scaffold(
                appBar: AppBar(
                  title: Text("Saved Jobs"),
                ),
                body: Container(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, childAspectRatio: 3),
                      itemCount: loadedState.savedList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(loadedState.savedList[index].title,style:
                            Texts().Htext,),
                          subtitle: Text(loadedState.savedList[index].company,style:
                            Texts().Stext,),
                            leading: Image.network(loadedState.savedList[index].imageUrl),
                        );
                      }),
                ),
              );
          }
          return SizedBox();
        },
      ),
    );
  }
}
