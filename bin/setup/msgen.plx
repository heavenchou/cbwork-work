$cbetaFolder = "CBETA Tripitaka";
$lang = "en";

%msg = (
"accept" => "I Accept",
"appFormat" => "App Format",
"back" => "Back",
"cancel" => "Cancel",
"cancelAll" => "Cancel All",
"charEncoding" => "Character Encoding",
"combdict" => "Combined Dictionary",
"compactFormat" => "Compact Version (no line-headers) ",
"contextMenu1" => "Citation(&I)",
"contextMenu2" => "&DFB Dictionary",
"contextMenu3" => "DEABT(&B)",
"continueSetup" => "Continue",
"destPath" => "Destination Path",
"dfb" => "DFB Dictionary",
"exit" => "Exit",
"exitSetup" => "Exit Setup",
"next" => "Next",
"help" => "Help",
"hhFormat" => "HTML Help Format",
"insertDisc2" => "Please insert Disc2",
"installAll" => "Install all texts",
"installByBu" => "Install by canonical division",
"installBySutra" => "Install by text",
"installByVol" => "Install by volume",
"installCBETA" => "Install CBETA Tripitaka",
"juan" => "Scroll",
"label4" => "\nPlease choose a install mode:",
"label5a" => "Do you want to install the text number keywords?",
"label7" => "Which volumes of the RTF version do you want to install?",
"label9" => "Which volumes of the HTMLHelp version do you want to install?",
"label10" => "Please select the installation path",
"label11" => "Please confirm the items to install",
"license" => "Copyright notice",
"normalFormat" => "Normal format (with line-headers)",
"plainTextFormat" => "Plain Text Format",
"QueZi" => "Please select a method for displaying non-system characters:",
"QueZiMode" => "Mode of displaying non-system characters",
"readCopyright" => "Please read the following copyright notice",
"reference" => "Reference",
"remove" => "Remove",
"rtfFormat" => "Word RTF Format",
"rtfIndex" => "Contents of Sutras",
"search" => "Search",
"select" => "Select",
"selectAll" => "Select all",
"selectFormat" => "Please select the versions you want to install",
"selectPlainTextFormat" => "Please select the format of the plain text version",
"selectPalinTextVol" => "Which volumes of the plain text version do you want to install?",
"selectTextEncoding" => "\nPlease select the encoding of the plain text version:",
"start" => "Start the installation process",
"textLicense" => "Please observe the following while using this database:\n\n1.Permission to use this database is limited to individuals and \norganizations for non profit use. Any commercial use requires the \nprior written permission of both this Association and the Daizo \nShuppansha Inc. of Japan.\n\n2.Permission to distribute or otherwise use any material from this \ndatabase on computer networks, CD-ROM or any other media is granted \non condition that its content is not altered and the copyright \nnotice as well as version information is kept intact and visible to \nthe user. \n\n3.If you encounter any error in this material, please report it to \nthis Association. This Association will not be responsible for any \nharm or damage that might result in the usage of this database. \n\n4.All rights for this database are reserved.",
"textWelcome" => "Welcome to the CBETA Electronic Tripitaka setup program.  This program will install the files of the Electronic Tripitaka on your computer.\n\nIf you already have an older version of the CBETA Electronic Tripitaka on your computer, please remove that version first. If you want to keep that older version, you can also install to a different directory.",
"textConfirmExit" => "This will exit the setup program. \nDo you want to continue?",
"title3" => "Select the version",
"title4" => "Options for the plain text versions",
"title6" => "Options for the RTF version",
"title8" => "Options for the HTML Help",
"title10" => "Please select the path for the texts",
"title11" => "Please confirm the items to setup",
"titleExit" => "Exit setup program",
"uninstall" => "Uninstall",
"useMarkup" => "Use markup  (like <p>,<lb>,<gaiji> etc)",
"useMojikyoTTF" => "Use the Mojikyo True Type Font",
"useMojikyo" => "Use the character numbers from the Mojikyo project",
"useNorChar" => "Use normalized characters whenever possible",
"useUnicode" => "Use Unicode whenever possible",
"useZuZiShi" => "Use glyph expressions",
"volsSelected" => "Installation of the following volumes",
"welcome" => "Welcome"
);

@msgVols = (
"Vol.1 AHan I",
"Vol.2 AHan II",
"Vol.3 BenYuan I",
"Vol.4 BenYuan II",
"Vol.5 BoRuo I",
"Vol.6 BoRuo II",
"Vol.7 BoRuo III",
"Vol.8 BoRuo IV",
"Vol.9 FaHua, HuaYan I",
"Vol.10 HuaYan II",
"Vol.11 BaoJi I",
"Vol.12 BaoJi II, NiePan",
"Vol.13 DaJi",
"Vol.14 JingJi I",
"Vol.15 JingJi II",
"Vol.16 JingJi III",
"Vol.17 JingJi IV",
"Vol.18 MiJiao I",
"Vol.19 MiJiao II",
"Vol.20 MiJiao III",
"Vol.21 MiJiao IV",
"Vol.22 Vinaya I",
"Vol.23 Vinaya II",
"Vol.24 Vinaya III",
"Vol.25 JingLun I",
"Vol.26 JingLun II, PiTan I",
"Vol.27 PiTan II",
"Vol.28 PiTan III",
"Vol.29 PiTan IV",
"Vol.30 ZhonGuan, Yogacara I",
"Vol.31 Yogacara II",
"Vol.32 LunJi",
"Vol.33 JingShu I",
"Vol.34 JingShu II",
"Vol.35 JingShu III",
"Vol.36 JingShu IV",
"Vol.37 JingShu V",
"Vol.38 JingShu VI",
"Vol.39 JingShu VII",
"Vol.40 LvShu, LunShu I",
"Vol.41 LunShu II",
"Vol.42 LunShu III",
"Vol.43 LunShu IV",
"Vol.44 LunShu V, ZhuZong I",
"Vol.45 ZhuZong II",
"Vol.46 ZhuZong III",
"Vol.47 ZhuZong IV",
"Vol.48 ZhuZong V",
"Vol.49 History I",
"Vol.50 History II",
"Vol.51 History III",
"Vol.52 History IV",
"Vol.53 Misc I",
"Vol.54 Misc II, Exterior",
"Vol.55 Catalog",
"Vol.85 DunHuang"
);

@msgParts = (
"01 AHan",
"02 BenYuan",
"03 BoRuo",
"04 FaHua",
"05 HuaYan",
"06 BaoJi",
"07 NiePan",
"08 DaJi",
"09 JingJi",
"10 MiJiao",
"11 Vinaya",
"12 PiTan",
"13 ZhonGuan",
"14 Yogacara",
"15 LunJi",
"16 PureLand",
"17 Chan",
"18 History",
"19 Misc",
"20 Apoc"
);