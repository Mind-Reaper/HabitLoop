import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'habit_grid_box_model.dart';
export 'habit_grid_box_model.dart';

class HabitGridBoxWidget extends StatefulWidget {
  const HabitGridBoxWidget({
    super.key,
    required this.habit,
  });

  final HabitStruct? habit;

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
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
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
                    Icon(
                      Icons.description_rounded,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 30.0,
                    ),
                    Builder(
                      builder: (context) {
                        if (true) {
                          return FaIcon(
                            FontAwesomeIcons.solidCheckCircle,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          );
                        } else {
                          return FaIcon(
                            FontAwesomeIcons.circle,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              Text(
                'Document Title',
                maxLines: 1,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      font: GoogleFonts.fredoka(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                    ),
              ),
              Text(
                'This is a detailed description of the document that provides additional context and information.',
                maxLines: 1,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.nunito(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
            ].divide(SizedBox(height: 0.0)),
          ),
        ),
      ),
    );
  }
}
