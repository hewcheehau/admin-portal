import 'package:admin_portal/application/comment/bloc/comment_bloc.dart';
import 'package:admin_portal/infrastructure/core/app_extension.dart';
import 'package:admin_portal/presentation/common_widget.dart/app_loading_widget.dart';
import 'package:admin_portal/presentation/core/app_color.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _columnPadding = 20;

@RoutePage()
class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key, @PathParam("id") this.id = -1});
  final int? id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentBloc()..add(CommentListFetched(id: id ?? -1)),
      child: Scaffold(body: Center(
        child:
            BlocBuilder<CommentBloc, CommentState>(builder: (context, state) {
          if (state.status == CommentStatus.loading) {
            return const AppLoadingWidget();
          }
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  context.loc.comment.extralargeText,
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Table(
                          children: [
                            TableRow(
                                decoration:
                                    BoxDecoration(color: Colors.grey[300]),
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.all(_columnPadding),
                                    child: ("Post Id".toUpperCase()).customText(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.all(_columnPadding),
                                    child: ("Email".toUpperCase()).customText(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.all(_columnPadding),
                                    child: ("Title".toUpperCase()).customText(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.all(_columnPadding),
                                    child: ("Body".toUpperCase()).customText(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                            ...state.comments.map((e) => TableRow(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: AppColor.greyColor),
                                            bottom: BorderSide(
                                                color: Colors.grey))),
                                    children: [
                                      TableRowInkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              _columnPadding),
                                          child:
                                              (e.postId.toString()).mediumText,
                                        ),
                                      ),
                                      TableRowInkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              _columnPadding),
                                          child: (e.email ?? "").mediumText,
                                        ),
                                      ),
                                      TableRowInkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              _columnPadding),
                                          child: (e.name ?? "").mediumText,
                                        ),
                                      ),
                                      TableRowInkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(
                                              _columnPadding),
                                          child: (e.body ?? "").mediumText,
                                        ),
                                      )
                                    ]))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      )),
    );
  }
}
