

pandoc -S "./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/01_BusinessConcepts.docx" -M docPath="./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/01_BusinessConcepts.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_1_Introduction_to_business_and_accounting_concepts/01_BusinessConcepts.md" & node update_md.js "./Chapter_1_Introduction_to_business_and_accounting_concepts/01_BusinessConcepts.md"
pandoc -S "./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/02_Accounts.docx" -M docPath="./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/02_Accounts.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_1_Introduction_to_business_and_accounting_concepts/02_Accounts.md" & node update_md.js "./Chapter_1_Introduction_to_business_and_accounting_concepts/02_Accounts.md"
pandoc -S "./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/03_AccountingEquation.docx" -M docPath="./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/03_AccountingEquation.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_1_Introduction_to_business_and_accounting_concepts/03_AccountingEquation.md" & node update_md.js "./Chapter_1_Introduction_to_business_and_accounting_concepts/03_AccountingEquation.md"
pandoc -S "./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/04_CommonAccountingTransactions.docx" -M docPath="./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/04_CommonAccountingTransactions.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_1_Introduction_to_business_and_accounting_concepts/04_CommonAccountingTransactions.md" & node update_md.js "./Chapter_1_Introduction_to_business_and_accounting_concepts/04_CommonAccountingTransactions.md"
pandoc -S "./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/05_AccountingTransactionsGrid.docx" -M docPath="./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/05_AccountingTransactionsGrid.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_1_Introduction_to_business_and_accounting_concepts/05_AccountingTransactionsGrid.md" & node update_md.js "./Chapter_1_Introduction_to_business_and_accounting_concepts/05_AccountingTransactionsGrid.md"
pandoc -S "./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/06_Summary.docx" -M docPath="./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/06_Summary.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_1_Introduction_to_business_and_accounting_concepts/06_Summary.md" & node update_md.js "./Chapter_1_Introduction_to_business_and_accounting_concepts/06_Summary.md"


pandoc -S "./Chapter_2_Recording_accounting_transactions/documents/ComingSoon.docx" -M docPath="./Chapter_2_Recording_accounting_transactions/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_2_Recording_accounting_transactions/ComingSoon.md" & node update_md.js "./Chapter_2_Recording_accounting_transactions/ComingSoon.md"
pandoc -S "./Chapter_3_Financial_statements/documents/ComingSoon.docx" -M docPath="./Chapter_3_Financial_statements/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_3_Financial_statements/ComingSoon.md" & node update_md.js "./Chapter_3_Financial_statements/ComingSoon.md"

pandoc -S "./Chapter_4_ComprehensiveProblem/documents/01_Introduction.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/01_Introduction.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/01_Introduction.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/01_Introduction.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/02_Journalize_the_transactions_for_June.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/02_Journalize_the_transactions_for_June.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/02_Journalize_the_transactions_for_June.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/02_Journalize_the_transactions_for_June.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/02_Journalize_the_transactions_for_June_1.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/02_Journalize_the_transactions_for_June_1.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/02_Journalize_the_transactions_for_June_1.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/02_Journalize_the_transactions_for_June_1.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/03_Post_the_June_journal_entries_to_the_ledgers.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/03_Post_the_June_journal_entries_to_the_ledgers.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/03_Post_the_June_journal_entries_to_the_ledgers.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/03_Post_the_June_journal_entries_to_the_ledgers.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/03_Post_the_June_journal_entries_to_the_ledgers_Opt2.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/03_Post_the_June_journal_entries_to_the_ledgers_Opt2.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/03_Post_the_June_journal_entries_to_the_ledgers_Opt2.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/03_Post_the_June_journal_entries_to_the_ledgers_Opt2.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/04_Prepare_the _June_trial_balance.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/04_Prepare_the _June_trial_balance.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/04_Prepare_the _June_trial_balance.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/04_Prepare_the _June_trial_balance.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/05_Prepare_the _June_income_statement_retained_earnings_statement_and_balance_sheet.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/05_Prepare_the _June_income_statement_retained_earnings_statement_and_balance_sheet.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/05_Prepare_the _June_income_statement_retained_earnings_statement_and_balance_sheet.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/05_Prepare_the _June_income_statement_retained_earnings_statement_and_balance_sheet.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/06_Journalize_and_post_the_closing_entries_for_June.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/06_Journalize_and_post_the_closing_entries_for_June.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/06_Journalize_and_post_the_closing_entries_for_June.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/06_Journalize_and_post_the_closing_entries_for_June.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/06_Journalize_and_post_the_closing_entries_for_June _1.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/06_Journalize_and_post_the_closing_entries_for_June _1.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/06_Journalize_and_post_the_closing_entries_for_June _1.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/06_Journalize_and_post_the_closing_entries_for_June _1.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/07_Prepare_the_June_post_closing_trial_balance.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/07_Prepare_the_June_post_closing_trial_balance.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/07_Prepare_the_June_post_closing_trial_balance.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/07_Prepare_the_June_post_closing_trial_balance.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/08_Journalize_the_transactions_for_July_in_the_ journal.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/08_Journalize_the_transactions_for_July_in_the_ journal.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/08_Journalize_the_transactions_for_July_in_the_ journal.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/08_Journalize_the_transactions_for_July_in_the_ journal.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/09_Post_the_July_journal_entries_to_the_ledgers.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/09_Post_the_July_journal_entries_to_the_ledgers.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/09_Post_the_July_journal_entries_to_the_ledgers.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/09_Post_the_July_journal_entries_to_the_ledgers.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/10_Prepare_the_July_trial_balance.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/10_Prepare_the_July_trial_balance.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/10_Prepare_the_July_trial_balance.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/10_Prepare_the_July_trial_balance.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/11_Prepare_the_July_income_statement_retained_ earnings_statement_and_balance_sheet.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/11_Prepare_the_July_income_statement_retained_ earnings_statement_and_balance_sheet.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/11_Prepare_the_July_income_statement_retained_ earnings_statement_and_balance_sheet.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/11_Prepare_the_July_income_statement_retained_ earnings_statement_and_balance_sheet.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/12_Journalize_and_post_the_closing_entries_for_ July.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/12_Journalize_and_post_the_closing_entries_for_ July.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/12_Journalize_and_post_the_closing_entries_for_ July.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/12_Journalize_and_post_the_closing_entries_for_ July.md"
pandoc -S "./Chapter_4_ComprehensiveProblem/documents/13_Prepare_the_July_post_closing_trial_balance.docx" -M docPath="./Chapter_4_ComprehensiveProblem/documents/13_Prepare_the_July_post_closing_trial_balance.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_ComprehensiveProblem/13_Prepare_the_July_post_closing_trial_balance.md" & node update_md.js "./Chapter_4_ComprehensiveProblem/13_Prepare_the_July_post_closing_trial_balance.md"

