#!/bin/sh

# Author:   David Acland - Moof IT
# Name:     setup_maya_2018.sh (Maya 2018)
# Full blog article relating to this script can be found here: https://www.moof-it.co.uk/technical/deploying-autodesk-maya-2018-and-suppressing-first-run-screens
#
# Purpose:  Maya 2018 initial setup script
# Supresses all first run popups for Autodesk Maya 2018
#
# Usage:    Run at login, once per user
# If you are running with Jamf Pro, replace $USER with $3
#
# Version 1.0.0, 2018-02-18
#   Initial Creation
#
# Use at your own risk.  Amsys will accept no responsibility for loss or damage
# caused by this script.

mkdir /Users/$USER/Adlm

cat << 'EOF' > "/Users/$USER/Adlm/AdlmUserSettings.xml"
<?xml version="1.0" encoding="UTF-8" standalone="yes" ?>
<AdlmSettings>
    <Section Name="PrivacyPolicyConsent">
        <Data Key="2018.0.0.F">1</Data>
    </Section>
</AdlmSettings>
EOF

mkdir -p /Users/$USER/Library/Preferences/Autodesk/maya/2018/prefs

cat << 'EOF' > "/Users/$USER/Library/Preferences/Autodesk/maya/2018/prefs/userPrefs.mel"
//Maya Preference 2018 (Release 1)
//
//
keyTangent -global -inTangentType auto -outTangentType auto -weightedTangents false;
animDisplay -refAnimCurvesEditable false;
constructionHistory -tgl on;

optionVar -version 3;
optionVar
 -iv "AEpopupWhenCreatingShaders" 1
 -iv "CB_IgnoreConfirmDelete" 0
 -iv "ChannelBox_ClearSelectionOnObjectSelectionChange" 0
 -sv "CreateNurbsCircleCtx" "createNurbsCircleCtx -e -image1 \"circle.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -normalType 2\n-normal 0 1 0 -sweep 360\n-degree 3\n-useTolerance 0\n-sections 8\n-toleranceType 1\n-tolerance 0.01\n-radius 1\n-attachToSections 1\n-doDragEdit 0\nCreateNurbsCircleCtx"
 -sv "CreateNurbsConeCtx" "createNurbsConeCtx -e -image1 \"cone.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -startSweep 0\n-endSweep 360\n-sections 8\n-spans 1\n-axisType 2\n-axis 0 1 0 -surfaceDegree 3\n-caps 1\n-extraTransformOnCaps 1\n-useTolerance 0\n-toleranceType 1\n-tolerance 0.01\n-radius 1\n-height 2\n-attachToSections 1\n-attachToSpans 1\n-attachToHeightRatio 1\n-doDragEdit 0\nCreateNurbsConeCtx"
 -sv "CreateNurbsCubeCtx" "createNurbsCubeCtx -e -image1 \"cube.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -uPatches 1\n-vPatches 1\n-axisType 2\n-axis 0 1 0 -surfaceDegree 3\n-width 1\n-depth 1\n-height 1\n-attachToPatchesU 1\n-attachToPatchesV 1\n-doDragEdit 0\nCreateNurbsCubeCtx"
 -sv "CreateNurbsCylinderCtx" "createNurbsCylinderCtx -e -image1 \"cylinder.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -startSweep 0\n-endSweep 360\n-sections 20\n-spans 1\n-axisType 2\n-axis 0 1 0 -surfaceDegree 3\n-caps 3\n-extraTransformOnCaps 1\n-useTolerance 0\n-toleranceType 1\n-tolerance 0.01\n-radius 1\n-height 2\n-attachToSections 1\n-attachToSpans 1\n-attachToHeightRatio 1\n-doDragEdit 0\nCreateNurbsCylinderCtx"
 -sv "CreateNurbsPlaneCtx" "createNurbsPlaneCtx -e -image1 \"plane.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -uPatches 1\n-vPatches 1\n-axisType 2\n-axis 0 1 0 -surfaceDegree 3\n-width 1\n-height 1\n-attachToPatchesU 1\n-attachToPatchesV 1\n-doDragEdit 0\nCreateNurbsPlaneCtx"
 -sv "CreateNurbsSphereCtx" "createNurbsSphereCtx -e -image1 \"sphere.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -axisType 2\n-axis 0 1 0 -startSweep 0\n-endSweep 360\n-degree 3\n-useTolerance 0\n-sections 8\n-spans 4\n-toleranceType 1\n-tolerance 0.01\n-radius 1\n-attachToSections 1\n-attachToSpans 1\n-attachToHeightRatio 1\n-doDragEdit 0\nCreateNurbsSphereCtx"
 -sv "CreateNurbsSquareCtx" "createNurbsSquareCtx -e -image1 \"square.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -spans 1\n-axisType 2\n-axis 0 1 0 -surfaceDegree 3\n-width 1\n-height 1\n-attachToSpans 1\n-doDragEdit 0\nCreateNurbsSquareCtx"
 -sv "CreateNurbsTorusCtx" "createNurbsTorusCtx -e -image1 \"torus.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -startSweep 0\n-endSweep 360\n-minorSweep 360\n-minorRadius 0.5\n-sections 8\n-spans 4\n-axisType 2\n-axis 0 1 0 -surfaceDegree 3\n-useTolerance 0\n-toleranceType 1\n-tolerance 0.01\n-radius 1\n-attachToSections 1\n-attachToSpans 1\n-attachToHeightRatio 1\n-doDragEdit 0\nCreateNurbsTorusCtx";
optionVar
 -sv "CreatePolyConeCtx" "createPolyConeCtx -e -image1 \"polyCone.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -subdivisionsWidth 20\n-subdivisionsHeight 1\n-subdivisionsDepth 0\n-radius 1\n-height 2\n-roundCap 0\n-createUVs 3\n-attachToSubdivisionsHeight 1\n-attachToSubdivisionsAxis 1\n-attachToSubdivisionsCap 1\n-axis 1\n-doSubdivisionsCapsEdit 0\n-doDragEdit 0\nCreatePolyConeCtx"
 -sv "CreatePolyCubeCtx" "createPolyCubeCtx -e -image1 \"polyCube.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -subdivisionsWidth 1\n-subdivisionsHeight 1\n-subdivisionsDepth 1\n-width 1\n-depth 1\n-height 1\n-createUVs 4\n-attachToSubdivisionsDepth 1\n-attachToSubdivisionsHeight 1\n-attachToSubdivisionsWidth 1\n-attachToSubdivisionsAll 1\n-axis 1\n-doSubdivisionsCapsEdit 0\n-doDragEdit 0\nCreatePolyCubeCtx"
 -sv "CreatePolyCylinderCtx" "createPolyCylinderCtx -e -image1 \"polyCylinder.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -subdivisionsAxis 20\n-subdivisionsHeight 1\n-subdivisionsCap 1\n-radius 1\n-height 2\n-roundCap 0\n-createUVs 3\n-attachToSubdivisionsHeight 1\n-attachToSubdivisionsAxis 1\n-attachToSubdivisionsCap 1\n-axis 1\n-doSubdivisionsCapsEdit 0\n-doDragEdit 0\nCreatePolyCylinderCtx"
 -sv "CreatePolyHelixCtx" "createPolyHelixCtx -e -image1 \"polyHelix.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -subdivisionsAxis 8\n-subdivisionsCoil 50\n-subdivisionsCap 0\n-roundCap 0\n-coils 3\n-height 2\n-width 2\n-radius 0.4\n-direction 1\n-createUVs 3\n-attachToSubdivisionsCoil 1\n-attachToSubdivisionsAxis 1\n-attachToSubdivisionsCap 1\n-attachToNumberCoils 1\n-attachToRadius 1\n-axis 1\n-doSubdivisionsCapsEdit 0\n-doDragEdit 0\nCreatePolyHelixCtx"
 -sv "CreatePolyPipeCtx" "createPolyPipeCtx -e -image1 \"polyPipe.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -subdivisionsAxis 20\n-subdivisionsHeight 1\n-subdivisionsCap 1\n-radius 1\n-height 2\n-thickness 0.5\n-roundCap 0\n-createUVs 1\n-attachToSubdivisionsHeight 1\n-attachToSubdivisionsAxis 1\n-attachToSubdivisionsCap 1\n-attachToThickness 1\n-axis 1\n-doSubdivisionsCapsEdit 0\n-doDragEdit 0\nCreatePolyPipeCtx"
 -sv "CreatePolyPlaneCtx" "createPolyPlaneCtx -e -image1 \"polyMesh.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -subdivisionsWidth 1\n-subdivisionsHeight 1\n-width 1\n-height 1\n-createUVs 2\n-attachToSubdivisionsHeight 1\n-attachToSubdivisionsWidth 1\n-attachToSubdivisionsAll 1\n-axis 1\n-doSubdivisionsCapsEdit 0\n-doDragEdit 0\nCreatePolyPlaneCtx"
 -sv "CreatePolyPlatonicSolidCtx" "createPolyPlatonicSolidCtx -e -image1 \"polySoccerBall.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -radius 1\n-sideLength 0.7137\n-solidType 0\n-createUVs 4\n-axis 1\n-doSubdivisionsCapsEdit 0\n-doDragEdit 0\nCreatePolyPlatonicSolidCtx"
 -sv "CreatePolyPrismCtx" "createPolyPrismCtx -e -image1 \"polyPrism.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -numberOfSides 3\n-subdivisionsHeight 1\n-subdivisionsCap 0\n-length 2\n-sideLength 1\n-createUVs 3\n-attachToSubdivisionsHeight 0\n-attachToSubdivisionsCap 0\n-attachToNumSides 0\n-axis 1\n-doSubdivisionsCapsEdit 0\n-doDragEdit 0\nCreatePolyPrismCtx"
 -sv "CreatePolyPyramidCtx" "createPolyPyramidCtx -e -image1 \"polyPyramid.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -subdivisionsHeight 1\n-subdivisionsDepth 0\n-sideLength 1\n-numberOfSides 4\n-createUVs 3\n-attachToSubdivisionsHeight 1\n-attachToSubdivisionsCap 1\n-axis 1\n-doSubdivisionsCapsEdit 0\n-doDragEdit 0\nCreatePolyPyramidCtx"
 -sv "CreatePolySoccerBallCtx" "createPolySoccerBallCtx -e -image1 \"polySoccerBall.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -radius 1\n-sideLength 0.4036\n-createUVs 4\n-axis 1\n-doSubdivisionsCapsEdit 0\n-doDragEdit 0\nCreatePolySoccerBallCtx";
optionVar
 -sv "CreatePolySphereCtx" "createPolySphereCtx -e -image1 \"polySphere.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -subdivisionsWidth 20\n-subdivisionsHeight 20\n-radius 1\n-createUVs 2\n-attachToSubdivisionsHeight 1\n-attachToSubdivisionsAxis 1\n-attachToSubdivisionsAll 1\n-axis 1\n-doSubdivisionsCapsEdit 0\n-doDragEdit 0\nCreatePolySphereCtx"
 -sv "CreatePolyTorusCtx" "createPolyTorusCtx -e -image1 \"polyTorus.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -subdivisionsWidth 20\n-subdivisionsHeight 20\n-radius 1\n-sectionRadius 0.5\n-twist 0\n-createUVs 1\n-attachToSubdivisionsHeight 1\n-attachToSubdivisionsAxis 1\n-attachToSectionRadius 1\n-axis 1\n-doSubdivisionsCapsEdit 0\n-doDragEdit 0\nCreatePolyTorusCtx"
 -iv "EEexprEdTextEditor" 1
 -sv "EditImageDir" ""
 -iv "FileDialogHideExtension" 1
 -iv "FileDialogStyle" 2
 -iv "HypershadeGridSnap" 0
 -iv "HypershadeGridVisibility" 0
 -iv "InExpertUIMode" 0
 -iv "LastStateChannelsLayersVisibility" 1;
optionVar
 -iv "LastStateCommandLineVisibility" 1
 -iv "LastStateHelpLineVisibility" 1
 -iv "LastStateLayersVisibility" 0
 -iv "LastStateOutlinerVisibility" 0
 -iv "LastStatePlaybackRangeVisibility" 1
 -iv "LastStateShelfVisibility" 1
 -iv "LastStateStatusLineVisibility" 1
 -iv "LastStateTimeSliderVisibility" 1
 -iv "LastStateToolboxVisibility" 1
 -ca "MT_activeManipColor"
 -fva "MT_activeManipColor" 1
 -fva "MT_activeManipColor" 1
 -fva "MT_activeManipColor" 0;
optionVar
 -iv "MT_autoloadTextures" 0
 -sv "MT_compModeCustCmd" ""
 -ca "MT_dynamicHUDColor"
 -fva "MT_dynamicHUDColor" 1
 -fva "MT_dynamicHUDColor" 1
 -fva "MT_dynamicHUDColor" 1
 -iv "MT_freeRotate" 1
 -fv "MT_highlightOpacity" 100
 -ca "MT_hiliteColorAdd"
 -fva "MT_hiliteColorAdd" 0
 -fva "MT_hiliteColorAdd" 1
 -fva "MT_hiliteColorAdd" 0
 -ca "MT_hiliteColorCutEdge"
 -fva "MT_hiliteColorCutEdge" 0
 -fva "MT_hiliteColorCutEdge" 0
 -fva "MT_hiliteColorCutEdge" 1
 -fva "MT_hiliteColorCutEdge" 1
 -ca "MT_hiliteColorCutFace"
 -fva "MT_hiliteColorCutFace" 1
 -fva "MT_hiliteColorCutFace" 1
 -fva "MT_hiliteColorCutFace" 1
 -fva "MT_hiliteColorCutFace" 1
 -ca "MT_hiliteColorCutLine"
 -fva "MT_hiliteColorCutLine" 1
 -fva "MT_hiliteColorCutLine" 0.5
 -fva "MT_hiliteColorCutLine" 0
 -fva "MT_hiliteColorCutLine" 1
 -ca "MT_hiliteColorCutVert"
 -fva "MT_hiliteColorCutVert" 1
 -fva "MT_hiliteColorCutVert" 1
 -fva "MT_hiliteColorCutVert" 0
 -fva "MT_hiliteColorCutVert" 1;
optionVar
 -ca "MT_hiliteColorSubtract"
 -fva "MT_hiliteColorSubtract" 1
 -fva "MT_hiliteColorSubtract" 1
 -fva "MT_hiliteColorSubtract" 0
 -fv "MT_hiliteTransparency" 100
 -iv "MT_hudShowCoordSpace" 0
 -iv "MT_hudShowMode" 0
 -fv "MT_manipPickRange" 4
 -ca "MT_paintColorAdd"
 -fva "MT_paintColorAdd" 0
 -fva "MT_paintColorAdd" 1
 -fva "MT_paintColorAdd" 0
 -ca "MT_paintColorSubtract"
 -fva "MT_paintColorSubtract" 1
 -fva "MT_paintColorSubtract" 1
 -fva "MT_paintColorSubtract" 0
 -iv "MT_planeHandleOffset" 100
 -iv "MT_preSelectSize" 16
 -iv "MT_prohibitNegativeScale" 1;
optionVar
 -iv "MT_qdControlModifierKeys" 3
 -iv "MT_qdControlShiftModifierKeys" 4
 -iv "MT_qdNoModifierKeys" 1
 -iv "MT_qdShiftModifierKeys" 2
 -iv "MT_qdTabModifierKeys" 5
 -iv "MT_quaDrawMmbWeld" 1
 -iv "MT_refreshActiveOnly" 0
 -iv "MT_resetManipOnSelChange" 0
 -iv "MT_resetManipOnToolSwitch" 0
 -iv "MT_selectDeadSpaceRange" 4;
