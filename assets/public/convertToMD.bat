

pandoc -S "./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/01_BusinessConcepts/docx" -M docPath="./Chapter_1_Introduction_to_business_and_accounting_concepts/documents/01_BusinessConcepts/docx" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "./Chapter_1_Introduction_to_business_and_accounting_concepts/01_BusinessConcepts/md" & node update_md.js "./Chapter_1_Introduction_to_business_and_accounting_concepts/01_BusinessConcepts/md"
