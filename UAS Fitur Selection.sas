session server;

/* Start checking for existence of each input table */
exists0=doesTableExist("CASUSER(febianus.felix@student.umn.ac.id)", "BANK_NO_OUTLIERS");
if exists0 == 0 then do;
  print "Table "||"CASUSER(febianus.felix@student.umn.ac.id)"||"."||"BANK_NO_OUTLIERS" || " does not exist.";
  print "UserErrorCode: 100";
  exit 1;
end;
print "Input table: "||"CASUSER(febianus.felix@student.umn.ac.id)"||"."||"BANK_NO_OUTLIERS"||" found.";
/* End checking for existence of each input table */


  _dp_inputTable="BANK_NO_OUTLIERS";
  _dp_inputCaslib="CASUSER(febianus.felix@student.umn.ac.id)";

  _dp_outputTable="a06cb4d7-72cc-4b8a-8cd3-19e22069af29";
  _dp_outputCaslib="CASUSER(febianus.felix@student.umn.ac.id)";

dataStep.runCode result=r status=rc / code='/* BEGIN data step with the output table                                           data */
data "a06cb4d7-72cc-4b8a-8cd3-19e22069af29" (caslib="CASUSER(febianus.felix@student.umn.ac.id)" promote="no");


    /* Set the input                                                                set */
    set "BANK_NO_OUTLIERS" (caslib="CASUSER(febianus.felix@student.umn.ac.id)"   drop="duration_Q3"n  drop="balance_Q3"n  drop="age_Q3"n  drop="duration_Q1"n  drop="balance_Q1"n  drop="age_Q1"n  drop="_FREQ_"n  drop="_TYPE_"n );

/* END data step                                                                    run */
run;
';
if rc.statusCode != 0 then do;
  print "Error executing datastep";
  exit 2;
end;
  _dp_inputTable="a06cb4d7-72cc-4b8a-8cd3-19e22069af29";
  _dp_inputCaslib="CASUSER(febianus.felix@student.umn.ac.id)";

  _dp_outputTable="BANK_FIX";
  _dp_outputCaslib="CASUSER(febianus.felix@student.umn.ac.id)";

srcCasTable="a06cb4d7-72cc-4b8a-8cd3-19e22069af29";
srcCasLib="CASUSER(febianus.felix@student.umn.ac.id)";
tgtCasTable="BANK_FIX";
tgtCasLib="CASUSER(febianus.felix@student.umn.ac.id)";
saveType="csv";
tgtCasTableLabel="";
replace=1;
saveToDisk=1;

exists = doesTableExist(tgtCasLib, tgtCasTable);
if (exists !=0) then do;
  if (replace == 0) then do;
    print "Table already exists and replace flag is set to false.";
    exit ({severity=2, reason=5, formatted="Table already exists and replace flag is set to false.", statusCode=9});
  end;
end;

if (saveToDisk == 1) then do;
  /* Save will automatically save as type represented by file ext */
  saveName=tgtCasTable;
  if(saveType != "") then do;
    saveName=tgtCasTable || "." || saveType;
  end;
  table.save result=r status=rc / caslib=tgtCasLib name=saveName replace=replace
    table={
      caslib=srcCasLib
      name=srcCasTable
    };
  if rc.statusCode != 0 then do;
    return rc.statusCode;
  end;
  tgtCasPath=dictionary(r, "name");

  dropTableIfExists(tgtCasLib, tgtCasTable);
  dropTableIfExists(tgtCasLib, tgtCasTable);

  table.loadtable result=r status=rc / caslib=tgtCasLib path=tgtCasPath casout={name=tgtCasTable caslib=tgtCasLib} promote=1;
  if rc.statusCode != 0 then do;
    return rc.statusCode;
  end;
end;

else do;
  dropTableIfExists(tgtCasLib, tgtCasTable);
  dropTableIfExists(tgtCasLib, tgtCasTable);
  table.promote result=r status=rc / caslib=srcCasLib name=srcCasTable target=tgtCasTable targetLib=tgtCasLib;
  if rc.statusCode != 0 then do;
    return rc.statusCode;
  end;
end;


dropTableIfExists("CASUSER(febianus.felix@student.umn.ac.id)", "a06cb4d7-72cc-4b8a-8cd3-19e22069af29");

function doesTableExist(casLib, casTable);
  table.tableExists result=r status=rc / caslib=casLib table=casTable;
  tableExists = dictionary(r, "exists");
  return tableExists;
end func;

function dropTableIfExists(casLib,casTable);
  tableExists = doesTableExist(casLib, casTable);
  if tableExists != 0 then do;
    print "Dropping table: "||casLib||"."||casTable;
    table.dropTable result=r status=rc/ caslib=casLib table=casTable quiet=0;
    if rc.statusCode != 0 then do;
      exit();
    end;
  end;
end func;

/* Return list of columns in a table */
function columnList(casLib, casTable);
  table.columnInfo result=collist / table={caslib=casLib,name=casTable};
  ndimen=dim(collist['columninfo']);
  featurelist={};
  do i =  1 to ndimen;
    featurelist[i]=upcase(collist['columninfo'][i][1]);
  end;
  return featurelist;
end func;