optionVar
 -iv "MT_shiftCtrlSlide" 2
 -iv "MT_shiftSlide" 0
 -iv "MT_showDynamicHUD" 1
 -iv "MT_tweakDeadSpaceRange" 120
 -iv "MT_useCompModeCustCmd" 0
 -sv "Move" "manipMoveContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -mode 2\n-activeHandle 3\n-currentActiveHandle 3\n-orientAxes 0 0 0 -interactiveUpdate 1\n-activeHandleNormal 2\n-preserveChildPosition 0\n-preserveUV 0\n-pinPivot 0\n-pivotOriHandle 1\n-snapPivotPos 1\n-snapPivotOri 1\n-xformConstraint \"none\" -constrainAlongNormal 1\n-orientJointEnabled 0\n-orientJoint \"xyz\" -secondaryAxisOrient \"yup\" -snap 0\n-snapRelative 0\n-snapValue 1\n-snapComponentsRelative 1\n-snapLiveFaceCenter 0\n-snapLivePoint 0\n-editPivotMode 0\n-tweakMode 0\nMove"
 -sv "MoveLimits" "manipMoveLimitsCtx -e -image1 \"moveLimits.xpm\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" MoveLimits"
 -sv "MoveNormal" "manipMoveContext -e -image1 \"moveNormal.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -mode 3\n-activeHandle 3\n-currentActiveHandle 3\n-orientAxes 0 0 0 -interactiveUpdate 1\n-activeHandleNormal 2\n-preserveChildPosition 0\n-preserveUV 0\n-pinPivot 0\n-pivotOriHandle 1\n-snapPivotPos 1\n-snapPivotOri 1\n-xformConstraint \"none\" -constrainAlongNormal 1\n-orientJointEnabled 0\n-orientJoint \"xyz\" -secondaryAxisOrient \"yup\" -snap 0\n-snapRelative 0\n-snapValue 1\n-snapComponentsRelative 1\n-snapLiveFaceCenter 0\n-snapLivePoint 0\n-editPivotMode 0\n-tweakMode 0\nMoveNormal"
 -sv "NEGlobalView" "NEDefault"
 -sv "PanZoomContext" "panZoomCtx -e -image1 \"camPanZoom.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 1\n-toolName \"2D Pan/Zoom Tool\" -zoomScale 1\nPanZoomContext";
optionVar
 -sv "PhotoshopDir" ""
 -sv "PlayblastCmdAvi" ""
 -sv "PlayblastCmdFormatAvi" ""
 -sv "PlayblastCmdFormatQuicktime" ""
 -sv "PlayblastCmdQuicktime" ""
 -sv "PolyCutUVCtx" "polyCutUVCtx -e -image1 \"CutSewUVTool.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -steadyStrokeDistance 4\n-steadyStroke 0\n-symmetry 1\n-showCheckerMap 0\n-showTextureBorders 1\n-mapBordersColor 1 1 1 -showUVShellColoring 1\n-loopSpeed 1\nPolyCutUVCtx"
 -iv "PolySelectEditSplitRingAbsolute" 0
 -sv "PolyTexShortestPath" "texSelectShortestPathCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" PolyTexShortestPath"
 -sv "PolyViewPortShortestPath" "polyShortestPathCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" PolyViewPortShortestPath"
 -iv "PreserveComponentSelections" 1;
optionVar
 -sv "PropMod" "propModCtx -e -image1 \"propMod.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -type 1\n-linear -0.1\n-linearParam 0.5 0.5 -powerCutoff 10\n-powerDegree 3\n-direction 1 1 1 -worldspace 1\n-powerCutoffParam 0.5 0.5 -powerDegreeParam 3\n-animCurveFalloff 1 1 PropMod"
 -iv "RecentBackupsMaxSize" 4
 -iv "RecentFilesMaxSize" 10
 -iv "RecentProjectsMaxSize" 10
 -iv "ResetModelViewsOnNewScene" 1
 -sv "Rotate" "manipRotateContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -mode 0\n-activeHandle 3\n-currentActiveHandle 3\n-orientAxes 0 0 0 -preserveChildPosition 0\n-preserveUV 0\n-pinPivot 0\n-pivotOriHandle 1\n-snapPivotPos 1\n-snapPivotOri 1\n-xformConstraint \"none\" -constrainAlongNormal 1\n-snap 0\n-snapRelative 0\n-snapValue 15\n-useObjectPivot 0\n-useManipPivot 0\n-useCenterPivot 0\n-centerTrackball 1\n-editPivotMode 0\n-tweakMode 0\n-modifyTranslation 0\nRotate"
 -sv "RotateLimits" "manipRotateLimitsCtx -e -image1 \"rotateLimits.xpm\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" RotateLimits"
 -sv "Scale" "manipScaleContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -mode 0\n-activeHandle 3\n-currentActiveHandle 3\n-orientAxes 0 0 0 -preserveChildPosition 0\n-preserveUV 0\n-pinPivot 0\n-pivotOriHandle 1\n-snapPivotPos 1\n-snapPivotOri 1\n-xformConstraint \"none\" -constrainAlongNormal 1\n-snap 0\n-snapRelative 0\n-snapValue 1\n-useObjectPivot 0\n-useManipPivot 0\n-editPivotMode 0\n-tweakMode 0\n-preventNegativeScale 1\nScale"
 -sv "ScaleLimits" "manipScaleLimitsCtx -e -image1 \"scaleLimits.xpm\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" ScaleLimits"
 -sv "SelectLasso" "lassoContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -drawClosed 1\n-fastComponents 1\nSelectLasso";
optionVar
 -iv "ShowExtrudeAttributeViewportSliders" 1
 -sv "SoftSelectOptionsContext" "softSelectOptionsCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -enabled 0\n-size 5\n-uvSize 0.5\n-falloffCurve \"0,1,2,1,0,2\" -enableFalseColor 1\n-colorCurve \"1,1,0,1,1,1,0,0,0.5,1,0,0,0,0,1\" -falloffMode 0\nSoftSelectOptionsContext"
 -sv "SubstanceEnginePath" "/libsubstance_sse2_blend.1.dylib"
 -sv "TextureLasso" "textureLassoContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -drawClosed 1\nTextureLasso"
 -iv "TrackSelectionOrder" 0
 -sv "Transform" "srtContext -e -image1 \"srt.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" Transform"
 -sv "ViewImageCmdFormat" ""
 -sv "ViewImageDir" ""
 -sv "ViewSequenceCmdFormat" ""
 -sv "ViewSequenceDir" "";
optionVar
 -ca "activeAEShowFilterStates"
 -iva "activeAEShowFilterStates" 1
 -iva "activeAEShowFilterStates" 0
 -ca "activeAEShowFilterTypes"
 -sva "activeAEShowFilterTypes" ""
 -sva "activeAEShowFilterTypes" "typeAdjust"
 -iv "activeObjectPivots" 0
 -sv "alignToolCtx" "alignCtx -e -image1 \"alignTool.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -anchorFirstObject 0\n-showAlignTouch 1\nalignToolCtx"
 -iv "allowMenusInPanels" 1
 -iv "animBlendBrokenInputOpt" 1
 -iv "animBlendingOpt" 1
 -iv "animEdCadenceLineType" 1
 -iv "animLayerButtonsOnRight" 0
 -iv "animLayerDefaultPassthroughMode" 1;
optionVar
 -iv "animLayerDefaultRotationMode" 0
 -iv "animLayerDefaultScaleMode" 1
 -iv "animLayerFilterActive" 0
 -iv "animLayerFilterOptions" 1
 -iv "animLayerGhostOption" 1
 -iv "animLayerLockCurves" 1
 -iv "animLayerMuteLock" 1
 -iv "animLayerReverseLayerStack" 1
 -iv "animLayerSelectOnCollapse" 1
 -iv "animLayerSelectionKey" 1;
optionVar
 -iv "animateRoll" 0
 -iv "animateRollFitAll" 0
 -iv "animateRollGotoBookmark" 0
 -iv "animateRollNextLastCameraView" 0
 -iv "animateRollViewCompass" 1
 -iv "animationDetailsVisibility" 0
 -iv "apiPrefLazyLoading" 0
 -iv "apiPrefOldPluginWarning" 1
 -sv "arcLenDimContext" "arcLenDimContext -e -image1 \"arcLengthDim.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" arcLenDimContext"
 -sv "artSelectContext" "artSelectCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -tangentOutline 1\n-surfaceConformedBrushVertices 0\n-record 0\n-importreassign 0\n-selectclonesource 0\n-preserveclonesource 1\n-dynclonemode 1\n-pickColor 0\n-expandfilename 0\n-usepressure 0\n-reflectionaboutorigin 0\n-reflection 0\n-projective 0\n-showactive 1\n-brushfeedback 1\n-outwhilepaint 0\n-outline 1\n-accopacity 0\n-brushalignment 1\n-exportaspectratio 1\n-stampDepth 0.5\n-stampSpacing 0.1\n-screenRadius 1\n-worldRadius 1\n-lowerradius 0.001\n-opacity 1\n-reflectionaxis \"x\" -exportfiletype \"IFF\" -exportfilemode \"luminance\" -importfilemode \"luminance\" -strokesmooth \"spline\" -mappressure \"Opacity\" -paintmode \"tangent\" -paintoperationtype \"Paint\" -dragSlider \"none\" -radius 1\n-stampProfile \"poly\" -exportfilesizex 256\n-exportfilesizey 256\n-selectop \"select\" -addselection 1\n-importthreshold 0.5\nartSelectContext";
optionVar
 -iv "assemblyDefinitionAddLocator" 1
 -iv "assemblyDefinitionShowUsageMsg" 1
 -iv "assemblyLoadRepOnCreation" 1
 -iv "autoAdjustmentActive" 0
 -sv "autoKeyCharacterState" "standard"
 -iv "autoKeyframeState" 0
 -iv "autoSaveDestination" 0
 -iv "autoSaveEnable" 0
 -sv "autoSaveFolder" ""
 -iv "autoSaveInterval" 10;
optionVar
 -iv "autoSaveLimitBackups" 0
 -iv "autoSaveMaxBackups" 10
 -iv "autoSavePrompt" 0
 -sv "azimuthElevationContext" "orbitCtx -e -image1 \"azimuthElevation.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 0\n-toolName \"Azimuth Elevation Tool\" -orbitScale 1\n-localOrbit 1\nazimuthElevationContext"
 -iv "batchRenderMessagesVerbosity" 1
 -iv "bevelOutputPolygons" 0
 -iv "bifrostBackgroundProcessingVar" 0
 -iv "bifrostScratchCacheVar" 0
 -iv "birail1OutputPoly" 0
 -iv "birail2OutputPoly" 0;
optionVar
 -iv "birail3OutputPoly" 0
 -iv "blendOutputPoly" 0
 -iv "boundaryPolys" 0
 -sv "boxZoom2dContext" "view2dToolCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 0\n-toolName \"2d View\" boxZoom2dContext"
 -sv "boxZoomContext" "boxZoomCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -zoomScale 1\nboxZoomContext"
 -sv "boxZoomtwContext" "texWinToolCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 0\n-toolName \"UV Editor\" boxZoomtwContext"
 -iv "cameraNamesVisibility" 1
 -iv "canSuppressFileOpenErrorDialog" 0
 -iv "capsLockVisibility" 1
 -sv "cbDockWidgetArea" "right";
optionVar
 -iv "cbInMainWindow" 1
 -iv "channelsFieldWidth" 75
 -iv "channelsLayersPaneSize" 70
 -iv "channelsLayersSeparate" 0
 -iv "channelsLayersVisible" 1
 -iv "channelsLongName" 1
 -iv "channelsPrecision" 3
 -iv "channelsVisible" 0
 -iv "circularFilletOutputPolygons" 0
 -sv "clDockWidgetArea" "right";
optionVar
 -iv "clInMainWindow" 1
 -iv "clickBoxSize" 4
 -iv "cmdWindowTitleBarVis" 1
 -iv "collapseIconBarsInPanels" 0
 -iv "colorManagementColorPickerColorMgtEnabled" 1
 -sv "colorManagementColorPickerColorSpaceSelection" "Rendering Space"
 -iv "colorManagementEnabledByDefault" 1
 -iv "colorManagementManagePots" 1
 -sv "colorManagementPolicyFileName" ""
 -ca "colorMaterialBlend"
 -iva "colorMaterialBlend" 0
 -iva "colorMaterialBlend" 0;
optionVar
 -ca "colorMaterialChannel"
 -iva "colorMaterialChannel" 3
 -iva "colorMaterialChannel" 3
 -ca "colorShadedDisplay"
 -iva "colorShadedDisplay" 0
 -iva "colorShadedDisplay" 0
 -iv "commandExecuterAutoCloseBraces" 1
 -iv "commandExecuterShowLineNumbers" 1
 -iv "commandExecuterSpacesPerTab" 4
 -iv "commandExecuterTabsForIndent" 0
 -iv "commandLineHoldFocus" 0
 -iv "commandLineInputFieldWidth" 25
 -iv "commandLineNumHistoryLines" 50
 -sv "commandLineSourceType" "mel";
optionVar
 -iv "commandLineVisible" 1
 -sv "commandportDefaultName" "commandportDefault"
 -iv "commandportOpenByDefault" 1
 -sv "connectToolMode" "segments"
 -fv "connectToolPinch" 0
 -iv "connectToolSegments" 0
 -fv "connectToolSlide" 0
 -iv "containerAutoSelectContainer" 1
 -iv "containerCentricSelection" 0
 -iv "containerChanBoxMaxNoTemplate" 400;
optionVar
 -iv "containerChanBoxMaxWithTemplate" 400
 -iv "containerFlatViewCap" 12
 -iv "containerRootUsesCustomIcon" 1
 -iv "containerSelRootsInOutliner" 1
 -ca "contentBrowserThumbnailSizes"
 -iva "contentBrowserThumbnailSizes" 64
 -iva "contentBrowserThumbnailSizes" 128
 -iva "contentBrowserThumbnailSizes" 256
 -iva "contentBrowserThumbnailSizes" 512
 -sv "create2dTextureType" "normal"
 -iv "createMaterialsWithShadingGroup" 1
 -iv "createNurbsPrimitiveAsTool" 0
 -iv "createPolyPrimitiveAsTool" 0
 -iv "createTexturesWithPlacement" 1;
optionVar
 -iv "cteEditorSnapToClip" 1
 -iv "cteEditorSnapToFrame" 1
 -iv "cteEditorSnapTolerance" 10
 -iv "currentDisplayLayerActive" 0
 -iv "currentFrameVisibility" 0
 -sv "currentHotkeySet" "Maya_Default"
 -sv "currentMenuBarTab" "modelingMenuSet"
 -sv "customPathHelpUrl2018" ""
 -ca "customSelectPriority"
 -iva "customSelectPriority" 10
 -iva "customSelectPriority" 10
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 9
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 4
 -iva "customSelectPriority" 3
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 8
 -iva "customSelectPriority" 10
 -iva "customSelectPriority" 10
 -iva "customSelectPriority" 9
 -iva "customSelectPriority" 9
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 2
 -iva "customSelectPriority" 11
 -iva "customSelectPriority" 11
 -fv "defaultCameraFarClipValue" 10000;
optionVar
 -fv "defaultCameraNearClipValue" 0.1
 -sv "defaultDiskCacheSaveAsType" "always"
 -sv "defaultFileCreateReferenceType" "All Files"
 -sv "defaultFileExportActiveType" "mayaBinary"
 -sv "defaultFileExportAllType" "mayaBinary"
 -sv "defaultFileExportEditsType" "mayaBinary"
 -sv "defaultFileExportSelectionAsReferenceType" "mayaBinary"
 -sv "defaultFileImportType" "All Files"
 -sv "defaultFileOpenType" "Maya Scenes"
 -sv "defaultFileReferenceType" "All Files";
optionVar
 -sv "defaultFileSaveType" "mayaBinary"
 -fv "defaultFitFactor" 0.95
 -iv "defaultFontSize" 14
 -iv "defaultShowManipulator" 6
 -sv "defaultTextureSaveAsType" "unlessRef"
 -sv "directKeyContext" "directKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -option \"over\" -selectedOnly 1\ndirectKeyContext"
 -iv "disableComponentPopups" 0
 -iv "displayAffected" 1
 -iv "displayAlphaAsGreyScale" 0
 -iv "displayAnimLayerAndCharacterForm" 1;
