
DECLARE EXTERNAL FUNCTION OKR2
  DOUBLE PRECISION
  RETURNS DOUBLE PRECISION BY VALUE
  ENTRY_POINT 'okr_2dig'
  MODULE_NAME 'USR_UDF';

DECLARE EXTERNAL FUNCTION NULL2ZERO
  DOUBLE PRECISION
  RETURNS DOUBLE PRECISION BY VALUE
  ENTRY_POINT 'null_2zero'
  MODULE_NAME 'USR_UDF';