pandoc -S "./Chapter_5_Completing_the_accounting_cycle/documents/ComingSoon.docx" -M docPath="./Chapter_5_Completing_the_accounting_cycle/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_5_Completing_the_accounting_cycle/ComingSoon.md" & node update_md.js "./Chapter_5_Completing_the_accounting_cycle/ComingSoon.md"
pandoc -S "./Chapter_6_Accounting_cycle_for_a_service_business_accrual_basis/documents/ComingSoon.docx" -M docPath="./Chapter_6_Accounting_cycle_for_a_service_business_accrual_basis/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_6_Accounting_cycle_for_a_service_business_accrual_basis/ComingSoon.md" & node update_md.js "./Chapter_6_Accounting_cycle_for_a_service_business_accrual_basis/ComingSoon.md"
pandoc -S "./Chapter_7_Accounting_cycle_for_a_merchandising_business/documents/ComingSoon.docx" -M docPath="./Chapter_7_Accounting_cycle_for_a_merchandising_business/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_7_Accounting_cycle_for_a_merchandising_business/ComingSoon.md" & node update_md.js "./Chapter_7_Accounting_cycle_for_a_merchandising_business/ComingSoon.md"
pandoc -S "./Chapter_8_Assets/documents/ComingSoon.docx" -M docPath="./Chapter_8_Assets/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_8_Assets/ComingSoon.md" & node update_md.js "./Chapter_8_Assets/ComingSoon.md"
pandoc -S "./Chapter_9_Liabilities/documents/ComingSoon.docx" -M docPath="./Chapter_9_Liabilities/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_9_Liabilities/ComingSoon.md" & node update_md.js "./Chapter_9_Liabilities/ComingSoon.md"
pandoc -S "./Chapter_10_Stockholders_Equity/documents/ComingSoon.docx" -M docPath="./Chapter_10_Stockholders_Equity/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_10_Stockholders_Equity/ComingSoon.md" & node update_md.js "./Chapter_10_Stockholders_Equity/ComingSoon.md"
pandoc -S "./Chapter_11_Statement_of_Cash_Flows/documents/ComingSoon.docx" -M docPath="./Chapter_11_Statement_of_Cash_Flows/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_11_Statement_of_Cash_Flows/ComingSoon.md" & node update_md.js "./Chapter_11_Statement_of_Cash_Flows/ComingSoon.md"
pandoc -S "./Chapter_12_Financial_Statement_Analysis/documents/ComingSoon.docx" -M docPath="./Chapter_12_Financial_Statement_Analysis/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_12_Financial_Statement_Analysis/ComingSoon.md" & node update_md.js "./Chapter_12_Financial_Statement_Analysis/ComingSoon.md"
pandoc -S "./Chapter_13_Valuation Analysis/documents/ComingSoon.docx" -M docPath="./Chapter_13_Valuation Analysis/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_13_Valuation Analysis/ComingSoon.md" & node update_md.js "./Chapter_13_Valuation Analysis/ComingSoon.md"
pandoc -S "./Chapter_14_Forecasting_Cash_Flows_Investment_Analysis/documents/01_Introduction.docx" -M docPath="./Chapter_14_Forecasting_Cash_Flows_Investment_Analysis/documents/01_Introduction.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_14_Forecasting_Cash_Flows_Investment_Analysis/01_Introduction.md" & node update_md.js "./Chapter_14_Forecasting_Cash_Flows_Investment_Analysis/01_Introduction.md"
pandoc -S "./Chapter_14_Forecasting_Cash_Flows_Investment_Analysis/documents/06_Calculating_Net_Present_Value_Sensitivity_Analysis.docx" -M docPath="./Chapter_14_Forecasting_Cash_Flows_Investment_Analysis/documents/06_Calculating_Net_Present_Value_Sensitivity_Analysis.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_14_Forecasting_Cash_Flows_Investment_Analysis/06_Calculating_Net_Present_Value_Sensitivity_Analysis.md" & node update_md.js "./Chapter_14_Forecasting_Cash_Flows_Investment_Analysis/06_Calculating_Net_Present_Value_Sensitivity_Analysis.md"