optionVar
 -iv "displayCrashInfo" 1
 -iv "displayDivisionLines" 1
 -iv "displayFramerateandPlaybackSpeed" 1
 -iv "displayGridAxes" 1
 -iv "displayGridAxesAccented" 1
 -iv "displayGridLines" 1
 -sv "displayGridOrthoLabelPosition" "edge"
 -sv "displayGridPerspLabelPosition" "axis"
 -iv "displayLayerCurrent" 0
 -iv "displayLayerMerge" 0;
optionVar
 -iv "displayNewFeatureHighlights" 0
 -iv "displayOrthoGridLabels" 0
 -iv "displayPerspGridLabels" 0
 -ca "displayPolyBackFaceCull"
 -iva "displayPolyBackFaceCull" 0
 -iva "displayPolyBackFaceCull" 0
 -ca "displayPolyBorderEdgeHilite"
 -iva "displayPolyBorderEdgeHilite" 0
 -iva "displayPolyBorderEdgeHilite" 0
 -ca "displayPolyBorderEdgeSize"
 -fva "displayPolyBorderEdgeSize" 3
 -fva "displayPolyBorderEdgeSize" 3
 -ca "displayPolyBorderMapHilite"
 -iva "displayPolyBorderMapHilite" 0
 -iva "displayPolyBorderMapHilite" 0
 -ca "displayPolyCreaseEdgeHilite"
 -iva "displayPolyCreaseEdgeHilite" 0
 -iva "displayPolyCreaseEdgeHilite" 0
 -ca "displayPolyCreaseVertexHilite"
 -iva "displayPolyCreaseVertexHilite" 0
 -iva "displayPolyCreaseVertexHilite" 0
 -ca "displayPolyEdgeDisp"
 -iva "displayPolyEdgeDisp" 0
 -iva "displayPolyEdgeDisp" 0;
optionVar
 -ca "displayPolyFacetCentreDisp"
 -iva "displayPolyFacetCentreDisp" 0
 -iva "displayPolyFacetCentreDisp" 0
 -ca "displayPolyFacetNormalDisp"
 -iva "displayPolyFacetNormalDisp" 0
 -iva "displayPolyFacetNormalDisp" 0
 -ca "displayPolyFacetTrngleDisp"
 -iva "displayPolyFacetTrngleDisp" 0
 -iva "displayPolyFacetTrngleDisp" 0
 -ca "displayPolyFacetWarpDisp"
 -iva "displayPolyFacetWarpDisp" 0
 -iva "displayPolyFacetWarpDisp" 0
 -ca "displayPolyHoleFacesHilite"
 -iva "displayPolyHoleFacesHilite" 1
 -iva "displayPolyHoleFacesHilite" 1
 -ca "displayPolyNormalSize"
 -fva "displayPolyNormalSize" 0.4
 -fva "displayPolyNormalSize" 0.4
 -ca "displayPolyNumEdge"
 -iva "displayPolyNumEdge" 0
 -iva "displayPolyNumEdge" 0
 -ca "displayPolyNumFacet"
 -iva "displayPolyNumFacet" 0
 -iva "displayPolyNumFacet" 0
 -ca "displayPolyNumUv"
 -iva "displayPolyNumUv" 0
 -iva "displayPolyNumUv" 0
 -ca "displayPolyNumVertex"
 -iva "displayPolyNumVertex" 0
 -iva "displayPolyNumVertex" 0;
optionVar
 -iv "displayPolyObjsAffected" 0
 -ca "displayPolyUV"
 -iva "displayPolyUV" 0
 -iva "displayPolyUV" 0
 -ca "displayPolyUVSize"
 -fva "displayPolyUVSize" 4
 -fva "displayPolyUVSize" 4
 -ca "displayPolyUVTopology"
 -iva "displayPolyUVTopology" 0
 -iva "displayPolyUVTopology" 0
 -ca "displayPolyVertexNormals"
 -iva "displayPolyVertexNormals" 0
 -iva "displayPolyVertexNormals" 0
 -ca "displayPolyVertexSize"
 -fva "displayPolyVertexSize" 3
 -fva "displayPolyVertexSize" 3
 -ca "displayPolyVtxBackCull"
 -iva "displayPolyVtxBackCull" 1
 -iva "displayPolyVtxBackCull" 1
 -ca "displayPolyVtxDisp"
 -iva "displayPolyVtxDisp" 0
 -iva "displayPolyVtxDisp" 0
 -iv "displayPreferenceIcon" 1
 -iv "displayRegionOfEffect" 1;
optionVar
 -iv "displayViewportGradient" 0
 -sv "distanceDimContext" "distanceDimContext -e -image1 \"distanceDim.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" distanceDimContext"
 -sv "dolly2dContext" "view2dToolCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 0\n-toolName \"2d View\" dolly2dContext"
 -sv "dollyContext" "dollyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 1\n-toolName \"Dolly Tool\" -orthoZoom 1\n-scale 1\n-localDolly 1\n-centerOfInterestDolly 0\n-boxDollyType \"bbox\" -dollyTowardsCenter 1\ndollyContext"
 -sv "dollytwContext" "texWinToolCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 0\n-toolName \"UV Editor\" dollytwContext"
 -iv "dopeSheetAutoFit" 0
 -iv "dopeSheetShowTicks" 1
 -sv "dynParticleContext" "dynParticleCtx -e -image1 \"particle.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -conserve 1\n-nucleus 0\n-sketch 0\n-numJitters 1\n-jitterRadius 0\n-sketchInterval 5\n-grid 0\n-gridSpacing 0.5\n-lowerLeftX -2.5\n-lowerLeftY -2.5\n-lowerLeftZ -2.5\n-upperRightX 2.5\n-upperRightY 2.5\n-upperZ 2.5\ndynParticleContext"
 -iv "dynPrefAutoCreate" 1
 -iv "dynPrefEchoCollision" 1;
optionVar
 -iv "dynPrefRunupFrom" 1
 -iv "dynPrefRunupToCurrentTime" 0
 -iv "dynPrefSaveRuntimeState" 1
 -sv "dynWireCtx1" "dynWireCtx -e -image1 \"paintEffectsTool.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -dragBrushSize \"none\" -doProject 1\n-brushDrag 0.88\n-brushMass 1\n-inputSamples 4\n-sampleSeparation 4\n-surfaceOffset 0\n-paintAtDepth 0\n-drawAsMesh 1\n-usePressure 1\n-pressureMapping1 5\n-pressureMapping2 1\n-pressureMapping3 0\n-pressureMin1 0\n-pressureMin2 0\n-pressureMin3 0\n-pressureMax1 1\n-pressureMax2 1\n-pressureMax3 1\n-displayQuality 100\n-pixelMode 0\ndynWireCtx1"
 -iv "echoAllLines" 0
 -iv "editorConnectionScanLimit" 500
 -iv "enableRealWorldSize" 0
 -iv "enableSwatchRendering" 1
 -iv "evaluationMode" 3
 -iv "evaluationVisibility" 0;
optionVar
 -iv "expandPopupList" 0
 -iv "externalContentTableStorageEnabled" 0
 -iv "extrudeOutputPolygons" 0
 -iv "fastInteraction" 0
 -iv "fbikDetailsVisibility" 0
 -iv "fcheckAsImageViewer" 1
 -sv "fileCompressionMode" "asCompressed"
 -iv "fileIgnoreVersion" 1
 -iv "fontSetOpt" 0
 -iv "forceUIPrecision" 0;
optionVar
 -iv "frameRateVisibility" 0
 -iv "freeFormFilletOutputPolygons" 0
 -iv "generateUVTilePreviewsOnSceneLoad" 0
 -iv "ghostFrameStep" 1
 -iv "ghostFramesAfter" 3
 -iv "ghostFramesBefore" 3
 -iv "globalPolyDefaultSmoothDrawType" 1
 -iv "globalVisibilityOfComponentBars" 1
 -iv "gpuCacheVP2OverrideAPI" 0
 -iv "gpuCacheVP2OverrideAPIAuto" 1;
optionVar
 -iv "gpuOverride" 1
 -sv "graphDollyContext" "graphDollyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" graphDollyContext"
 -iv "graphEdLmbMovesSelections" 1
 -iv "graphEdSnapToAdjacentValues" 1
 -sv "graphEdValueLineDisplay" "On"
 -fv "graphEdValueLineInterval" 10
 -sv "graphEdValueLineLength" "Long"
 -iv "graphEdValueMinLines" 5
 -iv "graphEditorAutoFit" 1
 -iv "graphEditorClipTime" 1;
optionVar
 -iv "graphEditorDisplayNormalized" 0
 -iv "graphEditorHasClassicToolbar" 1
 -iv "graphEditorStackedCurves" 0
 -iv "graphEditorUI" 0
 -sv "graphTrackContext" "graphTrackCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" graphTrackContext"
 -fv "greasePencilBrushEraserRadius" 2
 -fv "greasePencilBrushMarkerOpacity" 0.8
 -fv "greasePencilBrushMarkerRadius" 0.7
 -fv "greasePencilBrushPencilOpacity" 1
 -fv "greasePencilBrushPencilRadius" 0.3;
optionVar
 -fv "greasePencilBrushSoftPencilOpacity" 0.6
 -fv "greasePencilBrushSoftPencilRadius" 0.3
 -iv "greasePencilBrushType" 1
 -sv "greasePencilContext" "greasePencilCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -rgbcolor 0.560784 0.756863 0.811765 -greasePencilType 1\n-canDraw 0\n-fileTextureSize 1024\n-resetBrushes 1\n-autoCreateFrames 1\ngreasePencilContext"
 -fv "gridDivisions" 5
 -fv "gridSize" 12
 -fv "gridSpacing" 5
 -iv "heatMapMetric" 2
 -iv "helpBrowserRaiseWindow" 1
 -iv "helpBrowserUseWindow" 1;
optionVar
 -sv "helpLanguage" "en_US"
 -iv "helpLineVisible" 1
 -sv "helpMode" "Autodesk Web Site"
 -iv "hideNoFPSFramerate" 1
 -iv "highPrecisionNurbs" 0
 -iv "hikDetailsVisibility" 0
 -iv "hikRotationInterpolationDefault" 4
 -iv "hikSegmentScaleCompensateIsOff" 0
 -sv "hotBoxDisplayStyle" "-dh"
 -iv "hotBoxTransparencyLevel" 25;
optionVar
 -iv "hotkeyEdAppCmdColWidth" 210
 -iv "hotkeyEdRunCmdColWidth" 145
 -iv "hsBinsSortShadingNodesOnly" 1
 -iv "hsClearBeforeGraphing" 1
 -iv "hsMergeConnections" 1
 -iv "hsOpaqueContainers" 0
 -iv "hsShowRelationships" 1
 -iv "hyperShadePanelCreateBarIconsAndTextWidth" 172
 -iv "hyperShadePanelCreateBarShown" 1
 -sv "hyperShadePanelTabSectionsShown" "showTopAndBottomTabs";
optionVar
 -iv "igAutoExport" 1
 -sv "igAutoExportFolder" "${DESC}/groom"
 -fv "igAutoExportTpu" 5
 -fv "igBrushAttractMag" 0.9
 -iv "igBrushAttractStyle" 1
 -fv "igBrushBendMag" 0.8
 -fv "igBrushElevDegrees" 1
 -fv "igBrushElevGoalAngle" 30
 -fv "igBrushEraserBendMag" 0.1
 -fv "igBrushEraserLengthMag" 0.01;
optionVar
 -fv "igBrushEraserOrientMag" 0.1
 -iv "igBrushFalloff" 1
 -fv "igBrushLengthGoal" 5
 -fv "igBrushLengthIncr" 0.1
 -fv "igBrushMaskMag" 0.2
 -iv "igBrushMaskUse" 1
 -fv "igBrushNoiseAboutNDegrees" 1.5
 -fv "igBrushNoiseMidMag" 0.075
 -fv "igBrushNoiseOffNDegrees" 2
 -fv "igBrushNoiseTipMag" 0.15;
optionVar
 -fv "igBrushNoiseTwistDegrees" 1
 -fv "igBrushNoiseWidthMag" 0.02
 -fv "igBrushOrientMag" 0.8
 -fv "igBrushPartMag" 0.3
 -fv "igBrushPoseBendMag" 0.5
 -fv "igBrushPoseOrientMag" 0.5
 -ca "igBrushRegionColor"
 -fva "igBrushRegionColor" 1
 -fva "igBrushRegionColor" 0
 -fva "igBrushRegionColor" 0
 -fv "igBrushRepelMag" 0.3
 -fv "igBrushSmoothBendMag" 0.2
 -fv "igBrushSmoothLengthMag" 0.2;
optionVar
 -fv "igBrushSmoothOrientMag" 0.2
 -fv "igBrushSpacing" 0.1
 -fv "igBrushTwistMag" 1
 -fv "igBrushWidthGoal" 0.1
 -fv "igBrushWidthIncr" 0.02
 -iv "ignoreSelectionPriority" 0
 -sv "ikHandleContext" "ikHandleCtx -e -image1 \"kinHandle.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -solverTypeH \"ikRPsolver\" -priorityH 1\n-weightH 1\n-poWeightH 1\n-autoPriorityH 0\n-snapHandleH 1\n-forceSolverH 1\n-stickyH \"off\" -createCurve 1\n-simplifyCurve 1\n-rootOnCurve 1\n-twistType \"linear\" -createRootAxis 0\n-parentCurve 1\n-snapCurve 0\n-numSpans 1\n-rootTwistMode 0\nikHandleContext"
 -fv "ikHandleDisplayScale" 1
 -sv "ikIkFkDisplayMethod" "ikfk"
 -fv "ikIkFkJointDisplayScale" 0.5;
optionVar
 -fv "ikJointDisplayScale" 1
 -sv "ikSplineHandleContext" "ikSplineHandleCtx -e -image1 \"kinSplineHandle.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -solverTypeH \"ikSplineSolver\" -priorityH 1\n-weightH 1\n-poWeightH 1\n-autoPriorityH 0\n-snapHandleH 1\n-forceSolverH 1\n-stickyH \"off\" -createCurve 1\n-simplifyCurve 1\n-rootOnCurve 1\n-twistType \"linear\" -createRootAxis 0\n-parentCurve 1\n-snapCurve 0\n-numSpans 1\n-rootTwistMode 0\nikSplineHandleContext"
 -sv "inTangentType" "auto"
 -iv "inViewEditorVisible" 1
 -iv "inViewMessageAssistEnable" 1
 -fv "inViewMessageDisplayTime" 2
 -iv "inViewMessageEnable" 1
 -iv "inViewMessageFontSize" 12
 -iv "inViewMessageOpacity" 75
 -iv "inViewMessageStatusEnable" 1;
optionVar
 -sv "insertJointContext" "insertJointCtx -e -image1 \"kinInsert.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" insertJointContext"
 -sv "insertKeyContext" "insertKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -breakdown 0\ninsertKeyContext"
 -sv "interactionModeToSuite" "undefined"
 -iv "iprRenderMotionBlur" 1
 -iv "iprRenderShading" 1
 -iv "iprRenderShadowMaps" 1
 -iv "isAttributeEditorVisible" 1
 -iv "isHotBoxAnimationRowVisible" 0
 -iv "isHotBoxClothRowVisible" 0
 -iv "isHotBoxCommonRowVisible" 0;
optionVar
 -iv "isHotBoxDynamicsRowVisible" 0
 -iv "isHotBoxLiveRowVisible" 0
 -iv "isHotBoxPaneSpecificRowVisible" 0
 -iv "isHotBoxPolygonsRowVisible" 0
 -iv "isHotBoxRenderingRowVisible" 0
 -iv "isHotBoxRmbPopupsOn" 0
 -iv "isHotBoxShowAll" 1
 -iv "isHotBoxSurfacesRowVisible" 0
 -iv "isMarkingMenuOn" 1
 -iv "isShelfLoad" 1;
