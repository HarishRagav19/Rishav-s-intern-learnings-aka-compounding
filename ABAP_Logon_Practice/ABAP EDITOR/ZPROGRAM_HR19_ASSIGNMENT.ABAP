REPORT ZPROGRAM_HR19_ASSIGNMENT.

TYPE-POOLS: slis.

TYPES: BEGIN OF ty_sales,
         vbeln  TYPE vbak-vbeln,
         erdat  TYPE vbak-erdat,
         vkorg  TYPE vbak-vkorg,
         kunnr  TYPE vbak-kunnr,
         name1  TYPE kna1-name1,
         matnr  TYPE vbap-matnr,
         kwmeng TYPE vbap-kwmeng,
         netwr  TYPE vbap-netwr,
         status TYPE char1,
       END OF ty_sales.

DATA: gt_sales TYPE STANDARD TABLE OF ty_sales,
      gs_sales TYPE ty_sales.

DATA: gt_fieldcat TYPE slis_t_fieldcat_alv,
      gs_fieldcat TYPE slis_fieldcat_alv,
      gs_layout   TYPE slis_layout_alv.

DATA: gv_repid TYPE sy-repid.
DATA: gv_kunnr TYPE vbak-kunnr.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE text-001.
  PARAMETERS: p_vkorg TYPE vbak-vkorg OBLIGATORY.
  SELECT-OPTIONS: s_erdat FOR sy-datum.
  SELECT-OPTIONS: s_kunnr FOR gv_kunnr.
  PARAMETERS: p_view TYPE char10 AS LISTBOX VISIBLE LENGTH 25 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

INITIALIZATION.
  PERFORM set_dropdown.


START-OF-SELECTION.
  PERFORM fetch_data.
  PERFORM validate_data.
  PERFORM apply_view.
  PERFORM build_fieldcatalog.
  PERFORM set_layout.
  PERFORM display_alv.

*---------------------------------------------------------------------*
* DROPDOWN
*---------------------------------------------------------------------*
FORM set_dropdown.
  DATA: lt_values TYPE vrm_values,
        ls_value  TYPE vrm_value.

  ls_value-key = 'BASIC'.  ls_value-text = 'Basic View'.   APPEND ls_value TO lt_values.
  ls_value-key = 'DETAIL'. ls_value-text = 'Detailed View'. APPEND ls_value TO lt_values.
  ls_value-key = 'SUMMARY'. ls_value-text = 'Summary View'. APPEND ls_value TO lt_values.

  CALL FUNCTION 'VRM_SET_VALUES'
    EXPORTING id = 'P_VIEW' values = lt_values.
ENDFORM.

*---------------------------------------------------------------------*
* FETCH DATA
*---------------------------------------------------------------------*
FORM fetch_data.

  SELECT a~vbeln a~erdat a~vkorg a~kunnr
         c~name1 b~matnr b~kwmeng b~netwr
    INTO TABLE gt_sales
    FROM vbak AS a
    INNER JOIN vbap AS b ON a~vbeln = b~vbeln
    LEFT JOIN kna1 AS c ON a~kunnr = c~kunnr
    WHERE a~vkorg = p_vkorg
      AND a~erdat IN s_erdat
      AND a~kunnr IN s_kunnr.

* 🔥 Traffic Light Logic
  LOOP AT gt_sales INTO gs_sales.
    IF gs_sales-netwr > 500.
      gs_sales-status = '3'.
    ELSEIF gs_sales-netwr > 200.
      gs_sales-status = '2'.
    ELSE.
      gs_sales-status = '1'.
    ENDIF.
    MODIFY gt_sales FROM gs_sales.
  ENDLOOP.

ENDFORM.


FORM validate_data.
  IF gt_sales IS INITIAL.
    MESSAGE 'No data found' TYPE 'I'.
    STOP.
  ENDIF.
ENDFORM.

