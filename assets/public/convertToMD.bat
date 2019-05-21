

pandoc -S "./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/01_BusinessConcepts.docx" -M docPath="./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/01_BusinessConcepts.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_1_Introduction_to_business_and_accounting_concepts/01_BusinessConcepts.md" & node update_md.js "./Chapter_1_Introduction_to_business_and_accounting_concepts/01_BusinessConcepts.md"
pandoc -S "./Chapter_2_Recording_accounting_transactions/documents/ComingSoon.docx" -M docPath="./Chapter_2_Recording_accounting_transactions/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_2_Recording_accounting_transactions/ComingSoon.md" & node update_md.js "./Chapter_2_Recording_accounting_transactions/ComingSoon.md"
pandoc -S "./Chapter_3_Financial_statements/documents/ComingSoon.docx" -M docPath="./Chapter_3_Financial_statements/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_3_Financial_statements/ComingSoon.md" & node update_md.js "./Chapter_3_Financial_statements/ComingSoon.md"
pandoc -S "./Chapter_4_Completing_the_accounting_cycle/documents/ComingSoon.docx" -M docPath="./Chapter_4_Completing_the_accounting_cycle/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_4_Completing_the_accounting_cycle/ComingSoon.md" & node update_md.js "./Chapter_4_Completing_the_accounting_cycle/ComingSoon.md"
pandoc -S "./Chapter_5_Accounting_cycle_for_a_service_business_accrual_basis/documents/ComingSoon.docx" -M docPath="./Chapter_5_Accounting_cycle_for_a_service_business_accrual_basis/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_5_Accounting_cycle_for_a_service_business_accrual_basis/ComingSoon.md" & node update_md.js "./Chapter_5_Accounting_cycle_for_a_service_business_accrual_basis/ComingSoon.md"
pandoc -S "./Chapter_6_Accounting_cycle_for_a_merchandising_business/documents/ComingSoon.docx" -M docPath="./Chapter_6_Accounting_cycle_for_a_merchandising_business/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_6_Accounting_cycle_for_a_merchandising_business/ComingSoon.md" & node update_md.js "./Chapter_6_Accounting_cycle_for_a_merchandising_business/ComingSoon.md"
pandoc -S "./Chapter_7_Assets/documents/ComingSoon.docx" -M docPath="./Chapter_7_Assets/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_7_Assets/ComingSoon.md" & node update_md.js "./Chapter_7_Assets/ComingSoon.md"
pandoc -S "./Chapter_8_Liabilities/documents/ComingSoon.docx" -M docPath="./Chapter_8_Liabilities/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_8_Liabilities/ComingSoon.md" & node update_md.js "./Chapter_8_Liabilities/ComingSoon.md"
pandoc -S "./Chapter_9_Stockholders_Equity/documents/ComingSoon.docx" -M docPath="./Chapter_9_Stockholders_Equity/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_9_Stockholders_Equity/ComingSoon.md" & node update_md.js "./Chapter_9_Stockholders_Equity/ComingSoon.md"
pandoc -S "./Chapter_10_Statement_of_Cash_Flows/documents/ComingSoon.docx" -M docPath="./Chapter_10_Statement_of_Cash_Flows/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_10_Statement_of_Cash_Flows/ComingSoon.md" & node update_md.js "./Chapter_10_Statement_of_Cash_Flows/ComingSoon.md"
pandoc -S "./Chapter_11_Financial_Statement_Analysis/documents/ComingSoon.docx" -M docPath="./Chapter_11_Financial_Statement_Analysis/documents/ComingSoon.docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_11_Financial_Statement_Analysis/ComingSoon.md" & node update_md.js "./Chapter_11_Financial_Statement_Analysis/ComingSoon.md"