optionVar
 -iv "isShelfSave" 1
 -iv "isShelfVisible" 1
 -sv "jointContext" "jointCtx -e -image1 \"kinJoint.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -scaleCompensateJ 1\n-degreeOfFreedomJ \"xyz\" -jointOrientationJ 0 0 0 -scaleOrientationJ 0 0 0 -scaleJ 1 1 1 -autoJointOrient \"xyz\" -secondaryAxisOrient \"yup\" -jointAutoLimits 0\n-symmetry 0\n-symmetryAxis \"x\" -createIKHandle 0\n-solverTypeH \"ikRPsolver\" -autoPriorityH 0\n-snapHandleH 1\n-forceSolverH 1\n-stickyH \"off\" -priorityH 1\n-weightH 1\n-poWeightH 1\n-smallBoneLength 1\n-smallBoneRadius 0.5\n-largeBoneLength 30\n-largeBoneRadius 2\n-variableBoneSize 1\njointContext"
 -iv "journalIsOn" 1
 -sv "keyframeRegionDirectKeyContext" "keyframeRegionDirectKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -option \"over\" keyframeRegionDirectKeyContext"
 -sv "keyframeRegionDollyContext" "keyframeRegionDollyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" keyframeRegionDollyContext"
 -sv "keyframeRegionInsertKeyContext" "keyframeRegionInsertKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -breakdown 1\nkeyframeRegionInsertKeyContext"
 -sv "keyframeRegionMoveKeyContext" "keyframeRegionMoveKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -option \"over\" keyframeRegionMoveKeyContext"
 -sv "keyframeRegionScaleKeyContext" "keyframeRegionScaleKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -type \"rect\" -scaleSpecifiedKeys 1\nkeyframeRegionScaleKeyContext"
 -sv "keyframeRegionSelectKeyContext" "keyframeRegionSelectKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" keyframeRegionSelectKeyContext";
optionVar
 -sv "keyframeRegionSetKeyContext" "keyframeRegionSetKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -breakdown 0\nkeyframeRegionSetKeyContext"
 -sv "keyframeRegionTrackContext" "keyframeRegionTrackCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" keyframeRegionTrackContext"
 -sv "lastLocalWS" "/Users/test/Documents/maya/projects/default"
 -sv "latticeDeformKeyContext" "latticeDeformKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -latticeColumns 3\n-latticeRows 3\n-envelope 1\n-scaleLatticePts 0\nlatticeDeformKeyContext"
 -iv "layersVisible" 0
 -sv "leDockWidgetArea" "right"
 -iv "leInMainWindow" 1
 -fv "lineWidth" 1
 -iv "loadDynamics" 1
 -iv "loadUrchin" 1;
optionVar
 -sv "localHelpUrl2018" ""
 -iv "loftPolys" 0
 -sv "mDNN" "MASH#"
 -iv "mHOC" 1
 -iv "mIVM" 1
 -sv "mNDT" "linearNetwork"
 -iv "mNOC" 0
 -iv "mOGTN" 1
 -iv "mainMenuBarNeedsToBeTraversedWhenHotkeyEditorIsOpened" 1
 -iv "mainWindowDisable" 0;
optionVar
 -iv "mainWindowMenubarVis" 1
 -iv "mainWindowTitleBarVis" 1
 -iv "manipClickBoxSize" 8
 -fv "manipGlobalScale" 1.5
 -fv "manipHandleSize" 35
 -iv "manipHideOnCtrl" 0
 -iv "manipHideOnShift" 0
 -iv "manipHideOnShiftCtrl" 0
 -fv "manipLinePickSize" 1
 -fv "manipLineSize" 1;
optionVar
 -fv "manipMiddleMouseRepos" 0
 -iv "manipPivotRotateHandleOffset" 50
 -iv "manipPlaneHandleOffset" 75
 -fv "manipPreviousStateSize" 6
 -iv "manipShowPenumbraDecayRegions" 0
 -iv "manipShowPivotRotateHandle" 1
 -iv "manipShowPlaneHandles" 1
 -iv "manipSmartDuplicate" 0
 -iv "manipSmartDuplicateType" 1
 -iv "manipSmartExtrude" 1;
optionVar
 -iv "manipsRememberActiveHandle" 1
 -iv "manipsRememberActiveHandleAfterToolSwitch" 1
 -ca "markingMenuEditorAnnotations"
 -sva "markingMenuEditorAnnotations" "ChangePanelLayout"
 -sva "markingMenuEditorAnnotations" "ChangePanelType"
 -sva "markingMenuEditorAnnotations" "ControlPaneVisibility"
 -sva "markingMenuEditorAnnotations" "ChangeSelectionMask"
 -sva "markingMenuEditorAnnotations" "CommonModelingPanes"
 -sva "markingMenuEditorAnnotations" "PA_Style_LMB"
 -sva "markingMenuEditorAnnotations" "PA_Style_MMB"
 -sva "markingMenuEditorAnnotations" "PA_Style_RMB"
 -ca "markingMenuEditorDisplayAsMMFlags"
 -iva "markingMenuEditorDisplayAsMMFlags" 1
 -iva "markingMenuEditorDisplayAsMMFlags" 1
 -iva "markingMenuEditorDisplayAsMMFlags" 1
 -iva "markingMenuEditorDisplayAsMMFlags" 1
 -iva "markingMenuEditorDisplayAsMMFlags" 1
 -iva "markingMenuEditorDisplayAsMMFlags" 1
 -iva "markingMenuEditorDisplayAsMMFlags" 1
 -iva "markingMenuEditorDisplayAsMMFlags" 1
 -ca "markingMenuEditorFilenames"
 -sva "markingMenuEditorFilenames" "menu_ChangePanelLayout"
 -sva "markingMenuEditorFilenames" "menu_ChangePanelType"
 -sva "markingMenuEditorFilenames" "menu_ControlPaneVisibility"
 -sva "markingMenuEditorFilenames" "menu_ChangeSelectionMask"
 -sva "markingMenuEditorFilenames" "menu_CommonModelingPanes"
 -sva "markingMenuEditorFilenames" "menu_PA_Style_LMB"
 -sva "markingMenuEditorFilenames" "menu_PA_Style_MMB"
 -sva "markingMenuEditorFilenames" "menu_PA_Style_RMB"
 -ca "markingMenuEditorIsNamedCommandFlags"
 -iva "markingMenuEditorIsNamedCommandFlags" 0
 -iva "markingMenuEditorIsNamedCommandFlags" 0
 -iva "markingMenuEditorIsNamedCommandFlags" 0
 -iva "markingMenuEditorIsNamedCommandFlags" 0
 -iva "markingMenuEditorIsNamedCommandFlags" 0
 -iva "markingMenuEditorIsNamedCommandFlags" 0
 -iva "markingMenuEditorIsNamedCommandFlags" 0
 -iva "markingMenuEditorIsNamedCommandFlags" 0
 -sv "mashMenuName" "MayaWindow|mainMashMenu"
 -iv "materialLoadingDetailsVisibility" 0
 -iv "materialLoadingMode" 3
 -iv "maxImageSizeForSwatchGen" 2000;
optionVar
 -iv "maxTextureResolution" 4096
 -iv "mayaMacButtonMap" 3
 -sv "mayaMode" "modelingMenuSet"
 -iv "melDuplicateVariableWarnings" 1
 -iv "metadataVisualAuto" 0
 -sv "metadataVisualCurrentStreamMember" ""
 -iv "metadataVisualInterpolation" 0
 -fv "metadataVisualMax" 1
 -sv "metadataVisualMethod" "color"
 -fv "metadataVisualMin" 0;
optionVar
 -fv "metadataVisualRayScale" 1
 -iv "miCacheOptimFileTextures" 0
 -iv "miCollapseHistoryOnProxyUpdate" 0
 -iv "miEnableRayTracingForSwatch" 1
 -iv "miFileTextureCacheConversionScope" 1
 -sv "miFileTextureCacheLocation" ""
 -iv "miFileTextureCacheStorageMode" 0
 -iv "miUseMayaAlphaDetection" 0
 -ca "minorNodeTypes"
 -iva "minorNodeTypes" 1397509968
 -iva "minorNodeTypes" 1330007124
 -iva "minorNodeTypes" 1330792012
 -iva "minorNodeTypes" 1330529868
 -iva "minorNodeTypes" 1330464332
 -iva "minorNodeTypes" 1330004308
 -iva "minorNodeTypes" 1330923084
 -iva "minorNodeTypes" 1330857548
 -iva "minorNodeTypes" 1196576848
 -iva "minorNodeTypes" 1145918537
 -iva "minorNodeTypes" 1280070484
 -iva "minorNodeTypes" 1314083656
 -iva "minorNodeTypes" 1313166152
 -iva "minorNodeTypes" 1297435724
 -iva "minorNodeTypes" 1145390668
 -iva "minorNodeTypes" 1347441492
 -iva "minorNodeTypes" 1380209484
 -iva "minorNodeTypes" 1146246476
 -iva "minorNodeTypes" 1380206412
 -iva "minorNodeTypes" 1380404290
 -iva "minorNodeTypes" 1381061953
 -iva "minorNodeTypes" 1380734030
 -iva "minorNodeTypes" 1146441300
 -iva "minorNodeTypes" 1196443972
 -iva "minorNodeTypes" 1213812812
 -iva "minorNodeTypes" 1213812818
 -iva "minorNodeTypes" 1145589846
 -iva "minorNodeTypes" 1313293641
 -iva "minorNodeTypes" 1313293634
 -iva "minorNodeTypes" 1313161801
 -iva "minorNodeTypes" 1380863053
 -iva "minorNodeTypes" 1146244684
 -iva "minorNodeTypes" 1380209740
 -iva "minorNodeTypes" 1146244684
 -iva "minorNodeTypes" 1129137986
 -iv "minorNodeTypesDisplay" 0;
optionVar
 -sv "modelPanel1" "modelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels modelPanel1;\n$editorName = $panelName;\nmodelEditor -e -camera \"top\" -useInteractiveMode 0\n-displayLights \"default\" -displayAppearance \"smoothShaded\" -activeOnly 0\n-ignorePanZoom 0\n-wireframeOnShaded 0\n-headsUpDisplay 1\n-holdOuts 1\n-selectionHiliteDisplay 1\n-useDefaultMaterial 0\n-bufferMode \"double\" -twoSidedLighting 0\n-backfaceCulling 0\n-xray 0\n-jointXray 0\n-activeComponentsXray 0\n-displayTextures 0\n-smoothWireframe 0\n-lineWidth 1\n-textureAnisotropic 0\n-textureHilight 1\n-textureSampling 2\n-textureDisplay \"modulate\" -textureMaxSize 16384\n-fogging 0\n-fogSource \"fragment\" -fogMode \"linear\" -fogStart 0\n-fogEnd 100\n-fogDensity 0.1\n-fogColor 0.5 0.5 0.5 1 -depthOfFieldPreview 1\n-maxConstantTransparency 1\n-rendererName \"vp2Renderer\" -objectFilterShowInHUD 1\n-isFiltered 0\n-colorResolution 256 256 -bumpResolution 512 512 -textureCompression 0\n-transparencyAlgorithm \"frontAndBackCull\" -transpInShadows 0\n-cullingOverride \"none\" -lowQualityLighting 0\n-maximumNumHardwareLights 1\n-occlusionCulling 0\n-shadingModel 0\n-useBaseRenderer 0\n-useReducedRenderer 0\n-smallObjectCulling 0\n-smallObjectThreshold -1 -interactiveDisableShadows 0\n-interactiveBackFaceCull 0\n-sortTransparent 1\n-controllers 1\n-nurbsCurves 1\n-nurbsSurfaces 1\n-polymeshes 1\n-subdivSurfaces 1\n-planes 1\n-lights 1\n-cameras 1\n-controlVertices 1\n-hulls 1\n-grid 1\n-imagePlane 1\n-joints 1\n-ikHandles 1\n-deformers 1\n-dynamics 1\n-particleInstancers 1\n-fluids 1\n-hairSystems 1\n-follicles 1\n-nCloths 1\n-nParticles 1\n-nRigids 1\n-dynamicConstraints 1\n-locators 1\n-manipulators 1\n-pluginShapes 1\n-dimensions 1\n-handles 1\n-pivots 1\n-textures 1\n-strokes 1\n-motionTrails 1\n-clipGhosts 1\n-greasePencils 1\n-shadows 0\n-captureSequenceNumber -1\n-width 382\n-height 271\n-sceneRenderFilter 0\n$editorName;\nmodelEditor -e -viewSelected 0 $editorName;\nmodelEditor -e -pluginObjects \"gpuCacheDisplayFilter\" 1 $editorName"
 -sv "modelPanel2" "modelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels modelPanel2;\n$editorName = $panelName;\nmodelEditor -e -camera \"side\" -useInteractiveMode 0\n-displayLights \"default\" -displayAppearance \"smoothShaded\" -activeOnly 0\n-ignorePanZoom 0\n-wireframeOnShaded 0\n-headsUpDisplay 1\n-holdOuts 1\n-selectionHiliteDisplay 1\n-useDefaultMaterial 0\n-bufferMode \"double\" -twoSidedLighting 0\n-backfaceCulling 0\n-xray 0\n-jointXray 0\n-activeComponentsXray 0\n-displayTextures 0\n-smoothWireframe 0\n-lineWidth 1\n-textureAnisotropic 0\n-textureHilight 1\n-textureSampling 2\n-textureDisplay \"modulate\" -textureMaxSize 16384\n-fogging 0\n-fogSource \"fragment\" -fogMode \"linear\" -fogStart 0\n-fogEnd 100\n-fogDensity 0.1\n-fogColor 0.5 0.5 0.5 1 -depthOfFieldPreview 1\n-maxConstantTransparency 1\n-rendererName \"vp2Renderer\" -objectFilterShowInHUD 1\n-isFiltered 0\n-colorResolution 256 256 -bumpResolution 512 512 -textureCompression 0\n-transparencyAlgorithm \"frontAndBackCull\" -transpInShadows 0\n-cullingOverride \"none\" -lowQualityLighting 0\n-maximumNumHardwareLights 1\n-occlusionCulling 0\n-shadingModel 0\n-useBaseRenderer 0\n-useReducedRenderer 0\n-smallObjectCulling 0\n-smallObjectThreshold -1 -interactiveDisableShadows 0\n-interactiveBackFaceCull 0\n-sortTransparent 1\n-controllers 1\n-nurbsCurves 1\n-nurbsSurfaces 1\n-polymeshes 1\n-subdivSurfaces 1\n-planes 1\n-lights 1\n-cameras 1\n-controlVertices 1\n-hulls 1\n-grid 1\n-imagePlane 1\n-joints 1\n-ikHandles 1\n-deformers 1\n-dynamics 1\n-particleInstancers 1\n-fluids 1\n-hairSystems 1\n-follicles 1\n-nCloths 1\n-nParticles 1\n-nRigids 1\n-dynamicConstraints 1\n-locators 1\n-manipulators 1\n-pluginShapes 1\n-dimensions 1\n-handles 1\n-pivots 1\n-textures 1\n-strokes 1\n-motionTrails 1\n-clipGhosts 1\n-greasePencils 1\n-shadows 0\n-captureSequenceNumber -1\n-width 381\n-height 270\n-sceneRenderFilter 0\n$editorName;\nmodelEditor -e -viewSelected 0 $editorName;\nmodelEditor -e -pluginObjects \"gpuCacheDisplayFilter\" 1 $editorName"
 -sv "modelPanel3" "modelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels modelPanel3;\n$editorName = $panelName;\nmodelEditor -e -camera \"front\" -useInteractiveMode 0\n-displayLights \"default\" -displayAppearance \"smoothShaded\" -activeOnly 0\n-ignorePanZoom 0\n-wireframeOnShaded 0\n-headsUpDisplay 1\n-holdOuts 1\n-selectionHiliteDisplay 1\n-useDefaultMaterial 0\n-bufferMode \"double\" -twoSidedLighting 0\n-backfaceCulling 0\n-xray 0\n-jointXray 0\n-activeComponentsXray 0\n-displayTextures 0\n-smoothWireframe 0\n-lineWidth 1\n-textureAnisotropic 0\n-textureHilight 1\n-textureSampling 2\n-textureDisplay \"modulate\" -textureMaxSize 16384\n-fogging 0\n-fogSource \"fragment\" -fogMode \"linear\" -fogStart 0\n-fogEnd 100\n-fogDensity 0.1\n-fogColor 0.5 0.5 0.5 1 -depthOfFieldPreview 1\n-maxConstantTransparency 1\n-rendererName \"vp2Renderer\" -objectFilterShowInHUD 1\n-isFiltered 0\n-colorResolution 256 256 -bumpResolution 512 512 -textureCompression 0\n-transparencyAlgorithm \"frontAndBackCull\" -transpInShadows 0\n-cullingOverride \"none\" -lowQualityLighting 0\n-maximumNumHardwareLights 1\n-occlusionCulling 0\n-shadingModel 0\n-useBaseRenderer 0\n-useReducedRenderer 0\n-smallObjectCulling 0\n-smallObjectThreshold -1 -interactiveDisableShadows 0\n-interactiveBackFaceCull 0\n-sortTransparent 1\n-controllers 1\n-nurbsCurves 1\n-nurbsSurfaces 1\n-polymeshes 1\n-subdivSurfaces 1\n-planes 1\n-lights 1\n-cameras 1\n-controlVertices 1\n-hulls 1\n-grid 1\n-imagePlane 1\n-joints 1\n-ikHandles 1\n-deformers 1\n-dynamics 1\n-particleInstancers 1\n-fluids 1\n-hairSystems 1\n-follicles 1\n-nCloths 1\n-nParticles 1\n-nRigids 1\n-dynamicConstraints 1\n-locators 1\n-manipulators 1\n-pluginShapes 1\n-dimensions 1\n-handles 1\n-pivots 1\n-textures 1\n-strokes 1\n-motionTrails 1\n-clipGhosts 1\n-greasePencils 1\n-shadows 0\n-captureSequenceNumber -1\n-width 382\n-height 270\n-sceneRenderFilter 0\n$editorName;\nmodelEditor -e -viewSelected 0 $editorName;\nmodelEditor -e -pluginObjects \"gpuCacheDisplayFilter\" 1 $editorName"
 -sv "modelPanel4" "modelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels modelPanel4;\n$editorName = $panelName;\nmodelEditor -e -camera \"persp\" -useInteractiveMode 0\n-displayLights \"default\" -displayAppearance \"smoothShaded\" -activeOnly 0\n-ignorePanZoom 0\n-wireframeOnShaded 0\n-headsUpDisplay 1\n-holdOuts 1\n-selectionHiliteDisplay 1\n-useDefaultMaterial 0\n-bufferMode \"double\" -twoSidedLighting 0\n-backfaceCulling 0\n-xray 0\n-jointXray 0\n-activeComponentsXray 0\n-displayTextures 0\n-smoothWireframe 0\n-lineWidth 1\n-textureAnisotropic 0\n-textureHilight 1\n-textureSampling 2\n-textureDisplay \"modulate\" -textureMaxSize 16384\n-fogging 0\n-fogSource \"fragment\" -fogMode \"linear\" -fogStart 0\n-fogEnd 100\n-fogDensity 0.1\n-fogColor 0.5 0.5 0.5 1 -depthOfFieldPreview 1\n-maxConstantTransparency 1\n-rendererName \"vp2Renderer\" -objectFilterShowInHUD 1\n-isFiltered 0\n-colorResolution 256 256 -bumpResolution 512 512 -textureCompression 0\n-transparencyAlgorithm \"frontAndBackCull\" -transpInShadows 0\n-cullingOverride \"none\" -lowQualityLighting 0\n-maximumNumHardwareLights 1\n-occlusionCulling 0\n-shadingModel 0\n-useBaseRenderer 0\n-useReducedRenderer 0\n-smallObjectCulling 0\n-smallObjectThreshold -1 -interactiveDisableShadows 0\n-interactiveBackFaceCull 0\n-sortTransparent 1\n-controllers 1\n-nurbsCurves 1\n-nurbsSurfaces 1\n-polymeshes 1\n-subdivSurfaces 1\n-planes 1\n-lights 1\n-cameras 1\n-controlVertices 1\n-hulls 1\n-grid 1\n-imagePlane 1\n-joints 1\n-ikHandles 1\n-deformers 1\n-dynamics 1\n-particleInstancers 1\n-fluids 1\n-hairSystems 1\n-follicles 1\n-nCloths 1\n-nParticles 1\n-nRigids 1\n-dynamicConstraints 1\n-locators 1\n-manipulators 1\n-pluginShapes 1\n-dimensions 1\n-handles 1\n-pivots 1\n-textures 1\n-strokes 1\n-motionTrails 1\n-clipGhosts 1\n-greasePencils 1\n-shadows 0\n-captureSequenceNumber -1\n-width 381\n-height 271\n-sceneRenderFilter 0\n$editorName;\nmodelEditor -e -viewSelected 0 $editorName;\nmodelEditor -e -pluginObjects \"gpuCacheDisplayFilter\" 1 $editorName"
 -iv "modelWithToolAlignCurve" 0
 -iv "modelWithToolAlignSurface" 0
 -iv "modelWithToolAttachCurve" 0
 -iv "modelWithToolAttachSurface" 0
 -iv "modelWithToolBevel" 0
 -iv "modelWithToolBoundary" 0;
