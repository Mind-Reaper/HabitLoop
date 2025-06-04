import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'habit_grid_box_model.dart';
export 'habit_grid_box_model.dart';

class HabitGridBoxWidget extends StatefulWidget {
  const HabitGridBoxWidget({
    super.key,
    required this.habit,
    required this.iconRef,
  });

  final HabitsRecord? habit;
  final DocumentReference? iconRef;

  @override
  State<HabitGridBoxWidget> createState() => _HabitGridBoxWidgetState();
}

class _HabitGridBoxWidgetState extends State<HabitGridBoxWidget> {
  late HabitGridBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HabitGridBoxModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<IconsRecord>(
      stream: IconsRecord.getDocument(widget.iconRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }

        final containerIconsRecord = snapshot.data!;

        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: valueOrDefault<Color>(
              containerIconsRecord.color,
              Colors.white,
            ),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).alternate,
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: SvgPicture.network(
                          valueOrDefault<String>(
                            containerIconsRecord.icon,
                            'https://picsum.photos/seed/369/600',
                          ),
                          width: 30.0,
                          height: 30.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                      StreamBuilder<List<CompletedHabitsRecord>>(
                        stream: queryCompletedHabitsRecord(
                          queryBuilder: (completedHabitsRecord) =>
                              completedHabitsRecord
                                  .where(
                                    'habitId',
                                    isEqualTo: widget.habit?.reference.id,
                                  )
                                  .where(
                                    'completedAt',
                                    isEqualTo: functions.dayFromDateTIme(
                                        FFAppState().selectedDate!),
                                  ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 24.0,
                                height: 24.0,
                                child: SpinKitDoubleBounce(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                              ),
                            );
                          }
                          List<CompletedHabitsRecord>
                              conditionalBuilderCompletedHabitsRecordList =
                              snapshot.data!;
                          final conditionalBuilderCompletedHabitsRecord =
                              conditionalBuilderCompletedHabitsRecordList
                                      .isNotEmpty
                                  ? conditionalBuilderCompletedHabitsRecordList
                                      .first
                                  : null;

                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (conditionalBuilderCompletedHabitsRecord !=
                                  null) {
                                await conditionalBuilderCompletedHabitsRecord
                                    .reference
                                    .delete();
                              } else {
                                await CompletedHabitsRecord.collection
                                    .doc()
                                    .set(createCompletedHabitsRecordData(
                                      habitId: widget.habit?.reference.id,
                                      completedAt: functions.dayFromDateTIme(
                                          FFAppState().selectedDate!),
                                      userId: currentUserUid,
                                    ));
                              }
                            },
                            child: Builder(
                              builder: (context) {
                                if (conditionalBuilderCompletedHabitsRecord !=
                                    null) {
                                  return FaIcon(
                                    FontAwesomeIcons.solidCheckCircle,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  );
                                } else {
                                  return FaIcon(
                                    FontAwesomeIcons.circle,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  );
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  valueOrDefault<String>(
                    widget.habit?.name,
                    '...',
                  ),
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .fontStyle,
                        ),
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                ),
                Text(
                  valueOrDefault<String>(
                    widget.habit?.description,
                    '......',
                  ),
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ].divide(SizedBox(height: 0.0)),
            ),
          ),
        );
      },
    );
  }
}
