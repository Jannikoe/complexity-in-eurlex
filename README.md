Bachelorarbeit Jannik Köhler:
Linguistische Komplexität deutscher und englischer Rechtssprache – eine crosslinguistische Analyse von EU-Verordnungstexten

1. Beschreibung

Mit der vorliegenden Datenanalyse meiner Bachelorarbeit möchte ich unter anderem einen Beitrag zur Debatte in der Linguistik darüber, dass alle Sprachen gleich komplex sind, leisten. 
Anhand einer linguistischen Komplexitätsanalyse sollen englische und deutsche Texte juristischer Sprache auf typische Komplexitätsmerkmale überprüft werden.
Hier ist der Python-Code für die Verarbeitung des Korpus MultiEURLEX (https://github.com/nlpaueb/multi-eurlex) zu finden, der die veröffentlichten Verordnungstexte der Europäischen Union (https://eur-lex.europa.eu/homepage.html) als Datensatz zur Verfügung stellt.
Außerdem ist hier der R-Code zur weiterführenden Analyse verzeichnet.

2. Installation

Zum Laden des Datensatzes ist das datasets-package (siehe Credits) und pandas (siehe Credits) notwendig. Hieraus nutze ich die load_dataset-Funktion, um aus dem Dictionary im geladenen Datensatz anschließend einen pandas-dataframe zu erstellen.

3. Nutzung

Den erstellten Datensatz speichere ich mit os durch die Iteration einer for-Schleife als eine Sammlung aus txt-Files für die anschließende Analyse mit der nlp-Pipeline CTAP (https://ctapweb.com). Dies kann für die den gewünschten Sprachen entsprechenden Abschnitte wiederholt werden.

Es folgt eine R-Analyse, die die eingelesenen CSV-Dateien zu handhabbaren Datensätzen mit Columns für die Ergebnisse einzelner in CTAP (siehe Credits) verfügbarer Features umwandelt. NaN-Werte werden entfernt und Nummern zu numerics transformiert. Für einen sinnvollen Vergleich der Ergebnisse für verschiedene Sprachen sollen die beiden Datensätze nun auf ihre gemeinsame Schnittmenge analysierbarer Features reduziert werden.

4. Credits

Bosak, D. J. (2024). libr: Libraries, Data Dictionaries, and a Data Step for R (Version 1.3.2) [R package]. CRAN. https://CRAN.R-project.org/package=libr

Chalkidis, I., Fergadiotis, E., Malakasiotis, P., & Androutsopoulos, I. (2019). Large-scale multi-label text classification on EU legislation. In Proceedings of the 2019 Conference on Empirical Methods in Natural Language Processing (EMNLP 2019), 6314-6322. https://doi.org/10.18653/v1/P19-1636

Chalkidis, I., Fergadiotis, M., & Androutsopoulos, I. (2021). MultiEURLEX – A multi-lingual and multi-label legal document classification dataset for zero-shot cross-lingual transfer. In Proceedings of the 2021 Conference on Empirical Methods in Natural Language Processing (EMNLP 2021). https://doi.org/10.48550/arXiv.2109.00904

Chen, X., & Meurers, D. (2016b). CTAP: A web-based tool supporting automatic complexity analysis. In Proceedings of the Workshop on Computational Linguistics for Linguistic Complexity (CL4LC) (S. 113–119). https://aclanthology.org/W16-4113

Lhoest, Q., del Moral, A. V., Jernite, Y., Thakur, A., Platen, P. V., Patil, S., Chaumond, J., Drame, M., Plu, J., Tunstall, L., Davison, J., vSavsko, M., Chhablani, G., Malik, B., Brandeis, S., Scao, T. L., Sanh, V., Xu, C., Patry, N., McMillan-Major, A., Schmid, P., Gugger, S., Delangue, C., Matussiere, T., Debut, L., Bekman, S., Cistac, P., Goehringer, T., Mustar, V., Lagunas, F., Rush, A. M., & Wolf, T. (2021). Datasets: A community library for natural language processing. arXiv preprint arXiv:2109.02846. https://arxiv.org/abs/2109.02846

Lhoest, Q., Villanova del Moral, A., von Platen, P., Wolf, T., Šaško, M., Jernite, Y., Thakur, A., Tunstall, L., Patil, S., Drame, M., Chaumond, J., Plu, J., Davison, J., Brandeis, S., Sanh, V., Le Scao, T., Xu, K. C., Patry, N., Liu, S., ... & Delangue, C. (2022). huggingface/datasets: 2.8.0 (Version 2.8.0) [Python software]. Zenodo. https://doi.org/10.5281/zenodo.7457269

McKinney, W. (2010). Data structures for statistical computing in Python. In Proceedings of the 9th Python in Science Conference (Vol. 445, S. 51-56). https://doi.org/10.25080/Majora-92bf1922-00a

Okinina, N., Frey, J.-C., & Weiss, Z. (2020). CTAP for Italian: Integrating components for the analysis of Italian into a multilingual linguistic complexity analysis tool. In Proceedings of the Twelfth Language Resources and Evaluation Conference (pp. 7123–7131). European Language Resources Association. https://aclanthology.org/2020.lrec-1.880

Pandas Development Team. (2024). pandas-dev/pandas: Pandas (Version 2.2.2) [Python software]. Zenodo. https://doi.org/10.5281/zenodo.10957263

R Core Team (2023). R: A Language and Environment for Statistical Computing. R Foundation for Statistical Computing. https://www.R-project.org

Wickham, H., Averick, M., Bryan, J., Chang, W., McGowan, L. D., François, R., Grolemund, G., Hayes, A., Henry, L., Hester, J., Kuhn, M., Pedersen, T. L., Miller, E., Bache, S. M., Müller, K., Ooms, J., Robinson, D., Seidel, D. P., Spinu, V., Takahashi, K., Vaughan, D., Wilke, C., Woo, K., & Yutani, H. (2019). Welcome to the tidyverse. Journal of Open Source Software, 4(43), 1686. https://doi.org/10.21105/joss.01686

Wickham, H. (2023). stringr: Simple, consistent wrappers for common string operations (Version 1.5.1) [R package]. CRAN. https://CRAN.R-project.org/package=stringr

Wickham, H., François, R., Henry, L., Müller, K., & Vaughan, D. (2023). dplyr: A grammar of data manipulation (Version 1.1.4) [R package]. CRAN. https://CRAN.R-project.org/package=dplyr

Wickham, H., Vaughan, D., & Girlich, M. (2024). tidyr: Tidy messy data (Version 1.3.1) [R package]. CRAN. https://CRAN.R-project.org/package=tidyr