optionVar
 -iv "modelWithToolCircFillet" 0
 -iv "modelWithToolCloseCurve" 0
 -iv "modelWithToolCloseSurface" 0
 -iv "modelWithToolCutCurve" 0
 -iv "modelWithToolCvHardness" 0
 -iv "modelWithToolDetachCurve" 0
 -iv "modelWithToolDetachSurface" 0
 -iv "modelWithToolDuplCurve" 0
 -iv "modelWithToolDuplicateSurface" 0
 -iv "modelWithToolExtendCosCurve" 0;
optionVar
 -iv "modelWithToolExtendCurve" 0
 -iv "modelWithToolExtendSurface" 0
 -iv "modelWithToolExtrude" 0
 -iv "modelWithToolFilletCurve" 0
 -iv "modelWithToolFitBspline" 0
 -iv "modelWithToolFreeFillet" 0
 -iv "modelWithToolGlobalStitch" 0
 -iv "modelWithToolInsertCurve" 0
 -iv "modelWithToolInsertSurface" 0
 -iv "modelWithToolIntersect" 0;
optionVar
 -iv "modelWithToolIntersectCurve" 0
 -iv "modelWithToolLoft" 0
 -iv "modelWithToolOffsetCoS" 0
 -iv "modelWithToolOffsetCurve" 0
 -iv "modelWithToolOffsetSurface" 0
 -iv "modelWithToolPlanar" 0
 -iv "modelWithToolProject" 0
 -iv "modelWithToolProjectTangent" 0
 -iv "modelWithToolRebuildCurve" 0
 -iv "modelWithToolRebuildSurface" 0;
optionVar
 -iv "modelWithToolReverseCurve" 0
 -iv "modelWithToolReverseSurface" 0
 -iv "modelWithToolRevolve" 0
 -iv "modelWithToolSmoothCurve" 0
 -iv "modelWithToolSquareSrf" 0
 -iv "modelWithToolUntrim" 0
 -sv "moveKeyContext" "moveKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -option \"over\" -moveFunction \"constant\" moveKeyContext"
 -sv "mtoaBuildID" "2ad5768c (master)"
 -iv "multiCutDeleteFaces" 0
 -fv "multiCutEdgeFlow" 1;
optionVar
 -iv "multiCutExtractFaces" 0
 -ca "multiCutExtractOffset"
 -fva "multiCutExtractOffset" 0.5
 -fva "multiCutExtractOffset" 0.5
 -fva "multiCutExtractOffset" 0.5
 -ca "multiCutHiliteColorEdge"
 -fva "multiCutHiliteColorEdge" 0
 -fva "multiCutHiliteColorEdge" 0
 -fva "multiCutHiliteColorEdge" 1
 -ca "multiCutHiliteColorFace"
 -fva "multiCutHiliteColorFace" 1
 -fva "multiCutHiliteColorFace" 1
 -fva "multiCutHiliteColorFace" 1
 -ca "multiCutHiliteColorLine"
 -fva "multiCutHiliteColorLine" 1
 -fva "multiCutHiliteColorLine" 0.5
 -fva "multiCutHiliteColorLine" 0
 -ca "multiCutHiliteColorVert"
 -fva "multiCutHiliteColorVert" 1
 -fva "multiCutHiliteColorVert" 1
 -fva "multiCutHiliteColorVert" 0
 -iv "multiCutIgnoreBackfaces" 0
 -iv "multiCutSmoothingAngle" 180
 -iv "multiCutSnapStep" 10
 -iv "multiCutSubdivisions" 1;
optionVar
 -iv "multiCutUseEdgeFlow" 0
 -sv "nameOfHotBoxC1MarkingMenu" "CommonModelingPanes"
 -sv "nameOfHotBoxC2MarkingMenu" "CommonModelingPanes"
 -sv "nameOfHotBoxC3MarkingMenu" "CommonModelingPanes"
 -sv "nameOfHotBoxE1MarkingMenu" "ControlPaneVisibility"
 -sv "nameOfHotBoxE2MarkingMenu" "ControlPaneVisibility"
 -sv "nameOfHotBoxE3MarkingMenu" "ControlPaneVisibility"
 -sv "nameOfHotBoxN1MarkingMenu" "ChangePanelLayout"
 -sv "nameOfHotBoxN2MarkingMenu" "ChangePanelLayout"
 -sv "nameOfHotBoxN3MarkingMenu" "ChangePanelLayout";
optionVar
 -sv "nameOfHotBoxS1MarkingMenu" "ChangePanelType"
 -sv "nameOfHotBoxS2MarkingMenu" "ChangePanelType"
 -sv "nameOfHotBoxS3MarkingMenu" "ChangePanelType"
 -sv "nameOfHotBoxW1MarkingMenu" "ChangeSelectionMask"
 -sv "nameOfHotBoxW2MarkingMenu" "ChangeSelectionMask"
 -sv "nameOfHotBoxW3MarkingMenu" "ChangeSelectionMask"
 -iv "newCurveDisplayCV" 0
 -iv "newCurveDisplayEP" 0
 -iv "newCurveDisplayHull" 0
 -ca "newFeatureHighlightColor"
 -fva "newFeatureHighlightColor" 0.173007
 -fva "newFeatureHighlightColor" 0.702007
 -fva "newFeatureHighlightColor" 0.145006;
optionVar
 -iv "newNurbsIsoparms" 0
 -iv "newNurbsPointsShaded" 4
 -iv "newNurbsPointsWire" 5
 -iv "newPolyBackFaceCull" 0
 -iv "newPolyBorderEdgeHilite" 0
 -fv "newPolyBorderEdgeSize" 2
 -iv "newPolyBorderMapHilite" 0
 -iv "newPolyColorChannel" 3
 -iv "newPolyColorShaded" 0
 -iv "newPolyCreaseEdgeHilite" 1;
optionVar
 -iv "newPolyCreaseVertexHilite" 1
 -iv "newPolyDefaultSmoothDrawType" 1
 -iv "newPolyDefaultVertexNormalMethod" 3
 -iv "newPolyEdgeDisp" 0
 -iv "newPolyFacetCentreDisp" 0
 -iv "newPolyFacetNormalDisp" 0
 -iv "newPolyFacetTrngleDisp" 0
 -iv "newPolyFacetWarpDisp" 0
 -iv "newPolyHoleFacesHilite" 0
 -iv "newPolyMaterialBlend" 1;
optionVar
 -fv "newPolyNormalSize" 0.4
 -iv "newPolyNumEdgeDisp" 0
 -iv "newPolyNumFacetDisp" 0
 -iv "newPolyNumUvDisp" 0
 -iv "newPolyNumVertexDisp" 0
 -fv "newPolyUVSize" 4
 -iv "newPolyVertexNormals" 0
 -fv "newPolyVertexSize" 3
 -iv "newPolyVtxBackCull" 1
 -iv "newPolyVtxDisp" 0;
optionVar
 -sv "newScenePanelConfiguration" "Single Perspective View"
 -iv "newSurfaceDisplayCV" 0
 -iv "newSurfaceDisplayEP" 0
 -iv "newSurfaceDisplayHull" 0
 -iv "newSurfaceDisplayOrigin" 0
 -iv "nodeEdAddNewNodes" 1
 -iv "nodeEdAdditiveGraphingMode" 0
 -iv "nodeEdAutoSizeNodes" 1
 -iv "nodeEdConnectNodeOnCreation" 0
 -iv "nodeEdConnectOnDrop" 0;
optionVar
 -iv "nodeEdConsistentNodeNameSize" 1
 -iv "nodeEdCopyConnectionsOnPaste" 1
 -iv "nodeEdDefaultNodeViewMode" 0
 -iv "nodeEdDefaultPinnedState" 0
 -iv "nodeEdExtendToShapes" 1
 -iv "nodeEdGridSnapping" 0
 -iv "nodeEdGridVisibility" 1
 -iv "nodeEdHighlightConnectionsBifrost" 1
 -iv "nodeEdHighlightConnectionsRegular" 0
 -iv "nodeEdIgnoreAssets" 1;
optionVar
 -iv "nodeEdLODLimit" 1000
 -sv "nodeEdLayoutEngine" "slate"
 -ca "nodeEdNoImplicitAddTypes"
 -sva "nodeEdNoImplicitAddTypes" "defaultRenderingList"
 -sva "nodeEdNoImplicitAddTypes" "defaultTextureList"
 -sva "nodeEdNoImplicitAddTypes" "mentalrayFramebuffer"
 -sva "nodeEdNoImplicitAddTypes" "mentalrayGlobals"
 -sva "nodeEdNoImplicitAddTypes" "mentalrayItemsList"
 -sva "nodeEdNoImplicitAddTypes" "mentalrayOptions"
 -sva "nodeEdNoImplicitAddTypes" "hikSolver"
 -sva "nodeEdNoImplicitAddTypes" "ikRPsolver"
 -sva "nodeEdNoImplicitAddTypes" "ikSCsolver"
 -sva "nodeEdNoImplicitAddTypes" "ikSplineSolver"
 -iv "nodeEdSaveGraphInfoWithPanel" 1
 -iv "nodeEdShowNamespace" 1
 -iv "nodeEdShowSGShapes" 0
 -iv "nodeEdShowShapes" 1
 -iv "nodeEdShowTransforms" 1
 -iv "nodeEdSyncedSelection" 1
 -iv "nodeEdUseAssetsAndPublishedAttributes" 1;
optionVar
 -iv "numShelves" 14
 -iv "nurbsPrimitiveAsToolExitOnComplete" 1
 -sv "nurbsSelect" "selectContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" nurbsSelect"
 -iv "objectDetailsVisibility" 0
 -iv "oneTimeDefaultPluginLoad2008Ext2" 1
 -iv "oneTimeDefaultPluginLoad2011" 1
 -iv "oneTimeDefaultPluginLoad2011AdvantagePack" 1
 -iv "oneTimeDefaultPluginLoad2012" 1
 -iv "oneTimeDefaultPluginLoad2013" 1
 -iv "oneTimeDefaultPluginLoad2013Update" 1;
optionVar
 -iv "oneTimeDefaultPluginLoad2014" 1
 -iv "oneTimeDefaultPluginLoad2014Update" 1
 -iv "oneTimeDefaultPluginLoad2015" 1
 -iv "oneTimeDefaultPluginLoad2015Ext1" 1
 -iv "oneTimeDefaultPluginLoad2016" 1
 -iv "oneTimeDefaultPluginLoad2016Ext1" 1
 -iv "oneTimeDefaultPluginLoad2016Ext2" 1
 -iv "oneTimeDefaultPluginLoad2017" 1
 -iv "oneTimeDefaultPluginLoad2018" 1
 -iv "oneTimeDefaultPluginLoad50" 1;
