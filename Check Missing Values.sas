/* Memuat data */
data bank;
    infile '/shared/home/febianus.felix@student.umn.ac.id/casuser/bank.csv' delimiter=',' firstobs=2;
    input age job $ marital $ education $ default $ balance housing $ loan $ contact $ day month $ duration campaign pdays previous poutcome $ deposit $;
run;

/* Menghitung jumlah nilai yang hilang dan total pengamatan */
proc means data=bank n nmiss;
    output out=missing_summary(drop=_TYPE_ _FREQ_) nmiss= / autoname;
run;

/* Menghitung total pengamatan */
proc sql noprint;
    select count(*) into :Total_Observations from bank;
quit;

/* Menghitung persentase nilai yang hilang */
data missing_percentage;
    set missing_summary;
    array nums _numeric_;
    do over nums;
        nums = (nums / &Total_Observations) * 100;
    end;
run;

/* Menampilkan hasil persentase nilai yang hilang */
proc print data=missing_percentage;
run;