FORM apply_view.

  DATA: lt_summary TYPE STANDARD TABLE OF ty_sales,
        ls_summary TYPE ty_sales.

  CASE p_view.

    WHEN 'BASIC'.
      SORT gt_sales BY vbeln.
      DELETE ADJACENT DUPLICATES FROM gt_sales COMPARING vbeln.

    WHEN 'DETAIL'.
      " no change

    WHEN 'SUMMARY'.
      SORT gt_sales BY kunnr.
      LOOP AT gt_sales INTO gs_sales.

        AT NEW kunnr.
          CLEAR ls_summary.
          ls_summary-kunnr = gs_sales-kunnr.
          ls_summary-name1 = gs_sales-name1.
        ENDAT.

        ls_summary-netwr = ls_summary-netwr + gs_sales-netwr.
        ls_summary-kwmeng = ls_summary-kwmeng + gs_sales-kwmeng.

        AT END OF kunnr.
          APPEND ls_summary TO lt_summary.
        ENDAT.

      ENDLOOP.

      gt_sales = lt_summary.

  ENDCASE.

ENDFORM.


FORM build_fieldcatalog.

  CLEAR gt_fieldcat.

  PERFORM add_field USING 'VBELN' 'Sales Doc' 12 'X'.
  PERFORM add_field USING 'ERDAT' 'Date' 10 ''.
  PERFORM add_field USING 'VKORG' 'Sales Org' 8 ''.
  PERFORM add_field USING 'KUNNR' 'Customer' 10 ''.
  PERFORM add_field USING 'NAME1' 'Customer Name' 20 ''.
  PERFORM add_field USING 'MATNR' 'Material' 15 ''.
  PERFORM add_field USING 'KWMENG' 'Quantity' 10 'X'.
  PERFORM add_field USING 'NETWR' 'Net Value' 15 'X'.

* 🔥 Add Status
  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'STATUS'.
  gs_fieldcat-seltext_m = 'Status'.
  gs_fieldcat-icon = 'X'.
  APPEND gs_fieldcat TO gt_fieldcat.

ENDFORM.

FORM add_field USING p_field p_text p_len p_sum.

  CLEAR gs_fieldcat.

  gs_fieldcat-fieldname = p_field.
  gs_fieldcat-seltext_m = p_text.
  gs_fieldcat-outputlen = p_len.
  gs_fieldcat-do_sum = p_sum.

  IF p_field = 'VBELN'.
    gs_fieldcat-hotspot = 'X'.
  ENDIF.

  APPEND gs_fieldcat TO gt_fieldcat.

ENDFORM.

FORM set_layout.
  gs_layout-zebra = 'X'.
  gs_layout-colwidth_optimize = 'X'.
  gs_layout-totals_text = 'Total'.
ENDFORM.

FORM display_alv.

  gv_repid = sy-repid.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program       = gv_repid
      i_callback_user_command  = 'USER_COMMAND'
      i_callback_top_of_page   = 'TOP_OF_PAGE'
      is_layout                = gs_layout
      it_fieldcat              = gt_fieldcat
    TABLES
      t_outtab                 = gt_sales.

ENDFORM.


FORM user_command USING r_ucomm LIKE sy-ucomm
                        rs_selfield TYPE slis_selfield.

  IF r_ucomm = '&IC1' AND rs_selfield-fieldname = 'VBELN'.

    READ TABLE gt_sales INTO gs_sales INDEX rs_selfield-tabindex.

    IF sy-subrc = 0.
      SET PARAMETER ID 'AUN' FIELD gs_sales-vbeln.
      CALL TRANSACTION 'VA03' AND SKIP FIRST SCREEN.
    ENDIF.

  ENDIF.

ENDFORM.


FORM top_of_page.

  DATA: lt_header TYPE slis_t_listheader,
        ls_header TYPE slis_listheader.

  ls_header-typ = 'H'.
  ls_header-info = 'Sales order Assignment Harish ragav 901919 '.
  APPEND ls_header TO lt_header.

  CALL FUNCTION 'REUSE_ALV_COMMENTARY_WRITE'
    EXPORTING it_list_commentary = lt_header.

ENDFORM.