optionVar
 -iv "oneTimeDefaultPluginLoad65" 1
 -iv "oneTimeDefaultPluginLoad70" 1
 -iv "oneTimeDefaultPluginUnload2008sp1" 1
 -iv "oneTimeUnlimitedPluginLoad30" 1
 -ca "optionvarCustomCurvesTypeBevel"
 -sva "optionvarCustomCurvesTypeBevel" ""
 -sva "optionvarCustomCurvesTypeBevel" ""
 -sva "optionvarCustomCurvesTypeBevel" ""
 -sva "optionvarCustomCurvesTypeBevel" ""
 -sva "optionvarCustomCurvesTypeBevel" ""
 -sva "optionvarCustomCurvesTypeBevel" ""
 -sva "optionvarCustomCurvesTypeBevel" ""
 -sva "optionvarCustomCurvesTypeBevel" ""
 -sva "optionvarCustomCurvesTypeBevel" ""
 -sva "optionvarCustomCurvesTypeBevel" ""
 -sva "optionvarCustomCurvesTypeBevel" ""
 -sva "optionvarCustomCurvesTypeBevel" ""
 -ca "optionvarCustomCurvesTypeExtrude"
 -sva "optionvarCustomCurvesTypeExtrude" ""
 -sva "optionvarCustomCurvesTypeExtrude" ""
 -sva "optionvarCustomCurvesTypeExtrude" ""
 -sva "optionvarCustomCurvesTypeExtrude" ""
 -sva "optionvarCustomCurvesTypeExtrude" ""
 -sva "optionvarCustomCurvesTypeExtrude" ""
 -sva "optionvarCustomCurvesTypeExtrude" ""
 -sva "optionvarCustomCurvesTypeExtrude" ""
 -sva "optionvarCustomCurvesTypeExtrude" ""
 -sva "optionvarCustomCurvesTypeExtrude" ""
 -sva "optionvarCustomCurvesTypeExtrude" ""
 -sva "optionvarCustomCurvesTypeExtrude" ""
 -sv "outTangentType" "auto"
 -sv "paramDimContext" "paramDimContext -e -image1 \"paramDim.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" paramDimContext"
 -iv "particleCountVisibility" 0
 -sv "performanceSettingBindSkinAndFlexors" "0";
optionVar
 -sv "performanceSettingBlendShapes" "0"
 -sv "performanceSettingClusterResolution" "0"
 -sv "performanceSettingClusters" "0"
 -sv "performanceSettingFlexors" "0"
 -fv "performanceSettingGlobalClusterResolution" 5
 -fv "performanceSettingGlobalLatticeResolution" 0.01
 -sv "performanceSettingLatticeResolution" "0"
 -sv "performanceSettingLattices" "0"
 -sv "performanceSettingPaintEffects" "0"
 -sv "performanceSettingSculpts" "0";
optionVar
 -sv "performanceSettingStitchSurfaces" "0"
 -sv "performanceSettingTrimDisplay" "0"
 -sv "performanceSettingWires" "0"
 -iv "planarTrimPolys" 0
 -fv "playbackMax" 120
 -fv "playbackMaxDefault" 120
 -fv "playbackMaxRange" 200
 -fv "playbackMaxRangeDefault" 200
 -fv "playbackMin" 1
 -fv "playbackMinDefault" 1;
optionVar
 -fv "playbackMinRange" 1
 -fv "playbackMinRangeDefault" 1
 -iv "playbackRangeVisible" 1
 -sv "playblastFile" "playblast"
 -sv "polyAppendFacetContext" "polyAppendFacetCtx -e -image1 \"polyAppendFacet.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -append 1\n-subdivision 1\n-texture 1\n-rotate 0\n-isRotateAvailable 0\n-planarConstraint 1\n-maximumNumberOfPoints -1\npolyAppendFacetContext"
 -iv "polyAutoConvertAction" 1
 -iv "polyAutoInstallAction" 0
 -iv "polyAutoShowColorPerVertex" 1
 -iv "polyCount" 0
 -iv "polyCountVisibility" 0;
optionVar
 -sv "polyCreaseContext" "polyCreaseCtx -e -image1 \"polyCrease.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -extendSelection 0\n-relative 0\npolyCreaseContext"
 -sv "polyCreateFacetContext" "polyCreateFacetCtx -e -image1 \"polyCreateFacet.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -append 0\n-subdivision 1\n-texture 1\n-planarConstraint 1\n-maximumNumberOfPoints -1\npolyCreateFacetContext"
 -iv "polyCreateMeshesSingleSided" 0
 -sv "polyCutContext" "polyCutCtx -e -image1 \"polyCut.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -deleteFaces 0\n-extractFaces 0\n-extractOffset 0.5 0.5 0.5 polyCutContext"
 -fv "polyDefaultTangentSmoothingAngle" 0
 -iv "polyDefaultTangentSpace" 0
 -iv "polyDisplayDisplayBackfaceCulling" 0
 -iv "polyDisplayHardEdgeBackfaceCulling" 0
 -iv "polyDisplayLimitedToSelectedOV" 1
 -iv "polyDisplayWireBackfaceCulling" 0;
optionVar
 -iv "polyFaceSensitive" 1
 -iv "polyKeepFacetsGrouped" 1
 -sv "polyMergeEdgeContext" "polyMergeEdgeCtx -e -image1 \"polyMergeEdge.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -constructionHistory 1\n-caching 0\n-frozen 0\n-nodeState 0\n-mergeMode 1\n-firstEdge 0\n-secondEdge 0\n-mergeTexture 0\npolyMergeEdgeContext"
 -sv "polyMergeFacetContext" "polyMergeFacetCtx -e -image1 \"polyMergeFacet.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -constructionHistory 1\n-caching 0\n-frozen 0\n-nodeState 0\n-mergeMode 6\n-firstFacet 0\n-secondFacet 0\npolyMergeFacetContext"
 -sv "polyMergeVertexContext" "targetWeldCtx -e -image1 \"weld_NEX32.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -mergeToCenter 0\npolyMergeVertexContext"
 -iv "polyPrimitiveAsToolExitOnComplete" 1
 -sv "polySelectContext" "polySelectCtx -e -image1 \"polySelectTool.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -mode 1\npolySelectContext"
 -sv "polySelectEditContext" "polySelectEditCtx -e -image1 \"polySplitEdgeRing.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -mode 1\n-autoComplete 1\n-divisions 2\n-useEqualMultiplier 1\n-fixQuads 1\n-smoothingAngle 30\n-splitType 1\n-insertWithEdgeFlow 0\n-adjustEdgeFlow 1\npolySelectEditContext"
 -sv "polySlideEdgeContext" "polySlideEdgeCtx -e -image1 \"slideEdgeTool.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -edgeDirection 0\n-direction 0\n-absolute 0\n-useSnapping 1\n-snappingTolerance 0.1\n-snappingPoints 1\npolySlideEdgeContext"
 -sv "polySplitContext" "polySplitCtx -e -image1 \"polySplitFacet.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -subdivision 1\n-precsnap 10\n-magnetsnap 1\n-enablesnap 1\n-snaptoedge 1\n-smoothingangle 0\npolySplitContext";
optionVar
 -sv "polySplitContext2" "polySplitCtx2 -e -image1 \"polySplitFacet.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -edgeMagnets 1\n-snappingTolerance 2\n-constrainToEdges 1\n-detachEdges 0\n-snappedToEdgeColor 1 0 0 -snappedToFaceColor 0 0 1 -snappedToVertexColor 0 1 0 -snappedToMagnetColor 1 0 0 -highlightPointColor 1 0.5 0 -splitLineColor 1 0.5 0 -insertWithEdgeFlow 0\n-adjustEdgeFlow 1\npolySplitContext2"
 -sv "polyVertexNormalEdit" "polyVertexNormalCtx -e -image1 \"vertexNormalEdit.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -rotatemode 0\n-relativemode 0\n-lockmode 0\npolyVertexNormalEdit"
 -iv "popUpHelpMode" 1
 -iv "popUpSimpleHelpMode" 0
 -iv "popupMenuSelection" 0
 -ca "poseEditorTreeViewSelection"
 -sva "poseEditorTreeViewSelection" ""
 -sva "poseEditorTreeViewSelection" ""
 -sva "poseEditorTreeViewSelection" ""
 -sva "poseEditorTreeViewSelection" ""
 -sva "poseEditorTreeViewSelection" ""
 -sva "poseEditorTreeViewSelection" ""
 -fv "positionalTolerance" 0.01
 -iv "preSelectHilite" 1
 -sv "preferredRenderer" "arnold"
 -sv "preferredRendererFallback" "arnold";
optionVar
 -iv "preferredRendererSet" 1
 -iv "prepopulateController" 1
 -sv "proxyOptionsNewProxyTag" ""
 -sv "proxyOptionsNewReferenceTag" ""
 -sv "proxyOptionsProxyTag" ""
 -sv "proxyOptionsReferenceTag" ""
 -iv "proxyOptionsUseNewProxyTag" 1
 -iv "proxyOptionsUseNewReferenceTag" 1
 -iv "quadDrawAutoWeld" 1
 -iv "quadDrawAutoWeldTolerance" 10;
optionVar
 -iv "quadDrawExtend" 0
 -fv "quadDrawMeshAlpha" 0.75
 -ca "quadDrawMeshColorOverride"
 -fva "quadDrawMeshColorOverride" 0
 -fva "quadDrawMeshColorOverride" 0.33
 -fva "quadDrawMeshColorOverride" 1
 -fv "quadDrawMeshOffset" 0
 -iv "quadDrawOverlayAppendMesh" 1
 -ca "quadDrawOverlayAppendMeshColor"
 -fva "quadDrawOverlayAppendMeshColor" 0
 -fva "quadDrawOverlayAppendMeshColor" 0
 -fva "quadDrawOverlayAppendMeshColor" 0
 -fva "quadDrawOverlayAppendMeshColor" 1
 -iv "quadDrawRelax" 3
 -iv "quadDrawSnapToBackfaces" 0
 -iv "quadDrawStripSize" 20
 -iv "quadDrawUseMeshAlpha" 1;
optionVar
 -iv "quadDrawUseMeshColorOverride" 1
 -iv "quadDrawUseMeshOffset" 0
 -sv "quickFieldMode" "Abs"
 -ca "quickPanelButtonLayout"
 -sva "quickPanelButtonLayout" "Single Perspective View"
 -sva "quickPanelButtonLayout" "Four View"
 -sva "quickPanelButtonLayout" "Front/Persp"
 -sva "quickPanelButtonLayout" "Persp/Graph/Hypergraph"
 -iv "rebuildSurfacePolys" 0
 -iv "refAnimCurvesEditable" 0
 -iv "refLockEditable" 0
 -iv "refreshMode" 0
 -sv "regionSelectKeyContext" "regionSelectKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" regionSelectKeyContext"
 -iv "renderLayerMerge" 0;
optionVar
 -iv "renderSetupEnable" 1
 -iv "renderViewAutoRenderRegion" 0
 -iv "renderViewAutoResize" 1
 -iv "renderViewRenderAllLayers" 0
 -iv "renderViewRenderLayersMode" 0
 -iv "renderViewRenderSelectedObj" 0
 -iv "renderViewTestResolution" 1
 -sv "renderWindowSelectContextItem" "renderWindowSelectContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" renderWindowSelectContextItem"
 -sv "renderedImageName" "test"
 -sv "retimeKeyContext" "retimeKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -snapOnFrame 0\nretimeKeyContext";
optionVar
 -iv "revolveOutputPolygons" 0
 -sv "rollContext" "rollCtx -e -image1 \"roll.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 0\n-toolName \"Roll Tool\" -rollScale 1\nrollContext"
 -iv "rotationInterpolationDefault" 1
 -iv "saveActionsPreferences" 1
 -iv "saveActionsScriptEditor" 1
 -iv "saveWindowPos" 1
 -sv "scaleKeyContext" "scaleKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -type \"manip\" -scaleSpecifiedKeys 1\nscaleKeyContext"
 -iv "sceneTimecodeVisibility" 0
 -iv "searchFieldDelay" 1000
 -iv "selectAffectsActive" 1;
optionVar
 -iv "selectClickDrag" 0
 -sv "selectKeyContext" "selectKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" selectKeyContext"
 -sv "selectKeyframeRegionContext" "selectKeyframeRegionCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" selectKeyframeRegionContext"
 -iv "selectPrefAutoUseDepth" 0
 -iv "selectPrefPreSelectBackfacing" 1
 -iv "selectPrefPreSelectClosest" 1
 -sv "selectPrefPriorityMode" "animation"
 -iv "selectPrefUseDepth" 0
 -iv "selectSingleMarquee" 0
 -iv "selectedShelf" 2;
optionVar
 -iv "selectionChildHighlightMode" 0
 -iv "seqDoubleClickSetTimeRange" 1
 -sv "setEditContext" "setEditCtx -e -image1 \"setEdit.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" setEditContext"
 -sv "setKeyContext" "setKeyCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -breakdown 0\nsetKeyContext"
 -iv "shadeTemplates" 0
 -sv "shelfAlign1" "left"
 -sv "shelfAlign10" "left"
 -sv "shelfAlign11" "left"
 -sv "shelfAlign12" "left"
 -sv "shelfAlign13" "left";
optionVar
 -sv "shelfAlign14" "left"
 -sv "shelfAlign2" "left"
 -sv "shelfAlign3" "left"
 -sv "shelfAlign4" "left"
 -sv "shelfAlign5" "left"
 -sv "shelfAlign6" "left"
 -sv "shelfAlign7" "left"
 -sv "shelfAlign8" "left"
 -sv "shelfAlign9" "left"
 -sv "shelfFile1" "shelf_CurvesSurfaces";
optionVar
 -sv "shelfFile10" "shelf_Arnold"
 -sv "shelfFile11" "shelf_Bifrost"
 -sv "shelfFile12" "shelf_MASH"
 -sv "shelfFile13" "shelf_MotionGraphics"
 -sv "shelfFile14" "shelf_XGen"
 -sv "shelfFile2" "shelf_Polygons"
 -sv "shelfFile3" "shelf_Sculpting"
 -sv "shelfFile4" "shelf_Rigging"
 -sv "shelfFile5" "shelf_Animation"
 -sv "shelfFile6" "shelf_Rendering";
optionVar
 -sv "shelfFile7" "shelf_FX"
 -sv "shelfFile8" "shelf_FXCaching"
 -sv "shelfFile9" "shelf_Custom"
 -sv "shelfItemSize" "Small"
 -sv "shelfItemStyle" "iconOnly"
 -iv "shelfLoad1" 0
 -iv "shelfLoad10" 1
 -iv "shelfLoad11" 1
 -iv "shelfLoad12" 1
 -iv "shelfLoad13" 1;
optionVar
 -iv "shelfLoad14" 1
 -iv "shelfLoad2" 1
 -iv "shelfLoad3" 0
 -iv "shelfLoad4" 0
 -iv "shelfLoad5" 0
 -iv "shelfLoad6" 0
 -iv "shelfLoad7" 0
 -iv "shelfLoad8" 0
 -iv "shelfLoad9" 0
 -sv "shelfName1" "CurvesSurfaces";
optionVar
 -sv "shelfName10" "Arnold"
 -sv "shelfName11" "Bifrost"
 -sv "shelfName12" "MASH"
 -sv "shelfName13" "MotionGraphics"
 -sv "shelfName14" "XGen"
 -sv "shelfName2" "Polygons"
 -sv "shelfName3" "Sculpting"
 -sv "shelfName4" "Rigging"
 -sv "shelfName5" "Animation"
 -sv "shelfName6" "Rendering";
