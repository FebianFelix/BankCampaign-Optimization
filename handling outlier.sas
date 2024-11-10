/* Memuat data */
data bank;
    infile '/shared/home/febianus.felix@student.umn.ac.id/casuser/bank.csv' delimiter=',' firstobs=2;
    input age job $ marital $ education $ default $ balance housing $ loan $ contact $ day month $ duration campaign pdays previous poutcome $ deposit $;
run;

/* Identifikasi Outlier */

/* Membuat makro untuk membuat boxplot */
%macro create_boxplots(data=, columns=);
    ods graphics on;
    %let n = %sysfunc(countw(&columns));
    %do i = 1 %to &n;
        %let col = %scan(&columns, &i);
        proc sgplot data=&data;
            vbox &col;
            title "Boxplot &col";
            yaxis label="Nilai"; 
        run;
    %end;
    ods graphics off;
%mend create_boxplots;

/* Membuat boxplot setelah penanganan outlier */
%create_boxplots(data=bank, columns=&outlier_columns);

/* Menentukan kolom numerik yang akan dihapus outlier-nya */
%let outlier_columns = age balance duration;

/* Menghitung IQR untuk setiap kolom numerik */
proc means data=bank q1 q3 noprint;
    var &outlier_columns;
    output out=iqr_summary q1=age_Q1 balance_Q1 duration_Q1
                 q3=age_Q3 balance_Q3 duration_Q3;
run;

/* Memastikan data iqr_summary dihasilkan */
proc print data=iqr_summary;
run;

/* Membuat makro untuk mengganti outlier dengan nilai batas (lower/upper bound) */
%macro replace_outliers_with_iqr(data=, columns=, iqr_data=);
    data &data;
        set &data;
        if _N_ = 1 then set &iqr_data;
        array cols[*] &columns;
        array q1s[*] age_Q1 balance_Q1 duration_Q1;
        array q3s[*] age_Q3 balance_Q3 duration_Q3;
        do i = 1 to dim(cols);
            lower_bound = q1s[i] - 1.5*(q3s[i] - q1s[i]);
            upper_bound = q3s[i] + 1.5*(q3s[i] - q1s[i]);
            if cols[i] < lower_bound then cols[i] = lower_bound;
            else if cols[i] > upper_bound then cols[i] = upper_bound;
        end;
        drop i lower_bound upper_bound;
    run;
%mend replace_outliers_with_iqr;

/* Memanggil makro untuk mengganti outlier dengan nilai batas (lower/upper bound) */
%replace_outliers_with_iqr(data=bank, columns=&outlier_columns, iqr_data=iqr_summary);

/* Menampilkan data setelah penggantian outlier */
proc print data=bank(obs=10);
run;

/* Membuat boxplot setelah penanganan outlier */
%create_boxplots(data=bank, columns=&outlier_columns);

