import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calendar_date_box_model.dart';
export 'calendar_date_box_model.dart';

class CalendarDateBoxWidget extends StatefulWidget {
  const CalendarDateBoxWidget({
    super.key,
    required this.date,
    required this.selected,
  });

  final DateTime? date;
  final bool? selected;

  @override
  State<CalendarDateBoxWidget> createState() => _CalendarDateBoxWidgetState();
}

class _CalendarDateBoxWidgetState extends State<CalendarDateBoxWidget> {
  late CalendarDateBoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarDateBoxModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          FFAppState().selectedDate = widget.date;
          _model.updatePage(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            color: () {
              if (widget.selected!) {
                return FlutterFlowTheme.of(context).primaryText;
              } else if (functions.pastDate(widget.date!)) {
                return FlutterFlowTheme.of(context).secondary;
              } else {
                return FlutterFlowTheme.of(context).accent4;
              }
            }(),
            borderRadius: BorderRadius.circular(16.0),
          ),
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      dateTimeFormat("dd", widget.date),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.fredoka(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            color: () {
                              if (widget.selected!) {
                                return Colors.white;
                              } else if (functions.isSameDate(
                                  widget.date!, getCurrentTimestamp)) {
                                return FlutterFlowTheme.of(context).primary;
                              } else {
                                return FlutterFlowTheme.of(context).primaryText;
                              }
                            }(),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                  ),
                  Text(
                    dateTimeFormat("EEE", widget.date),
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                          font: GoogleFonts.nunito(
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                          ),
                          color: () {
                            if (widget.selected!) {
                              return Colors.white;
                            } else if (functions.isSameDate(
                                widget.date!, getCurrentTimestamp)) {
                              return FlutterFlowTheme.of(context).primary;
                            } else {
                              return FlutterFlowTheme.of(context).primaryText;
                            }
                          }(),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(context).bodySmall.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodySmall.fontStyle,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