optionVar
 -sv "shelfName7" "FX"
 -sv "shelfName8" "FXCaching"
 -sv "shelfName9" "Custom"
 -iv "shelfTabsVisible" 1
 -sv "shelfVersion1" "2010"
 -sv "shelfVersion2" "2010"
 -sv "shelfVersion3" "2016"
 -sv "shelfVersion4" "2016"
 -sv "shelfVersion5" "2010"
 -sv "shelfVersion6" "2010";
optionVar
 -sv "shelfVersion7" "2010"
 -sv "shelfVersion8" "2010"
 -sv "shelfVersion9" "2010"
 -sv "shelvesLastUpdated" "2018"
 -iv "showCustomMenuSetsMenusInHotBox" 0
 -iv "showGrid" 1
 -iv "showHighlightNewFeaturesWindowOnStartup" 0
 -iv "showIconsInMenus" 1
 -iv "showLineNumbersIsOn" 1
 -sv "showManip3D" "";
optionVar
 -sv "showManipTextureContext" "texManipContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" showManipTextureContext"
 -iv "showStatusFiles" 1
 -iv "showStatusHistory" 0
 -iv "showStatusIPMButton" 1
 -iv "showStatusInputField" 0
 -iv "showStatusRender" 1
 -iv "showStatusSelectMasks" 0
 -iv "showStatusSelectMode" 1
 -iv "showStatusSelectionSet" 0
 -iv "showStatusSnap" 1;
optionVar
 -iv "showStatusSymmetry" 1
 -sv "skinBindingContext" "skinBindCtx -e -image1 \"interactiveBindTool.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -colorRamp \"1,0,0,1,1,1,0.5,0,0.75,1,1,1,0,0.5,1,0,1,0,0.25,1,0,0,1,0,1\" -falloffCurve \"0,1,2,1,0.5,2,1,0,2\" -displayInactiveMode 0\n-displayNormalized 0\n-symmetry 0\n-about \"world\" -axis \"x\" -tolerance 0.1\nskinBindingContext"
 -iv "smallFontSize" 10
 -ca "smpContinuity"
 -fva "smpContinuity" 1
 -fva "smpContinuity" 1
 -ca "smpDisplaySmoothMesh"
 -iva "smpDisplaySmoothMesh" 0
 -iva "smpDisplaySmoothMesh" 0
 -ca "smpDisplaySubdComps"
 -iva "smpDisplaySubdComps" 0
 -iva "smpDisplaySubdComps" 0
 -ca "smpKeepBorder"
 -iva "smpKeepBorder" 0
 -iva "smpKeepBorder" 0
 -ca "smpKeepHardEdge"
 -iva "smpKeepHardEdge" 0
 -iva "smpKeepHardEdge" 0
 -ca "smpKeepMapBorders"
 -iva "smpKeepMapBorders" 1
 -iva "smpKeepMapBorders" 1
 -ca "smpPropagateEdgeHardness"
 -iva "smpPropagateEdgeHardness" 0
 -iva "smpPropagateEdgeHardness" 0;
optionVar
 -iv "smpSizeOfMeshForWarning" 15000
 -iv "smpSizeWarningDisabledForAllPolys" 0
 -ca "smpSmoothLevel"
 -iva "smpSmoothLevel" 2
 -iva "smpSmoothLevel" 2
 -ca "smpSmoothMeshSelectionMode"
 -iva "smpSmoothMeshSelectionMode" 0
 -iva "smpSmoothMeshSelectionMode" 0
 -ca "smpSmoothUVs"
 -iva "smpSmoothUVs" 1
 -iva "smpSmoothUVs" 1
 -iv "snapMagnet" 0
 -fv "snapMagnetTolerance" 0.1
 -sv "snapTogetherToolCtx" "snapTogetherCtx -e -image1 \"snapTogetherTool.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -setOrientation 1\n-clearSelection 1\n-snapPolygonFace 0\nsnapTogetherToolCtx"
 -iv "snapTolerance" 20
 -iv "snapUVTolerance" 25;
optionVar
 -iv "squareSrfPolys" 0
 -iv "stackTraceIsOn" 0
 -fv "stackedCurvesSpace" 0.2
 -iv "statusLineVisible" 1
 -iv "subdivComponentDisplayStyle" 0
 -iv "sweepOutputPolygons" 0
 -iv "symmetricModellingAllowPartial" 1
 -sv "symmetricModellingAxisOption" "x"
 -iv "symmetricModellingOption" 0
 -sv "symmetricModellingSeamFalloffCurve" "0,1,2,1,0,2";
optionVar
 -iv "symmetricModellingSeamOption" 1
 -fv "symmetricModellingSeamTolerance" 0.01
 -sv "symmetricModellingSpaceOption" "object"
 -fv "symmetricModellingToleranceValue" 0.1
 -iv "symmetryVisibility" 1
 -fv "tangentialTolerance" 0.1
 -sv "texCutUVContext" "texCutContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -size 0.04\n-edgeSelectSensitive 0.2\n-steadyStrokeDistance 0.1\n-steadyStroke 0\n-moveRatio 0.1\n-mode \"Cut\" -displayShellBorders 0\n-touchToSew 0\ntexCutUVContext"
 -sv "texLatticeDeformCtx" "texLatticeDeformContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -latticeColumns 3\n-latticeRows 3\n-envelope 1\n-snapPixelMode 0\n-useBoundingRect 1\n-showMoveManipulator 1\ntexLatticeDeformCtx"
 -sv "texMoveContext" "texMoveContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -snapComponentsRelative 1\n-snap 0\n-snapValue 0.1\n-snapPixelMode 1\n-tweakMode 0\n-editPivotMode 0\ntexMoveContext"
 -sv "texMoveUVShellCtx" "texMoveUVShellContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -mask 1\n-iterations 16\n-shellBorder 0.3\ntexMoveUVShellCtx";
optionVar
 -sv "texRotateContext" "texRotateContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -snap 0\n-snapRelative 0\n-snapValue 15\n-tweakMode 0\n-editPivotMode 0\ntexRotateContext"
 -sv "texScaleContext" "texScaleContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -snap 0\n-snapRelative 0\n-snapValue 1\n-preventNegativeScale 1\n-tweakMode 0\n-editPivotMode 0\ntexScaleContext"
 -sv "texSmoothCtx" "texSmoothContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -pinBorder 0\n-space 1\ntexSmoothCtx"
 -sv "texSmudgeUVCtx" "texSmudgeUVContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -effectType \"fixed\" -functionType \"exponential\" -radius 0.075\n-pressure 0.01\n-dragSlider \"none\" -smudgeIsMiddle 0\ntexSmudgeUVCtx"
 -sv "texTweakContext" "texTweakUVContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -tolerance 10 texTweakContext"
 -iv "timeChangeUndoConsolidation" 1
 -sv "timeDisplayMode" "frame"
 -iv "timeEditorAllowConstraintsOverride" 0
 -iv "timeEditorGranularity" 200
 -iv "timeEditorHUD" 1;
optionVar
 -iv "timeEditorMinimumClipWidth" 8
 -iv "timeEditorSnapTolerance" 10
 -iv "timeSliderHeight" 28
 -fv "timeSliderMaxPlaySpeed" 0
 -fv "timeSliderPlayBy" 1
 -sv "timeSliderPlayLoop" "continuous"
 -fv "timeSliderPlaySpeed" 0
 -sv "timeSliderPlayView" "active"
 -fv "timeSliderRepeatChunk" 1
 -iv "timeSliderRepeatOnHold" 0;
optionVar
 -sv "timeSliderShowFrames" "active"
 -sv "timeSliderShowKeys" "active"
 -iv "timeSliderShowKeysCombined" 0
 -iv "timeSliderSnapping" 1
 -sv "timeSliderSoundDisplay" "both"
 -iv "timeSliderTickSize" 1
 -iv "timeSliderTickSpan" 0
 -iv "timeSliderVisible" 1
 -iv "toggleOriginAxis" 0
 -iv "toolMessageHorizontalOffset" 0;
optionVar
 -fv "toolMessageTime" 0.7
 -iv "toolMessageVerticalOffset" -40
 -iv "toolMessageVisible" 1
 -iv "toolSettingsVisible" 0
 -iv "toolboxVisible" 1
 -fv "totalAnimateRollTime" 0.5
 -sv "track2dContext" "view2dToolCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 0\n-toolName \"2d View\" track2dContext"
 -sv "trackContext" "trackCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 1\n-toolName \"Track Tool\" -trackGeometry 0\n-trackScale 1\ntrackContext"
 -iv "trackpadSetting" 1
 -sv "tracktwContext" "texWinToolCtx -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 0\n-toolName \"UV Editor\" tracktwContext";
optionVar
 -sv "transformTexSelectContext" "texSelectContext -e -image1 \"vacantCell.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" transformTexSelectContext"
 -iv "trsManipsPinPivot" 0
 -iv "trsManipsPreserveChildPosition" 0
 -iv "trsManipsPreserveUvs" 0
 -iv "trsManipsSnapPivotOri" 1
 -iv "trsManipsSnapPivotPos" 1
 -iv "trsManipsTweakMode" 0
 -sv "trsManipsXformConstraint" "none"
 -iv "trsManipsXformConstraintAlongNormal" 1
 -sv "tumbleContext" "tumbleCtx -e -image1 \"tumble.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 1\n-toolName \"Tumble Tool\" -tumbleScale 1\n-objectTumble 0\n-localTumble 1\n-autoSetPivot 0\n-autoOrthoConstrain 1\n-orthoStep 5\n-orthoLock 1\ntumbleContext";
optionVar
 -iv "uiPrecision" 4
 -iv "undoIsEnabled" 1
 -iv "undoIsInfinite" 0
 -iv "undoLength" 50
 -sv "upAxisDirection" "y"
 -iv "useDefaultFileExtensions" 1
 -iv "useMultiTouchGestures" 1
 -iv "useNewScenePanelConfig" 1
 -iv "useSaveScenePanelConfig" 1
 -iv "useScenePanelConfig" 1;
optionVar
 -iv "useScrollWheel" 1
 -iv "useSnapTolerance" 0
 -sv "userDefinedImageViewerCmdForImage" ""
 -sv "userDefinedImageViewerCmdForSequence" ""
 -iv "viewAxisVisibility" 1
 -fv "viewCubeCompassAngle" 0
 -iv "viewCubeFitToView" 1
 -fv "viewCubeInactiveOpacity" 0.5
 -iv "viewCubePreserveSceneUp" 1
 -sv "viewCubeScreenPosition" "topRight";
optionVar
 -iv "viewCubeShowCompass" 0
 -iv "viewCubeShowCube" 1
 -sv "viewCubeSize" "normal"
 -iv "viewCubeSnapToClosest" 1
 -iv "viewportRenderer" 2
 -iv "viewportRendererVisibility" 0
 -iv "vp2PauseState" 0
 -sv "vp2RenderingEngine" "OpenGLCoreProfile"
 -sv "walkContext" "walkCtx -e -image1 \"walk.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 0\n-toolName \"Walk Tool\" -walkToolHud 1\n-walkSpeed 1\n-walkHeight 3\n-walkSensitivity 1\n-crouchCount 3\nwalkContext"
 -iv "weightedTangents" 0;
optionVar
 -sv "wireCtx" "wireContext -e -image1 \"wire.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -holder 0\n-groupWithBase 0\n-envelope 1\n-crossingEffect 0\n-dropoffDistance 1\n-localInfluence 0\n-deformationOrder \"Default\" -exclusivePartition \"deformPartition\" -exclusive 0\nwireCtx"
 -iv "wireframeOnShadedActive" 1
 -sv "workingUnitAngular" "deg"
 -sv "workingUnitAngularDefault" "deg"
 -sv "workingUnitLinear" "cm"
 -sv "workingUnitLinearDefault" "cm"
 -sv "workingUnitTime" "film"
 -sv "workingUnitTimeDefault" "film"
 -sv "workspaceLayoutToLoadOnStartup" "Maya Classic"
 -iv "workspaceLinkHotKeySetEnabled" 0;
optionVar
 -sv "workspaceLinkHotKeySetValue" "Maya_Default"
 -iv "workspaceLinkMenuSetEnabled" 1
 -sv "workspaceLinkMenuSetValue" "modelingMenuSet"
 -iv "workspaceLinkVP2PresetEnabled" 0
 -iv "workspacesAutoSave" 1
 -iv "workspacesDockingDelayTime" 300
 -iv "workspacesInFullScreenUIMode" 0
 -iv "workspacesInZoomInUIMode" 0
 -iv "workspacesLockDocking" 0
 -iv "workspacesNarrowPanelInitialHeight" 800;
optionVar
 -iv "workspacesNarrowPanelInitialWidth" 260
 -iv "workspacesWidePanelInitialHeight" 800
 -iv "workspacesWidePanelInitialWidth" 460
 -sv "wrinkleCtx" "wrinkleContext -e -image1 \"wrinkle.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -style \"radial\" -wrinkleCount 3\n-branchCount 2\n-branchDepth 0\n-wrinkleIntensity 0.5\n-thickness 1\n-randomness 0.2\nwrinkleCtx"
 -iv "xgenPtexCacheSize" 500
 -iv "xgenThreadingGen" 1
 -iv "xgenVP2DrawMethod" 1
 -iv "xgenXPDCacheSize" 100
 -sv "yawPitchContext" "orbitCtx -e -image1 \"yawPitch.png\" -image2 \"vacantCell.png\" -image3 \"vacantCell.png\" -alternateContext 0\n-toolName \"Yaw-Pitch Tool\" -orbitScale 1\n-localOrbit 0\nyawPitchContext";

panelConfiguration -label (localizedPanelLabel("Current Layout")) 
	-userCreated false
	-defaultImage ""
	-image ""
	-sc false
	-configString "paneLayout -e -cn \"single\" $gMainPane"
	-ap false
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Perspective\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -e -label (localizedPanelLabel(\"Perspective\")) -cam `findStartUpCamera persp` $panelName";
panelConfiguration -label (localizedPanelLabel("Single Perspective View")) 
	-userCreated false
	-defaultImage "singlePerspLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -e -cn \"single\" $gMainPane"
	-ap true
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Perspective\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -e -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp` $panelName";
panelConfiguration -label (localizedPanelLabel("Four View")) 
	-userCreated false
	-defaultImage "fourViewLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -e -cn \"quad\" $gMainPane"
	-ap true
		(localizedPanelLabel("Top View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Top View\")) -cam `findStartUpCamera top`;}"
		"modelPanel -e -label (localizedPanelLabel(\"Top View\")) -cam `findStartUpCamera top` $panelName"
	-ap true
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Perspective\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -e -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp` $panelName"
	-ap true
		(localizedPanelLabel("Side View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Side View\")) -cam `findStartUpCamera side`;}"
		"modelPanel -e -label (localizedPanelLabel(\"Side View\")) -cam `findStartUpCamera side` $panelName"
	-ap true
		(localizedPanelLabel("Front View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Front View\")) -cam `findStartUpCamera front`;}"
		"modelPanel -e -label (localizedPanelLabel(\"Front View\")) -cam `findStartUpCamera front` $panelName";
panelConfiguration -label (localizedPanelLabel("Front/Persp")) 
	-userCreated false
	-defaultImage "twoViewVerticalLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -e -cn \"vertical2\" $gMainPane"
	-ap true
		(localizedPanelLabel("Front View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Front View\")) -cam `findStartUpCamera front`;}"
		"modelPanel -e -label (localizedPanelLabel(\"Front View\")) -cam `findStartUpCamera front` $panelName"
	-ap true
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Perspective\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -e -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp` $panelName";
panelConfiguration -label (localizedPanelLabel("Persp/Hypergraph")) 
	-userCreated false
	-defaultImage "perspHypergraphLayout.png"
	-image ""
	-sc false
	-configString "global string $gMainPane; paneLayout -e -cn \"horizontal2\" -ps 1 100 64 -ps 2 100 36 $gMainPane;"
	-ap true
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Perspective\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -e -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp` $panelName"
	-ap false
		(localizedPanelLabel("Hypergraph")) 
		"hyperGraphPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t  scriptedPanel -mbv $gUseMenusInPanels -type hyperGraphPanel -unParent -label (localizedPanelLabel(\"Hypergraph\"));}"
		"scriptedPanel -e -label (localizedPanelLabel(\"Hypergraph\")) $panelName";
panelConfiguration -label (localizedPanelLabel("Persp/Graph/Hypergraph")) 
	-userCreated false
	-defaultImage "perspGraphHypergraphLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -e -cn \"top3\" $gMainPane"
	-ap true
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Perspective\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -e -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp` $panelName"
	-ap true
		(localizedPanelLabel("Hypergraph")) 
		"hyperGraphPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t  scriptedPanel -mbv $gUseMenusInPanels -type hyperGraphPanel -unParent -label (localizedPanelLabel(\"Hypergraph\"));}"
		"scriptedPanel -e -label (localizedPanelLabel(\"Hypergraph\")) $panelName"
	-ap true
		(localizedPanelLabel("Graph Editor")) 
		"graphEditorPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t  scriptedPanel -mbv $gUseMenusInPanels -type graphEditor -unParent -label (localizedPanelLabel(\"Graph Editor\"));}"
		"scriptedPanel -e -label (localizedPanelLabel(\"Graph Editor\")) $panelName";
panelConfiguration -label (localizedPanelLabel("Hypershade/Render/Persp")) 
	-userCreated false
	-defaultImage "hypershadeRenderPerspLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -edit -configuration \"bottom3\" -paneSize 1 100 55 -paneSize 2 50 45 -paneSize 3 50 45 $gMainPane;"
	-ap true
		(localizedPanelLabel("Hypershade")) 
		"scriptedPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   scriptedPanel -mbv $gUseMenusInPanels\t\t\t\t   -type hyperShadePanel -unParent -label (localizedPanelLabel(\"Hypershade\"));}"
		"scriptedPanel -edit -label (localizedPanelLabel(\"Hypershade\"))  $panelName"
	-ap false
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Persp View\"))\t\t\t\t   -cam `findStartUpCamera persp`;}"
		"modelPanel -edit -label (localizedPanelLabel(\"Persp View\"))\t\t\t\t-cam `findStartUpCamera persp` $panelName"
	-ap false
		(localizedPanelLabel("Render View")) 
		"scriptedPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   scriptedPanel -mbv $gUseMenusInPanels\t\t\t\t   -type renderWindowPanel -unParent -label (localizedPanelLabel(\"Render View\"));}"
		"scriptedPanel -edit -label (localizedPanelLabel(\"Render View\"))  $panelName";
panelConfiguration -label (localizedPanelLabel("Hypershade/Outliner/Persp")) 
	-userCreated false
	-defaultImage "hypershadeOutlinerPerspLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -edit -configuration \"bottom3\" -paneSize 1 100 55 -paneSize 2 50 45 -paneSize 3 50 45 $gMainPane;"
	-ap true
		(localizedPanelLabel("Hypershade")) 
		"scriptedPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   scriptedPanel -mbv $gUseMenusInPanels -type hyperShadePanel -unParent -label (localizedPanelLabel(\"Hypershade\"));}"
		"scriptedPanel -edit -label (localizedPanelLabel(\"Hypershade\"))  $panelName"
	-ap false
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -edit -label (localizedPanelLabel(\"Persp View\"))  -cam `findStartUpCamera persp` $panelName"
	-ap false
		(localizedPanelLabel("Outliner")) 
		"outlinerPanel"
		"{global int $gUseMenusInPanels; $panelName = `outlinerPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Outliner\"))`;\t\t\t\t outlinerEditor -e -highlightActive true $panelName;}"
		"outlinerPanel -edit -label (localizedPanelLabel(\"Outliner\"))  $panelName";
panelConfiguration -label (localizedPanelLabel("Hypershade/Persp")) 
	-userCreated false
	-defaultImage "hypershadePerspLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -edit -configuration \"vertical2\" -ps 1 50 100 -ps 2 50 100 $gMainPane;"
	-ap true
		(localizedPanelLabel("Hypershade")) 
		"scriptedPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   scriptedPanel -mbv $gUseMenusInPanels -type hyperShadePanel -unParent -label (localizedPanelLabel(\"Hypershade\"));}"
		"scriptedPanel -edit -label (localizedPanelLabel(\"Hypershade\"))  $panelName"
	-ap false
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -edit -label (localizedPanelLabel(\"Persp View\"))  -cam `findStartUpCamera persp` $panelName";
panelConfiguration -label (localizedPanelLabel("Persp/Graph/Outliner")) 
	-userCreated false
	-defaultImage "perspGraphOutlinerLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -e -cn \"bottom3\" -ps 1 100 55 -ps 2 78 45 -ps 3 22 45 $gMainPane;"
	-ap true
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -edit -label (localizedPanelLabel(\"Persp View\"))  -cam `findStartUpCamera persp` $panelName"
	-ap false
		(localizedPanelLabel("Graph Editor")) 
		"scriptedPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t  scriptedPanel -mbv $gUseMenusInPanels -type graphEditor -unParent -label (localizedPanelLabel(\"Graph Editor\"));}"
		"scriptedPanel -edit -label (localizedPanelLabel(\"Graph Editor\"))  $panelName"
	-ap false
		(localizedPanelLabel("Outliner")) 
		"outlinerPanel"
		"{global int $gUseMenusInPanels; $panelName = `outlinerPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Outliner\"))`;\t\t\t\t outlinerEditor -e -highlightActive true $panelName;}"
		"outlinerPanel -edit -label (localizedPanelLabel(\"Outliner\"))  $panelName";
panelConfiguration -label (localizedPanelLabel("Persp/Trax")) 
	-userCreated false
	-defaultImage "perspTraxLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -e -cn \"horizontal2\" -ps 1 100 64 -ps 2 100 36 $gMainPane;"
	-ap true
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -edit -label (localizedPanelLabel(\"Persp View\"))  -cam `findStartUpCamera persp` $panelName"
	-ap false
		(localizedPanelLabel("Trax Editor")) 
		"scriptedPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t  scriptedPanel -mbv $gUseMenusInPanels -type clipEditorPanel -unParent -label (localizedPanelLabel(\"Trax Editor\"));}"
		"scriptedPanel -edit -label (localizedPanelLabel(\"Trax Editor\"))  $panelName";
panelConfiguration -label (localizedPanelLabel("Persp/Camera Sequencer")) 
	-userCreated false
	-defaultImage "perspTraxLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -e -cn \"horizontal2\" -ps 1 100 64 -ps 2 100 36 $gMainPane;"
	-ap true
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -edit -label (localizedPanelLabel(\"Persp View\"))  -cam `findStartUpCamera persp` $panelName"
	-ap false
		(localizedPanelLabel("Camera Sequencer")) 
		"scriptedPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t  scriptedPanel -mbv $gUseMenusInPanels -type sequenceEditorPanel -unParent -label (localizedPanelLabel(\"Camera Sequencer\"));}"
		"scriptedPanel -edit -label (localizedPanelLabel(\"Camera Sequencer\"))  $panelName";
panelConfiguration -label (localizedPanelLabel("Persp/Trax/Outliner")) 
	-userCreated false
	-defaultImage "perspTraxOutlinerLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -e -cn \"bottom3\" -ps 1 100 55 -ps 2 78 45 -ps 3 22 45 $gMainPane;"
	-ap true
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -edit -label (localizedPanelLabel(\"Persp View\"))  -cam `findStartUpCamera persp` $panelName"
	-ap false
		(localizedPanelLabel("Trax Editor")) 
		"scriptedPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t  scriptedPanel -mbv $gUseMenusInPanels -type clipEditorPanel -unParent -label (localizedPanelLabel(\"Trax Editor\"));}"
		"scriptedPanel -edit -label (localizedPanelLabel(\"Trax Editor\"))  $panelName"
	-ap false
		(localizedPanelLabel("Outliner")) 
		"outlinerPanel"
		"{global int $gUseMenusInPanels; $panelName = `outlinerPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Outliner\"))`;\t\t\t\t outlinerEditor -e -highlightActive true $panelName;}"
		"outlinerPanel -edit -label (localizedPanelLabel(\"Outliner\"))  $panelName";
panelConfiguration -label (localizedPanelLabel("Persp/Graph")) 
	-userCreated false
	-defaultImage "perspGraphLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -e -cn \"horizontal2\" -ps 1 100 46 -ps 2 100 54 $gMainPane;"
	-ap true
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -edit -label (localizedPanelLabel(\"Persp View\"))  -cam `findStartUpCamera persp` $panelName"
	-ap false
		(localizedPanelLabel("Graph Editor")) 
		"scriptedPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t  scriptedPanel -mbv $gUseMenusInPanels -type graphEditor -unParent -label (localizedPanelLabel(\"Graph Editor\"));}"
		"scriptedPanel -edit -label (localizedPanelLabel(\"Graph Editor\"))  $panelName";
panelConfiguration -label (localizedPanelLabel("Persp/Relationship Editor")) 
	-userCreated false
	-defaultImage "perspRelationshipEditorLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -e -cn \"horizontal2\" -ps 1 100 61 -ps 2 100 39 $gMainPane;"
	-ap true
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -edit -label (localizedPanelLabel(\"Persp View\"))  -cam `findStartUpCamera persp` $panelName"
	-ap false
		(localizedPanelLabel("Relationship Editor")) 
		"scriptedPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t  scriptedPanel -mbv $gUseMenusInPanels -type relationshipPanel -unParent -label (localizedPanelLabel(\"Relationship Editor\"));}"
		"scriptedPanel -edit -label (localizedPanelLabel(\"Relationship Editor\"))  $panelName";
panelConfiguration -label (localizedPanelLabel("Persp/UV Editor")) 
	-userCreated false
	-defaultImage "perspTextureLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -e -cn \"vertical2\" -ps 1 50 100 -ps 2 50 100 $gMainPane;"
	-ap true
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -edit -label (localizedPanelLabel(\"Persp View\"))  -cam `findStartUpCamera persp` $panelName"
	-ap false
		(localizedPanelLabel("UV Editor")) 
		"scriptedPanel "
		"global int $gUseMenusInPanels; $panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -label (localizedPanelLabel(\"UV Editor\")) -mbv $gUseMenusInPanels `"
		"global int $gUseMenusInPanels; scriptedPanel -edit -label (localizedPanelLabel(\"UV Editor\")) -mbv $gUseMenusInPanels $panelName";
panelConfiguration -label (localizedPanelLabel("Script Editor/Persp")) 
	-userCreated false
	-defaultImage "scriptEdPersp.png"
	-image ""
	-sc false
	-configString "paneLayout -e -cn \"vertical2\" -ps 1 50 100 -ps 2 50 100 $gMainPane;"
	-ap false
		(localizedPanelLabel("Script Editor")) 
		"scriptedPanel "
		"global int $gUseMenusInPanels; $panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -label (localizedPanelLabel(\"Script Editor\")) -mbv $gUseMenusInPanels `"
		"global int $gUseMenusInPanels; scriptedPanel -edit -label (localizedPanelLabel(\"Script Editor\")) -mbv $gUseMenusInPanels $panelName"
	-ap true
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Persp View\")) -cam `findStartUpCamera persp`;}"
		"modelPanel -edit -label (localizedPanelLabel(\"Persp View\"))  -cam `findStartUpCamera persp` $panelName";
panelConfiguration -label (localizedPanelLabel("Hypershade/Render/Persp Vertical")) 
	-userCreated false
	-defaultImage "hypershadeRenderPerspVerticalLayout.png"
	-image ""
	-sc false
	-configString "paneLayout -edit -configuration \"right3\" -paneSize 1 50 100 -paneSize 2 50 50 -paneSize 3 50 50 $gMainPane;"
	-ap true
		(localizedPanelLabel("Hypershade")) 
		"scriptedPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   scriptedPanel -mbv $gUseMenusInPanels\t\t\t\t   -type hyperShadePanel -unParent -label (localizedPanelLabel(\"Hypershade\"));}"
		"scriptedPanel -edit -label (localizedPanelLabel(\"Hypershade\"))  $panelName"
	-ap false
		(localizedPanelLabel("Render View")) 
		"scriptedPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   scriptedPanel -mbv $gUseMenusInPanels\t\t\t\t   -type renderWindowPanel -unParent -label (localizedPanelLabel(\"Render View\"));}"
		"scriptedPanel -edit -label (localizedPanelLabel(\"Render View\"))  $panelName"
	-ap false
		(localizedPanelLabel("Persp View")) 
		"modelPanel"
		"{global int $gUseMenusInPanels;\t\t\t\t   modelPanel -mbv $gUseMenusInPanels -unParent -label (localizedPanelLabel(\"Persp View\"))\t\t\t\t   -cam `findStartUpCamera persp`;}"
		"modelPanel -edit -label (localizedPanelLabel(\"Persp View\"))\t\t\t\t-cam `findStartUpCamera persp` $panelName";

interactionStyle -s maya;
freezeOptions -dn none -up none -rn 0 -rt 0 -ep 0 -inv 0 -dl 0;
autoKeyframe -state false ;
optionVar -fv gridSpacing 5 -fv gridDivisions 5 -fv gridSize 12 -intValue displayGridAxes 1 -intValue displayGridLines 1 -intValue displayDivisionLines 1 -intValue displayGridPerspLabels 0 -intValue displayGridOrthoLabels 0 -intValue displayGridAxesAccented 1 -stringValue displayGridPerspLabelPosition axis -stringValue displayGridOrthoLabelPosition edge;
nurbsToPolygonsPref -f 1 -ucr 0 -chr 0.9 -uch 0 -cht 1 -d 0.1 -es 0 -ft 0.01 -mel 0.001 -pc 200 -pt 0 -m 0 -mt 0.1 -mrt 0 -un 3 -ut 1 -vn 3 -vt 1 ;
nurbsCurveRebuildPref -fr 0 -rt 6 -d 3 -s 1 -tol 0.01 -end 1 -kr 1 -kep 1 -kt 0 -kcp 0 -scr 0;
makePaintable -ca;
makePaintable  -at "multiFloat" -sm "deformer" "bulgeMesh" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "cMuscleMultiCollide" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "cMuscleSystem" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "cMuscleStretch" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "cMuscleSplineDeformer" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "cMuscleRelative" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "cMuscleMirror" "weights";
makePaintable  -at "doubleArray" -aa "goalPP0" "particle" "goalPP";
makePaintable  -at "doubleArray" "polyReduce" "vertexWeights";
makePaintable  -at "doubleArray" "cacheFile" "perPtWeights";
makePaintable  -at "doubleArray" "skinCluster" "paintWeights";
makePaintable  -at "multiFloat" -sm "deformer" "blendShape" "baseWeights";
makePaintable  -at "multiFloat" -sm "deformer" "blendShape" "paintTargetWeights";
makePaintable  -at "multiFloat" -sm "deformer" "shrinkWrap" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "transferAttributes" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "ffd" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "proxWrap" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "tension" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "deltaMush" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "wire" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "jiggle" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "softMod" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "nonLinear" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "oceanDeformer" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "textureDeformer" "weights";
makePaintable  -at "multiFloat" -sm "deformer" "cluster" "weights";

nurbsToSubdivPref -mpc 1000 -rn 1 -mp 1 -cp 1 -st 0 -ct 1 -br 0 -o 1 -t00 1 -t01 0 -t02 0 -t10 0 -t11 1 -t12 0 -t20 0 -t21 0 -t22 1 -t30 0 -t31 0 -t32 0 ;
ikSystem -e -sn true -ar false ;

EOF

defaults write /Users/$USER/Library/Preferences/com.autodesk.MC3Framework ADAOptIn -int 1
defaults write /Users/$USER/Library/Preferences/com.autodesk.MC3Framework ADARePrompted -int 1
defaults write /Users/$USER/Library/Preferences/com.autodesk.MC3Framework OverridedByHKLM -int 0
