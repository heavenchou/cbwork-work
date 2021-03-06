######################################################
# 判斷視窗版或自動執行
######################################################

use Cwd;
my $orig_path = getcwd;	# 本程式的目錄
my $para = "";			# 執行的參數

if($ARGV[0])	# 有傳入參數
{
	print "you input $ARGV[0]\n";
}
else
{
	$mw = gui_class->new();
	$mw->show();
	#print "★ 主程式結束\n";
}

######################################################
# 主程式
######################################################

sub main
{
	local * argv = shift;	# 傳入所有的參數, 這是一個 hash

	my $Tfrom = $argv{sText1};
	my $Tto = $argv{sText2};
	my $Xfrom = $argv{sText3};
	my $Xto = $argv{sText4};
	my $Jfrom = $argv{sText5};
	my $Jto = $argv{sText6};
	my $Hfrom = $argv{sText7};
	my $Hto = $argv{sText8};
	my $Wfrom = $argv{sText9};
	my $Wto = $argv{sText10};
	my $Ifrom = $argv{sText11};
	my $Ito = $argv{sText12};
	
	my $Afrom = $argv{sText13};
	my $Ato = $argv{sText14};
	my $Bfrom = $argv{sText15};
	my $Bto = $argv{sText16};
	my $Cfrom = $argv{sText17};
	my $Cto = $argv{sText18};
	my $Dfrom = $argv{sText19};
	my $Dto = $argv{sText20};
	my $Ffrom = $argv{sText21};
	my $Fto = $argv{sText22};
	my $Gfrom = $argv{sText23};
	my $Gto = $argv{sText24};
	my $Kfrom = $argv{sText25};
	my $Kto = $argv{sText26};
	my $Lfrom = $argv{sText27};
	my $Lto = $argv{sText28};
	my $Mfrom = $argv{sText29};
	my $Mto = $argv{sText30};
	my $Pfrom = $argv{sText31};
	my $Pto = $argv{sText32};
	my $Sfrom = $argv{sText33};
	my $Sto = $argv{sText34};
	my $Ufrom = $argv{sText35};
	my $Uto = $argv{sText36};
	
	$Tfrom =~ s/\s//g;
	$Tto =~ s/\s//g;
	$Xfrom =~ s/\s//g;
	$Xto =~ s/\s//g;
	$Jfrom =~ s/\s//g;
	$Jto =~ s/\s//g;
	$Hfrom =~ s/\s//g;
	$Hto =~ s/\s//g;
	$Wfrom =~ s/\s//g;
	$Wto =~ s/\s//g;
	$Ifrom =~ s/\s//g;
	$Ito =~ s/\s//g;
	
	$Afrom =~ s/\s//g;
	$Ato =~ s/\s//g;
	$Bfrom =~ s/\s//g;
	$Bto =~ s/\s//g;
	$Cfrom =~ s/\s//g;
	$Cto =~ s/\s//g;
	$Dfrom =~ s/\s//g;
	$Dto =~ s/\s//g;
	$Ffrom =~ s/\s//g;
	$Fto =~ s/\s//g;
	$Gfrom =~ s/\s//g;
	$Gto =~ s/\s//g;
	$Kfrom =~ s/\s//g;
	$Kto =~ s/\s//g;
	$Lfrom =~ s/\s//g;
	$Lto =~ s/\s//g;
	$Mfrom =~ s/\s//g;
	$Mto =~ s/\s//g;
	$Pfrom =~ s/\s//g;
	$Pto =~ s/\s//g;
	$Sfrom =~ s/\s//g;
	$Sto =~ s/\s//g;
	$Ufrom =~ s/\s//g;
	$Uto =~ s/\s//g;
	
	# 第一部份, 處理大正藏
	
	# 處理特別數字
	parser_num($Tfrom, $Tto, "T");
	parser_num($Xfrom, $Xto, "X");
	parser_num($Jfrom, $Jto, "J");
	parser_num($Hfrom, $Hto, "H");
	parser_num($Wfrom, $Wto, "W");
	parser_num($Ifrom, $Ito, "I");
	
	parser_num($Afrom, $Ato, "A");
	parser_num($Bfrom, $Bto, "B");
	parser_num($Cfrom, $Cto, "C");
	parser_num($Dfrom, $Dto, "D");
	parser_num($Ffrom, $Fto, "F");
	parser_num($Gfrom, $Gto, "G");
	parser_num($Kfrom, $Kto, "K");
	parser_num($Lfrom, $Lto, "L");
	parser_num($Mfrom, $Mto, "M");
	parser_num($Pfrom, $Pto, "P");
	parser_num($Sfrom, $Sto, "S");
	parser_num($Ufrom, $Uto, "U");
	
	print "\n" . "="x70 . "\nOK!\n\n";
}

sub parser_num
{
	# 各組的資料傳進來處理
	
	my $from = shift;
	my $to = shift;
	my $book = shift;
	
	if($from =~ /[,\(\.]/)
	{
		my @nums = split(/,/,$from);
		for $i (@nums)
		{
			if($i =~ /^\((\d+)\.\.(\d+)\)$/)
			{
				my @nums2 = ($1..$2);
				for $j (@nums2)
				{
					run_dir($book,$j);
				}
			}
			elsif($i =~ /^\d+$/)
			{
				run_dir($book,$i);
			}
		}
	}
	elsif($from =~ /^\d+$/ && $to =~ /^\d+$/)		# 有二組數字
	{
		my @nums = ($from..$to);
		for $j (@nums)
		{
			run_dir($book,$j);
		}
	}
	elsif($from =~ /^\d+$/ && $to eq "")		# 只有第一組
	{
		run_dir($book,$from);
	}
}

sub run_dir
{
	my $TX = shift;
	my $vol = shift;
	
	my $TXvol;
	if($TX =~ /[ACGLMPU]/)       # 3 位數的冊數
	{
		$TXvol = $TX . sprintf("%03d",$vol);		# 標準化
	}
	else
	{
		$TXvol = $TX . sprintf("%02d",$vol);		# 標準化
	}
	
	if(-d "c:\\cbwork\\simple\\$TXvol")	# 跳過不存在的冊數
	{
		print "-"x70 . "\n$TXvol\n" . "-"x70 . "\n";
		
		system("perl fgformat.pl $TXvol $para");
	}
}

# 結束程式 ###################################################################

##############################################################################
# 視窗介面物件
package gui_class;
##############################################################################

use Tk;
use Tk::ROText;
use Tk::NoteBook;
use Tk::LabFrame;
use Tk::BrowseEntry;

######################################################
# 屬性
######################################################
my %argv;

######################################################
# 基本方法
######################################################

sub new 						# 物件建構
{
	my $class = shift;
	my $this = {};
	bless $this, $class;
	$this->_initialize();		# 物件初值化
	return $this;
}

sub DESTROY						# 解構式
{
	my $self = shift;
	save2ini();		# 把結果存入 ini 檔案中
	printf("★ 主視窗結束 ★\n");
}

sub _initialize					# 物件初值化
{
	my $this = shift;
}

sub run_main					# 執行主程式
{
	# 先判斷是不是真要執行
	
	my $run = $mw->messageBox(-title => '確認', 
     -message => '確定要執行嗎？', 
     -type => 'YesNo', -icon => 'question', -default => 'no');
	
	return if($run eq "no");
	
	return if(!check_data(\$entry1, 1));			# 檢查變數是否合理
	return if(!check_data(\$entry2, 2));			# 檢查變數是否合理
	return if(!check_data(\$entry3, 3));			# 檢查變數是否合理
	return if(!check_data(\$entry4, 4));			# 檢查變數是否合理
	return if(!check_data(\$entry5, 5));			# 檢查變數是否合理
	return if(!check_data(\$entry6, 6));			# 檢查變數是否合理
	return if(!check_data(\$entry7, 7));			# 檢查變數是否合理
	return if(!check_data(\$entry8, 8));			# 檢查變數是否合理
	return if(!check_data(\$entry9, 9));			# 檢查變數是否合理
	return if(!check_data(\$entry10, 10));			# 檢查變數是否合理
	return if(!check_data(\$entry11, 11));			# 檢查變數是否合理
	return if(!check_data(\$entry12, 12));			# 檢查變數是否合理
	return if(!check_data(\$entry13, 13));			# 檢查變數是否合理
	return if(!check_data(\$entry14, 14));			# 檢查變數是否合理
	return if(!check_data(\$entry15, 15));			# 檢查變數是否合理
	return if(!check_data(\$entry16, 16));			# 檢查變數是否合理
	return if(!check_data(\$entry17, 17));			# 檢查變數是否合理
	return if(!check_data(\$entry18, 18));			# 檢查變數是否合理
	return if(!check_data(\$entry19, 19));			# 檢查變數是否合理
	return if(!check_data(\$entry20, 20));			# 檢查變數是否合理
	return if(!check_data(\$entry21, 21));			# 檢查變數是否合理
	return if(!check_data(\$entry22, 22));			# 檢查變數是否合理
	return if(!check_data(\$entry23, 23));			# 檢查變數是否合理
	return if(!check_data(\$entry24, 24));			# 檢查變數是否合理
	return if(!check_data(\$entry25, 25));			# 檢查變數是否合理
	return if(!check_data(\$entry26, 26));			# 檢查變數是否合理
	return if(!check_data(\$entry27, 27));			# 檢查變數是否合理
	return if(!check_data(\$entry28, 28));			# 檢查變數是否合理
	return if(!check_data(\$entry29, 29));			# 檢查變數是否合理
	return if(!check_data(\$entry30, 30));			# 檢查變數是否合理
	return if(!check_data(\$entry31, 31));			# 檢查變數是否合理
	return if(!check_data(\$entry32, 32));			# 檢查變數是否合理
	return if(!check_data(\$entry33, 33));			# 檢查變數是否合理
	return if(!check_data(\$entry34, 34));			# 檢查變數是否合理
	return if(!check_data(\$entry35, 35));			# 檢查變數是否合理
	return if(!check_data(\$entry36, 36));			# 檢查變數是否合理
	
	push_alldata_2_entry();	# 把 Entry 輸入欄位存入下拉選單中
	
	# 準備成員函數
	
	$argv{"sText1"} = $sText[1];
	$argv{"sText2"} = $sText[2];
	$argv{"sText3"} = $sText[3];
	$argv{"sText4"} = $sText[4];
	$argv{"sText5"} = $sText[5];
	$argv{"sText6"} = $sText[6];
	$argv{"sText7"} = $sText[7];
	$argv{"sText8"} = $sText[8];
	$argv{"sText9"} = $sText[9];
	$argv{"sText10"} = $sText[10];
	$argv{"sText11"} = $sText[11];
	$argv{"sText12"} = $sText[12];
	$argv{"sText13"} = $sText[13];
	$argv{"sText14"} = $sText[14];
	$argv{"sText15"} = $sText[15];
	$argv{"sText16"} = $sText[16];
	$argv{"sText17"} = $sText[17];
	$argv{"sText18"} = $sText[18];
	$argv{"sText19"} = $sText[19];
	$argv{"sText20"} = $sText[20];
	$argv{"sText21"} = $sText[21];
	$argv{"sText22"} = $sText[22];
	$argv{"sText23"} = $sText[23];
	$argv{"sText24"} = $sText[24];
	$argv{"sText25"} = $sText[25];
	$argv{"sText26"} = $sText[26];
	$argv{"sText27"} = $sText[27];
	$argv{"sText28"} = $sText[28];
	$argv{"sText29"} = $sText[29];
	$argv{"sText30"} = $sText[30];
	$argv{"sText31"} = $sText[31];
	$argv{"sText32"} = $sText[32];
	$argv{"sText33"} = $sText[33];
	$argv{"sText34"} = $sText[34];
	$argv{"sText35"} = $sText[35];
	$argv{"sText36"} = $sText[36];
	
	$para = "$no_head $no_normal $jk_num $IsNormal";
	
	chdir ("c:\\cbwork\\simple\\bin");
	$main::{'main'}(\%argv);
	chdir ($orig_path);
}

######################################################
# 其他方法
######################################################

# 全部選取
sub btAll_click
{
	$sText[1] = 1;
	$sText[2] = 85;
	$sText[3] = 1;
	$sText[4] = 88;
	$sText[5] = 1;
	$sText[6] = 40;
	$sText[7] = 1;
	$sText[8] = 1;
	$sText[9] = 1;
	$sText[10] = 9;
	$sText[11] = 1;		#I
	$sText[12] = 1;
	
	$sText[13] = 91;	#A
	$sText[14] = 121;
	$sText[15] = 1;		#B
	$sText[16] = 36;
	$sText[17] = 56;	#C
	$sText[18] = 106;
	$sText[19] = 1;		#D
	$sText[20] = 64;
	$sText[21] = 1;		#F
	$sText[22] = 29;
	$sText[23] = 52;
	$sText[24] = 84;
	$sText[25] = 5;
	$sText[26] = 41;
	$sText[27] = 115;
	$sText[28] = 164;
	$sText[29] = 59;
	$sText[30] = 59;
	$sText[31] = 154;
	$sText[32] = 189;
	$sText[33] = 6;
	$sText[34] = 6;
	$sText[35] = 205;
	$sText[36] = 223;
}
# 全部清除
sub btAll_clear_click
{
	$sText[1] = "";
	$sText[2] = "";
	$sText[3] = "";
	$sText[4] = "";
	$sText[5] = "";
	$sText[6] = "";
	$sText[7] = "";
	$sText[8] = "";
	$sText[9] = "";
	$sText[10] = "";
	$sText[11] = "";
	$sText[12] = "";
	$sText[13] = "";
	$sText[14] = "";
	$sText[15] = "";
	$sText[16] = "";
	$sText[17] = "";
	$sText[18] = "";
	$sText[19] = "";
	$sText[20] = "";
	$sText[21] = "";
	$sText[22] = "";
	$sText[23] = "";
	$sText[24] = "";
	$sText[25] = "";
	$sText[26] = "";
	$sText[27] = "";
	$sText[28] = "";
	$sText[29] = "";
	$sText[30] = "";
	$sText[31] = "";
	$sText[32] = "";
	$sText[33] = "";
	$sText[34] = "";
	$sText[35] = "";
	$sText[36] = "";
}

# 清除大正
sub btT_clear_click
{
	$sText[1] = "";
	$sText[2] = "";
}

# 清除卍續
sub btX_clear_click
{
	$sText[3] = "";
	$sText[4] = "";
}
# 清除嘉興
sub btJ_clear_click
{
	$sText[5] = "";
	$sText[6] = "";
}
# 清除正史
sub btH_clear_click
{
	$sText[7] = "";
	$sText[8] = "";
}
# 清除藏外
sub btW_clear_click
{
	$sText[9] = "";
	$sText[10] = "";
}
# 清除百品
sub btI_clear_click
{
	$sText[11] = "";
	$sText[12] = "";
}
# 清除金藏
sub btA_clear_click
{
	$sText[13] = "";
	$sText[14] = "";
}
# 清除補編 
sub btB_clear_click
{
	$sText[15] = "";
	$sText[16] = "";
}
# 清除中華藏 
sub btC_clear_click
{
	$sText[17] = "";
	$sText[18] = "";
}
# 清除國圖 
sub btD_clear_click
{
	$sText[19] = "";
	$sText[20] = "";
}
# 清除房山石經
sub btF_clear_click
{
	$sText[21] = "";
	$sText[22] = "";
}
# 清除佛教大藏經
sub btG_clear_click
{
	$sText[23] = "";
	$sText[24] = "";
}
# 清除高麗藏
sub btK_clear_click
{
	$sText[25] = "";
	$sText[26] = "";
}
# 清除乾隆藏
sub btL_clear_click
{
	$sText[27] = "";
	$sText[28] = "";
}
# 清除卍正藏
sub btM_clear_click
{
	$sText[29] = "";
	$sText[30] = "";
}
# 清除永樂北藏
sub btP_clear_click
{
	$sText[31] = "";
	$sText[32] = "";
}
# 清除宋藏遺珍
sub btS_clear_click
{
	$sText[33] = "";
	$sText[34] = "";
}
# 清除洪武南藏
sub btU_clear_click
{
	$sText[35] = "";
	$sText[36] = "";
}

# 予許的格式為 1~3 位的純數字, 或這種格式  1,2,(6..9),10,12
# 若傳回 0 就表示有問題了
sub check_data
{
	local * widget = shift;
	my $i = shift;
	my $data = $sText[$i];
	
	return 1 if($data =~ /^\d{1,3}$/);		# 純一或二或三位數字, ok
	
	my @nums = split(/,/,$data);
	
	for $i (@nums)
	{
		if($i =~ /^\((\d{1,3})\.\.(\d{1,3})\)$/)
		{
			# (1..4) 這種格式
			my $tmp1 = $1;
			my $tmp2 = $2;
			
			if($tmp2 < $tmp1)
			{
				my $errmsg = "參數 $i 有問題";
				$mw->messageBox(-title => '錯誤', -message => $errmsg, -type => 'OK');
				$widget->focus();
				return 0;
			}
		}
		elsif($i =~ /^\d{1,3}$/)
		{
		}
		else
		{
			my $errmsg = "參數 $i 有問題";
			$mw->messageBox(-title => '錯誤', -message => $errmsg, -type => 'OK');
			$widget->focus();
			return 0;
		}
	}
	return 1;
}

sub show
{
	my $this = shift;

	Tk::CmdLine::SetArguments(-font, "細明體 12");			# 設定預設字體
	$mw = MainWindow->new;
	$mw->title("CBETA BM2TXT");
	load_ini();			# 把 ini 裡面的東西放入陣列中
	make_all_frame();	# 做出 4 個 frame	

	######################################################
	# 處理每一個 frame 裡面的元件
	######################################################

	show_top_frame();
	show_bottom_frame();
	show_left_frame();
	show_right_frame();

	MainLoop;		# 一定要有的視窗訊息迴圈
}

sub make_all_frame
{	
	$fmTop = $mw->Frame(-borderwidth => 4, -relief => 'groove')->pack(	# 'flat' | 'groove' | 'raised' | 'ridge' | 'sunken'
		-side => 'top',
		-fill => 'both',
		-padx => 5,
		-pady => 5,
		);
	
	$fmBottom = $mw->Frame(-borderwidth => 4, -relief => 'groove')->pack(
		-side => 'bottom',
		-fill => 'both',
		-padx => 5,
		-pady => 5,
		);
		
	$fmLeft = $mw->Frame(-borderwidth => 4, -relief => 'groove')->pack(
		-side => 'left',
		-fill => 'both',
		-expand => 1,
		-padx => 5,
		-pady => 5,
		);
		
	$fmRight = $mw->Frame(-borderwidth => 4, -relief => 'groove')->pack(
		-side => 'right',
		-fill => 'both',
		-padx => 5,
		-pady => 5,
		);
}

sub show_top_frame
{
	# 最上方的說明
	$fmTop->Label(
		-text => "◆ BM2TXT_all ◆ BM 簡單標記版產生普及版純文字",
		)->pack(
			-side => 'left',
			-padx => 10,			# 組件左右留空大小 10
			-pady => 10,			# 組件上下留空大小 10
			);
}

sub show_bottom_frame
{
	# 下方的執行, 取消, 結束
	
	$fmBottom->Button(
		-text => "結束", 
		-command => sub {$mw->destroy},
		)->pack(
			-side => 'right',
			-padx => 5,			# 組件左右留空大小 10
			-pady => 10,			# 組件上下留空大小 10
			);
			
	$fmBottom->Button(
		-text => "說明", 
		-command => \&show_readme,
		)->pack(
			-side => 'right',
			-padx => 10,			# 組件左右留空大小 10
			-pady => 10,			# 組件上下留空大小 10
			);
				
	$fmBottom->Button(
		-text => "執行", 
		-command => \&run_main,			# 執行主程式 , 並傳入所有參數
		)->pack(
			-side => 'right',
			-padx => 20,			# 組件左右留空大小 20
			-pady => 10,			# 組件上下留空大小 10
			);
}

sub show_left_frame
{
	# 再建一個 frame , 把底下用 grid 的變數集中在上方
	
	$fmLeftTop = $fmLeft->Frame()->pack(
		-side => 'top',
		-fill => 'both',
		-padx => 10,
		-pady => 10,
		);
	
	# 主要的變數 ###################################
	
	$bt1 = $fmLeftTop->Button(-text => '清除',-command => \&btT_clear_click);
	$bt2 = $fmLeftTop->Button(-text => '清除',-command => \&btX_clear_click);
	$bt3 = $fmLeftTop->Button(-text => '清除',-command => \&btJ_clear_click);
	$bt4 = $fmLeftTop->Button(-text => '清除',-command => \&btH_clear_click);
	$bt5 = $fmLeftTop->Button(-text => '清除',-command => \&btW_clear_click);
	$bt6 = $fmLeftTop->Button(-text => '清除',-command => \&btI_clear_click);
	$bt7 = $fmLeftTop->Button(-text => '清除',-command => \&btA_clear_click);
	$bt8 = $fmLeftTop->Button(-text => '清除',-command => \&btB_clear_click);
	$bt9 = $fmLeftTop->Button(-text => '清除',-command => \&btC_clear_click);
	$bt10 = $fmLeftTop->Button(-text => '清除',-command => \&btD_clear_click);
	$bt11 = $fmLeftTop->Button(-text => '清除',-command => \&btF_clear_click);
	$bt12 = $fmLeftTop->Button(-text => '清除',-command => \&btG_clear_click);
	$bt13 = $fmLeftTop->Button(-text => '清除',-command => \&btK_clear_click);
	$bt14 = $fmLeftTop->Button(-text => '清除',-command => \&btL_clear_click);
	$bt15 = $fmLeftTop->Button(-text => '清除',-command => \&btM_clear_click);
	$bt16 = $fmLeftTop->Button(-text => '清除',-command => \&btP_clear_click);
	$bt17 = $fmLeftTop->Button(-text => '清除',-command => \&btS_clear_click);
	$bt18 = $fmLeftTop->Button(-text => '清除',-command => \&btU_clear_click);
	
	# 第一組
	$label[1] = $fmLeftTop->Label(-text => "(T)大正藏　從：",);
	$entry1 = $fmLeftTop->BrowseEntry(-variable => \$sText[1], -choices => \@sText1);				# 輸入文字的變數	
	#Tk::grid($label[1], $entry1, -sticky => "w",-padx => 1,-pady => 5,);
	# 第二組
	$label[2] = $fmLeftTop->Label(-text => "到：",);
	$entry2 = $fmLeftTop->BrowseEntry(-variable => \$sText[2], -choices => \@sText2);				# 輸入文字的變數
	Tk::grid($label[1], $entry1, $label[2], $entry2, $bt1, -sticky => "ew",-padx => 1,-pady => 0,);

	# 第三組
	$label[3] = $fmLeftTop->Label(-text => "(X)卍續藏　從：",);
	$entry3 = $fmLeftTop->BrowseEntry(-variable => \$sText[3], -choices => \@sText3);				# 輸入文字的變數		
	# Tk::grid($label[3], $entry3, -sticky => "ew",-padx => 1,-pady => 10,);
	# 第四組
	$label[4] = $fmLeftTop->Label(-text => "到：",);
	$entry4 = $fmLeftTop->BrowseEntry(-variable => \$sText[4], -choices => \@sText4);				# 輸入文字的變數		
	Tk::grid($label[3], $entry3, $label[4], $entry4, $bt2, -sticky => "ew",-padx => 1,-pady => 0,);

	# 第五組
	$label[5] = $fmLeftTop->Label(-text => "(J)嘉興藏　從：",);
	$entry5 = $fmLeftTop->BrowseEntry(-variable => \$sText[5], -choices => \@sText5);				# 輸入文字的變數		
	#Tk::grid($label[5], $entry5, -sticky => "ew",-padx => 1,-pady => 10,);
	# 第六組
	$label[6] = $fmLeftTop->Label(-text => "到：",);
	$entry6 = $fmLeftTop->BrowseEntry(-variable => \$sText[6], -choices => \@sText6);				# 輸入文字的變數		
	Tk::grid($label[5], $entry5, $label[6], $entry6, $bt3, -sticky => "ew",-padx => 1,-pady => 0,);

	# 第七組
	$label[7] = $fmLeftTop->Label(-text => "(H)　正史　從：",);
	$entry7 = $fmLeftTop->BrowseEntry(-variable => \$sText[7], -choices => \@sText7);				# 輸入文字的變數		
	#Tk::grid($label[7], $entry7, -sticky => "ew",-padx => 1,-pady => 10,);
	# 第八組
	$label[8] = $fmLeftTop->Label(-text => "到：",);
	$entry8 = $fmLeftTop->BrowseEntry(-variable => \$sText[8], -choices => \@sText8);				# 輸入文字的變數		
	Tk::grid($label[7], $entry7, $label[8], $entry8, $bt4, -sticky => "ew",-padx => 1,-pady => 0,);

	# 第九組
	$label[9] = $fmLeftTop->Label(-text => "(W)　藏外　從：",);
	$entry9 = $fmLeftTop->BrowseEntry(-variable => \$sText[9], -choices => \@sText9);				# 輸入文字的變數		
	#Tk::grid($label[9], $entry9, -sticky => "ew",-padx => 1,-pady => 10,);
	# 第十組
	$label[10] = $fmLeftTop->Label(-text => "到：",);
	$entry10 = $fmLeftTop->BrowseEntry(-variable => \$sText[10], -choices => \@sText10);				# 輸入文字的變數		
	Tk::grid($label[9], $entry9, $label[10], $entry10, $bt5, -sticky => "ew",-padx => 1,-pady => 0,);

	$label[11] = $fmLeftTop->Label(-text => "(I)　百品　從：",);
	$entry11 = $fmLeftTop->BrowseEntry(-variable => \$sText[11], -choices => \@sText11);				# 輸入文字的變數		
	$label[12] = $fmLeftTop->Label(-text => "到：",);
	$entry12 = $fmLeftTop->BrowseEntry(-variable => \$sText[12], -choices => \@sText12);				# 輸入文字的變數		
	Tk::grid($label[11], $entry11, $label[12], $entry12, $bt6, -sticky => "ew",-padx => 1,-pady => 0,);

	$label[13] = $fmLeftTop->Label(-text => "(A)　金藏　從：",);
	$entry13 = $fmLeftTop->BrowseEntry(-variable => \$sText[13], -choices => \@sText13);				# 輸入文字的變數		
	$label[14] = $fmLeftTop->Label(-text => "到：",);
	$entry14 = $fmLeftTop->BrowseEntry(-variable => \$sText[14], -choices => \@sText14);				# 輸入文字的變數		
	Tk::grid($label[13], $entry13, $label[14], $entry14, $bt7, -sticky => "ew",-padx => 1,-pady => 0,);

	$label[15] = $fmLeftTop->Label(-text => "(B)　補編　從：",);
	$entry15 = $fmLeftTop->BrowseEntry(-variable => \$sText[15], -choices => \@sText15);				# 輸入文字的變數		
	$label[16] = $fmLeftTop->Label(-text => "到：",);
	$entry16 = $fmLeftTop->BrowseEntry(-variable => \$sText[16], -choices => \@sText16);				# 輸入文字的變數		
	Tk::grid($label[15], $entry15, $label[16], $entry16, $bt8, -sticky => "ew",-padx => 1,-pady => 0,);

	$label[17] = $fmLeftTop->Label(-text => "(C)中華藏　從：",);
	$entry17 = $fmLeftTop->BrowseEntry(-variable => \$sText[17], -choices => \@sText17);				# 輸入文字的變數		
	$label[18] = $fmLeftTop->Label(-text => "到：",);
	$entry18 = $fmLeftTop->BrowseEntry(-variable => \$sText[18], -choices => \@sText18);				# 輸入文字的變數		
	Tk::grid($label[17], $entry17, $label[18], $entry18, $bt9, -sticky => "ew",-padx => 1,-pady => 0,);

	$label[19] = $fmLeftTop->Label(-text => "(D)　國圖　從：",);
	$entry19 = $fmLeftTop->BrowseEntry(-variable => \$sText[19], -choices => \@sText19);				# 輸入文字的變數		
	$label[20] = $fmLeftTop->Label(-text => "到：",);
	$entry20 = $fmLeftTop->BrowseEntry(-variable => \$sText[20], -choices => \@sText20);				# 輸入文字的變數		
	Tk::grid($label[19], $entry19, $label[20], $entry20, $bt10, -sticky => "ew",-padx => 1,-pady => 0,);

	$label[21] = $fmLeftTop->Label(-text => "(F)房山石經從：",);
	$entry21 = $fmLeftTop->BrowseEntry(-variable => \$sText[21], -choices => \@sText21);				# 輸入文字的變數		
	$label[22] = $fmLeftTop->Label(-text => "到：",);
	$entry22 = $fmLeftTop->BrowseEntry(-variable => \$sText[22], -choices => \@sText22);				# 輸入文字的變數		
	Tk::grid($label[21], $entry21, $label[22], $entry22, $bt11, -sticky => "ew",-padx => 1,-pady => 0,);

	$label[23] = $fmLeftTop->Label(-text => "(G)佛教藏　從：",);
	$entry23 = $fmLeftTop->BrowseEntry(-variable => \$sText[23], -choices => \@sText23);				# 輸入文字的變數		
	$label[24] = $fmLeftTop->Label(-text => "到：",);
	$entry24 = $fmLeftTop->BrowseEntry(-variable => \$sText[24], -choices => \@sText24);				# 輸入文字的變數		
	Tk::grid($label[23], $entry23, $label[24], $entry24, $bt12, -sticky => "ew",-padx => 1,-pady => 0,);

	$label[25] = $fmLeftTop->Label(-text => "(K)高麗藏　從：",);
	$entry25 = $fmLeftTop->BrowseEntry(-variable => \$sText[25], -choices => \@sText25);				# 輸入文字的變數		
	$label[26] = $fmLeftTop->Label(-text => "到：",);
	$entry26 = $fmLeftTop->BrowseEntry(-variable => \$sText[26], -choices => \@sText26);				# 輸入文字的變數		
	Tk::grid($label[25], $entry25, $label[26], $entry26, $bt13, -sticky => "ew",-padx => 1,-pady => 0,);

	$label[27] = $fmLeftTop->Label(-text => "(L)乾隆藏　從：",);
	$entry27 = $fmLeftTop->BrowseEntry(-variable => \$sText[27], -choices => \@sText27);				# 輸入文字的變數		
	$label[28] = $fmLeftTop->Label(-text => "到：",);
	$entry28 = $fmLeftTop->BrowseEntry(-variable => \$sText[28], -choices => \@sText28);				# 輸入文字的變數		
	Tk::grid($label[27], $entry27, $label[28], $entry28, $bt14, -sticky => "ew",-padx => 1,-pady => 0,);

	$label[29] = $fmLeftTop->Label(-text => "(M)卍正藏　從：",);
	$entry29 = $fmLeftTop->BrowseEntry(-variable => \$sText[29], -choices => \@sText29);				# 輸入文字的變數		
	$label[30] = $fmLeftTop->Label(-text => "到：",);
	$entry30 = $fmLeftTop->BrowseEntry(-variable => \$sText[30], -choices => \@sText30);				# 輸入文字的變數		
	Tk::grid($label[29], $entry29, $label[30], $entry30, $bt15, -sticky => "ew",-padx => 1,-pady => 0,);

	$label[31] = $fmLeftTop->Label(-text => "(P)永樂北藏從：",);
	$entry31 = $fmLeftTop->BrowseEntry(-variable => \$sText[31], -choices => \@sText31);				# 輸入文字的變數		
	$label[32] = $fmLeftTop->Label(-text => "到：",);
	$entry32 = $fmLeftTop->BrowseEntry(-variable => \$sText[32], -choices => \@sText32);				# 輸入文字的變數		
	Tk::grid($label[31], $entry31, $label[32], $entry32, $bt16, -sticky => "ew",-padx => 1,-pady => 0,);

	$label[33] = $fmLeftTop->Label(-text => "(S)宋藏遺珍從：",);
	$entry33 = $fmLeftTop->BrowseEntry(-variable => \$sText[33], -choices => \@sText33);				# 輸入文字的變數		
	$label[34] = $fmLeftTop->Label(-text => "到：",);
	$entry34 = $fmLeftTop->BrowseEntry(-variable => \$sText[34], -choices => \@sText34);				# 輸入文字的變數		
	Tk::grid($label[33], $entry33, $label[34], $entry34, $bt17, -sticky => "ew",-padx => 1,-pady => 0,);

	$label[35] = $fmLeftTop->Label(-text => "(U)洪武南藏從：",);
	$entry35 = $fmLeftTop->BrowseEntry(-variable => \$sText[35], -choices => \@sText35);				# 輸入文字的變數		
	$label[36] = $fmLeftTop->Label(-text => "到：",);
	$entry36 = $fmLeftTop->BrowseEntry(-variable => \$sText[36], -choices => \@sText36);				# 輸入文字的變數		
	Tk::grid($label[35], $entry35, $label[36], $entry36, $bt18, -sticky => "ew",-padx => 1,-pady => 0,);

	$fmLeftTop->gridColumnconfigure(1, -weight => 1);
}

sub show_right_frame
{
	# 右方的控制按鈕
	
	$fmRight->Button(
		-text => '全部選取',
		-command => \&btAll_click,
		)->pack(
			-side => 'top',
			-padx => 10,			# 組件左右留空大小 10
			-pady => 10,			# 組件上下留空大小 10
			);

	$fmRight->Button(
		-text => '全部清除',
		-command => \&btAll_clear_click,
		)->pack(
			-side => 'top',
			-padx => 10,			# 組件左右留空大小 10
			-pady => 10,			# 組件上下留空大小 10
			);
	
	$lfNormal = $fmRight->LabFrame(-label => "檔案格式",
		-labelside => 'acrosstop')->pack(-side => 'top', -padx => 5, -pady => 5, -fill => 'both');
	
	$lfNormal->Radiobutton(
		-text => '普及版一卷一檔', 
		-variable => \$IsNormal, 
		-value => '',
		)->pack;

	$lfNormal->Radiobutton(
		-text => '普及版一經一檔', 
		-variable => \$IsNormal, 
		-value => 'Normal1',
		)->pack;
		
	$lfNormal->Radiobutton(
		-text => 'ＡＰＰ一卷一檔', 
		-variable => \$IsNormal, 
		-value => 'App',
		)->pack;
		
	$lfNormal->Radiobutton(
		-text => 'ＡＰＰ一經一檔', 
		-variable => \$IsNormal, 
		-value => 'App1',
		)->pack;

	$lfFormat = $fmRight->LabFrame(-label => "其他選項",
		-labelside => 'acrosstop')->pack(-side => 'top', -anchor => 'e', -padx => 15, -pady => 5);
		
	$lfFormat->Checkbutton(
		-text => '不使用通用字　　', 
		-variable => \$no_normal, 
		-onvalue => 'NO_Normal', 
		-offvalue => '',
		)->pack;
	$lfFormat->Checkbutton(
		-text => '不要卷首資訊　　', 
		-variable => \$no_head, 
		-onvalue => 'NO_Head', 
		-offvalue => '',
		)->pack;
	$lfFormat->Checkbutton(
		-text => '顯示校勘數字＊◎', 
		-variable => \$jk_num, 
		-onvalue => 'JK_Num', 
		-offvalue => '',
		)->pack;

}

# 把 Entry 輸入欄位存入下拉選單中

sub push_alldata_2_entry
{
	if (!$sText1{$sText[1]} && $sText[1] ne "") 
	{
		$entry1->insert(0, $sText[1]);
		unshift(@sText1 , $sText[1]);
	 	$sText1{$sText[1]}++;
	 	if($#sText1 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry1->delete($#sText1,$#sText1);
	 		$sText1{$sText1[$#sText1]} = 0;
	 		pop(@sText1);
	 	}
	}
	if (!$sText2{$sText[2]} && $sText[2] ne "") 
	{
		$entry2->insert(0, $sText[2]);
		unshift(@sText2 , $sText[2]);
	 	$sText2{$sText[2]}++;
	 	if($#sText2 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry2->delete($#sText2,$#sText2);
	 		$sText2{$sText2[$#sText2]} = 0;
	 		pop(@sText2);
	 	}
	}
	if (!$sText3{$sText[3]} && $sText[3] ne "") 
	{
		$entry3->insert(0, $sText[3]);
		unshift(@sText3 , $sText[3]);
	 	$sText3{$sText[3]}++;
	 	if($#sText3 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry3->delete($#sText3,$#sText3);
	 		$sText3{$sText3[$#sText3]} = 0;
	 		pop(@sText3);
	 	}
	}
	if (!$sText4{$sText[4]} && $sText[4] ne "") 
	{
		$entry4->insert(0, $sText[4]);
		unshift(@sText4 , $sText[4]);
	 	$sText4{$sText[4]}++;
	 	if($#sText4 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry4->delete($#sText4,$#sText4);
	 		$sText4{$sText4[$#sText4]} = 0;
	 		pop(@sText4);
	 	}
	}
	if (!$sText5{$sText[5]} && $sText[5] ne "") 
	{
		$entry5->insert(0, $sText[5]);
		unshift(@sText5 , $sText[5]);
	 	$sText5{$sText[5]}++;
	 	if($#sText5 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry5->delete($#sText5,$#sText5);
	 		$sText5{$sText5[$#sText5]} = 0;
	 		pop(@sText5);
	 	}
	}
	if (!$sText6{$sText[6]} && $sText[6] ne "") 
	{
		$entry6->insert(0, $sText[6]);
		unshift(@sText6 , $sText[6]);
	 	$sText6{$sText[6]}++;
	 	if($#sText6 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry6->delete($#sText6,$#sText6);
	 		$sText6{$sText6[$#sText6]} = 0;
	 		pop(@sText6);
	 	}
	}
	if (!$sText7{$sText[7]} && $sText[7] ne "") 
	{
		$entry7->insert(0, $sText[7]);
		unshift(@sText7 , $sText[7]);
	 	$sText7{$sText[7]}++;
	 	if($#sText7 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry7->delete($#sText7,$#sText7);
	 		$sText7{$sText7[$#sText7]} = 0;
	 		pop(@sText7);
	 	}
	}
	if (!$sText8{$sText[8]} && $sText[8] ne "") 
	{
		$entry8->insert(0, $sText[8]);
		unshift(@sText8 , $sText[8]);
	 	$sText8{$sText[8]}++;
	 	if($#sText8 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry8->delete($#sText8,$#sText8);
	 		$sText8{$sText8[$#sText8]} = 0;
	 		pop(@sText8);
	 	}
	}
	if (!$sText9{$sText[9]} && $sText[9] ne "") 
	{
		$entry9->insert(0, $sText[9]);
		unshift(@sText9 , $sText[9]);
	 	$sText9{$sText[9]}++;
	 	if($#sText9 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry9->delete($#sText9,$#sText9);
	 		$sText9{$sText9[$#sText9]} = 0;
	 		pop(@sText9);
	 	}
	}
	if (!$sText10{$sText[10]} && $sText[10] ne "") 
	{
		$entry10->insert(0, $sText[10]);
		unshift(@sText10 , $sText[10]);
	 	$sText10{$sText[10]}++;
	 	if($#sText10 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry10->delete($#sText10,$#sText10);
	 		$sText10{$sText10[$#sText10]} = 0;
	 		pop(@sText10);
	 	}
	}
	if (!$sText11{$sText[11]} && $sText[11] ne "") 
	{
		$entry11->insert(0, $sText[11]);
		unshift(@sText11 , $sText[11]);
	 	$sText11{$sText[11]}++;
	 	if($#sText11 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry11->delete($#sText11,$#sText11);
	 		$sText11{$sText11[$#sText11]} = 0;
	 		pop(@sText11);
	 	}
	}
	if (!$sText12{$sText[12]} && $sText[12] ne "") 
	{
		$entry12->insert(0, $sText[12]);
		unshift(@sText12 , $sText[12]);
	 	$sText12{$sText[12]}++;
	 	if($#sText12 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry12->delete($#sText12,$#sText12);
	 		$sText12{$sText12[$#sText12]} = 0;
	 		pop(@sText12);
	 	}
	}
	if (!$sText13{$sText[13]} && $sText[13] ne "") 
	{
		$entry13->insert(0, $sText[13]);
		unshift(@sText13 , $sText[13]);
	 	$sText13{$sText[13]}++;
	 	if($#sText13 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry13->delete($#sText13,$#sText13);
	 		$sText13{$sText13[$#sText13]} = 0;
	 		pop(@sText13);
	 	}
	}
	if (!$sText14{$sText[14]} && $sText[14] ne "") 
	{
		$entry14->insert(0, $sText[14]);
		unshift(@sText14 , $sText[14]);
	 	$sText14{$sText[14]}++;
	 	if($#sText14 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry14->delete($#sText14,$#sText14);
	 		$sText14{$sText14[$#sText14]} = 0;
	 		pop(@sText14);
	 	}
	}
	if (!$sText15{$sText[15]} && $sText[15] ne "") 
	{
		$entry15->insert(0, $sText[15]);
		unshift(@sText15 , $sText[15]);
	 	$sText15{$sText[15]}++;
	 	if($#sText15 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry15->delete($#sText15,$#sText15);
	 		$sText15{$sText15[$#sText15]} = 0;
	 		pop(@sText15);
	 	}
	}
	if (!$sText16{$sText[16]} && $sText[16] ne "") 
	{
		$entry16->insert(0, $sText[16]);
		unshift(@sText16 , $sText[16]);
	 	$sText16{$sText[16]}++;
	 	if($#sText16 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry16->delete($#sText16,$#sText16);
	 		$sText16{$sText16[$#sText16]} = 0;
	 		pop(@sText16);
	 	}
	}
	if (!$sText17{$sText[17]} && $sText[17] ne "") 
	{
		$entry17->insert(0, $sText[17]);
		unshift(@sText17 , $sText[17]);
	 	$sText17{$sText[17]}++;
	 	if($#sText17 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry17->delete($#sText17,$#sText17);
	 		$sText17{$sText17[$#sText17]} = 0;
	 		pop(@sText17);
	 	}
	}
	if (!$sText18{$sText[18]} && $sText[18] ne "") 
	{
		$entry18->insert(0, $sText[18]);
		unshift(@sText18 , $sText[18]);
	 	$sText18{$sText[18]}++;
	 	if($#sText18 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry18->delete($#sText18,$#sText18);
	 		$sText18{$sText18[$#sText18]} = 0;
	 		pop(@sText18);
	 	}
	}
	if (!$sText19{$sText[19]} && $sText[19] ne "") 
	{
		$entry19->insert(0, $sText[19]);
		unshift(@sText19 , $sText[19]);
	 	$sText19{$sText[19]}++;
	 	if($#sText19 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry19->delete($#sText19,$#sText19);
	 		$sText19{$sText19[$#sText19]} = 0;
	 		pop(@sText19);
	 	}
	}
	if (!$sText20{$sText[20]} && $sText[20] ne "") 
	{
		$entry20->insert(0, $sText[20]);
		unshift(@sText20 , $sText[20]);
	 	$sText20{$sText[20]}++;
	 	if($#sText20 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry20->delete($#sText20,$#sText20);
	 		$sText20{$sText20[$#sText20]} = 0;
	 		pop(@sText20);
	 	}
	}
	if (!$sText21{$sText[21]} && $sText[21] ne "") 
	{
		$entry21->insert(0, $sText[21]);
		unshift(@sText21 , $sText[21]);
	 	$sText21{$sText[21]}++;
	 	if($#sText21 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry21->delete($#sText21,$#sText21);
	 		$sText21{$sText21[$#sText21]} = 0;
	 		pop(@sText21);
	 	}
	}
	if (!$sText22{$sText[22]} && $sText[22] ne "") 
	{
		$entry22->insert(0, $sText[22]);
		unshift(@sText22 , $sText[22]);
	 	$sText22{$sText[22]}++;
	 	if($#sText22 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry22->delete($#sText22,$#sText22);
	 		$sText22{$sText22[$#sText22]} = 0;
	 		pop(@sText22);
	 	}
	}
	if (!$sText23{$sText[23]} && $sText[23] ne "") 
	{
		$entry23->insert(0, $sText[23]);
		unshift(@sText23 , $sText[23]);
	 	$sText23{$sText[23]}++;
	 	if($#sText23 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry23->delete($#sText23,$#sText23);
	 		$sText23{$sText23[$#sText23]} = 0;
	 		pop(@sText23);
	 	}
	}
	if (!$sText24{$sText[24]} && $sText[24] ne "") 
	{
		$entry24->insert(0, $sText[24]);
		unshift(@sText24 , $sText[24]);
	 	$sText24{$sText[24]}++;
	 	if($#sText24 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry24->delete($#sText24,$#sText24);
	 		$sText24{$sText24[$#sText24]} = 0;
	 		pop(@sText24);
	 	}
	}
	if (!$sText25{$sText[25]} && $sText[25] ne "") 
	{
		$entry25->insert(0, $sText[25]);
		unshift(@sText25 , $sText[25]);
	 	$sText25{$sText[25]}++;
	 	if($#sText25 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry25->delete($#sText25,$#sText25);
	 		$sText25{$sText25[$#sText25]} = 0;
	 		pop(@sText25);
	 	}
	}
	if (!$sText26{$sText[26]} && $sText[26] ne "") 
	{
		$entry26->insert(0, $sText[26]);
		unshift(@sText26 , $sText[26]);
	 	$sText26{$sText[26]}++;
	 	if($#sText26 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry26->delete($#sText26,$#sText26);
	 		$sText26{$sText26[$#sText26]} = 0;
	 		pop(@sText26);
	 	}
	}
	if (!$sText27{$sText[27]} && $sText[27] ne "") 
	{
		$entry27->insert(0, $sText[27]);
		unshift(@sText27 , $sText[27]);
	 	$sText27{$sText[27]}++;
	 	if($#sText27 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry27->delete($#sText27,$#sText27);
	 		$sText27{$sText27[$#sText27]} = 0;
	 		pop(@sText27);
	 	}
	}
	if (!$sText28{$sText[28]} && $sText[28] ne "") 
	{
		$entry28->insert(0, $sText[28]);
		unshift(@sText28 , $sText[28]);
	 	$sText28{$sText[28]}++;
	 	if($#sText28 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry28->delete($#sText28,$#sText28);
	 		$sText28{$sText28[$#sText28]} = 0;
	 		pop(@sText28);
	 	}
	}
	if (!$sText29{$sText[29]} && $sText[29] ne "") 
	{
		$entry29->insert(0, $sText[29]);
		unshift(@sText29 , $sText[29]);
	 	$sText29{$sText[29]}++;
	 	if($#sText29 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry29->delete($#sText29,$#sText29);
	 		$sText29{$sText29[$#sText29]} = 0;
	 		pop(@sText29);
	 	}
	}
	if (!$sText30{$sText[30]} && $sText[30] ne "") 
	{
		$entry30->insert(0, $sText[30]);
		unshift(@sText30 , $sText[30]);
	 	$sText30{$sText[30]}++;
	 	if($#sText30 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry30->delete($#sText30,$#sText30);
	 		$sText30{$sText30[$#sText30]} = 0;
	 		pop(@sText30);
	 	}
	}
	if (!$sText31{$sText[31]} && $sText[31] ne "") 
	{
		$entry31->insert(0, $sText[31]);
		unshift(@sText31 , $sText[31]);
	 	$sText31{$sText[31]}++;
	 	if($#sText31 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry31->delete($#sText31,$#sText31);
	 		$sText31{$sText31[$#sText31]} = 0;
	 		pop(@sText31);
	 	}
	}
	if (!$sText32{$sText[32]} && $sText[32] ne "") 
	{
		$entry32->insert(0, $sText[32]);
		unshift(@sText32 , $sText[32]);
	 	$sText32{$sText[32]}++;
	 	if($#sText32 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry32->delete($#sText32,$#sText32);
	 		$sText32{$sText32[$#sText32]} = 0;
	 		pop(@sText32);
	 	}
	}
	if (!$sText33{$sText[33]} && $sText[33] ne "") 
	{
		$entry33->insert(0, $sText[33]);
		unshift(@sText33 , $sText[33]);
	 	$sText33{$sText[33]}++;
	 	if($#sText33 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry33->delete($#sText33,$#sText33);
	 		$sText33{$sText33[$#sText33]} = 0;
	 		pop(@sText33);
	 	}
	}
	if (!$sText34{$sText[34]} && $sText[34] ne "") 
	{
		$entry34->insert(0, $sText[34]);
		unshift(@sText34 , $sText[34]);
	 	$sText34{$sText[34]}++;
	 	if($#sText34 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry34->delete($#sText34,$#sText34);
	 		$sText34{$sText34[$#sText34]} = 0;
	 		pop(@sText34);
	 	}
	}
	if (!$sText35{$sText[35]} && $sText[35] ne "") 
	{
		$entry35->insert(0, $sText[35]);
		unshift(@sText35 , $sText[35]);
	 	$sText35{$sText[35]}++;
	 	if($#sText35 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry35->delete($#sText35,$#sText35);
	 		$sText35{$sText35[$#sText35]} = 0;
	 		pop(@sText35);
	 	}
	}
	if (!$sText36{$sText[36]} && $sText[36] ne "") 
	{
		$entry36->insert(0, $sText[36]);
		unshift(@sText36 , $sText[36]);
	 	$sText36{$sText[36]}++;
	 	if($#sText36 == 30)		# 超過 30 個就移除最後一個
	 	{
	 		$entry36->delete($#sText36,$#sText36);
	 		$sText36{$sText36[$#sText36]} = 0;
	 		pop(@sText36);
	 	}
	}
}

# 把 Entry 的資料存入 ini 檔
sub save2ini
{
	open OUT, ">bm2txt_all.ini";
	print OUT "[bm2txt_all]\n";
	for $i (0..$#sText1)
	{
		print OUT "sText1_$i=" . $sText1[$i] . "\n";
	}
	for $i (0..$#sText2)
	{
		print OUT "sText2_$i=" . $sText2[$i] . "\n";
	}
	for $i (0..$#sText3)
	{
		print OUT "sText3_$i=" . $sText3[$i] . "\n";
	}
	for $i (0..$#sText4)
	{
		print OUT "sText4_$i=" . $sText4[$i] . "\n";
	}
	for $i (0..$#sText5)
	{
		print OUT "sText5_$i=" . $sText5[$i] . "\n";
	}
	for $i (0..$#sText6)
	{
		print OUT "sText6_$i=" . $sText6[$i] . "\n";
	}
	for $i (0..$#sText7)
	{
		print OUT "sText7_$i=" . $sText7[$i] . "\n";
	}
	for $i (0..$#sText8)
	{
		print OUT "sText8_$i=" . $sText8[$i] . "\n";
	}
	for $i (0..$#sText9)
	{
		print OUT "sText9_$i=" . $sText9[$i] . "\n";
	}
	for $i (0..$#sText10)
	{
		print OUT "sText10_$i=" . $sText10[$i] . "\n";
	}
	for $i (0..$#sText11){print OUT "sText11_$i=" . $sText11[$i] . "\n";}
	for $i (0..$#sText12){print OUT "sText12_$i=" . $sText12[$i] . "\n";}
	for $i (0..$#sText13){print OUT "sText13_$i=" . $sText13[$i] . "\n";}
	for $i (0..$#sText14){print OUT "sText14_$i=" . $sText14[$i] . "\n";}
	for $i (0..$#sText15){print OUT "sText15_$i=" . $sText15[$i] . "\n";}
	for $i (0..$#sText16){print OUT "sText16_$i=" . $sText16[$i] . "\n";}
	for $i (0..$#sText17){print OUT "sText17_$i=" . $sText17[$i] . "\n";}
	for $i (0..$#sText18){print OUT "sText18_$i=" . $sText18[$i] . "\n";}
	for $i (0..$#sText19){print OUT "sText19_$i=" . $sText19[$i] . "\n";}
	for $i (0..$#sText20){print OUT "sText20_$i=" . $sText20[$i] . "\n";}
	for $i (0..$#sText21){print OUT "sText21_$i=" . $sText21[$i] . "\n";}
	for $i (0..$#sText22){print OUT "sText22_$i=" . $sText22[$i] . "\n";}
	for $i (0..$#sText23){print OUT "sText23_$i=" . $sText23[$i] . "\n";}
	for $i (0..$#sText24){print OUT "sText24_$i=" . $sText24[$i] . "\n";}
	for $i (0..$#sText25){print OUT "sText25_$i=" . $sText25[$i] . "\n";}
	for $i (0..$#sText26){print OUT "sText26_$i=" . $sText26[$i] . "\n";}
	for $i (0..$#sText27){print OUT "sText27_$i=" . $sText27[$i] . "\n";}
	for $i (0..$#sText28){print OUT "sText28_$i=" . $sText28[$i] . "\n";}
	for $i (0..$#sText29){print OUT "sText29_$i=" . $sText29[$i] . "\n";}
	for $i (0..$#sText30){print OUT "sText30_$i=" . $sText30[$i] . "\n";}
	for $i (0..$#sText31){print OUT "sText31_$i=" . $sText31[$i] . "\n";}
	for $i (0..$#sText32){print OUT "sText32_$i=" . $sText32[$i] . "\n";}
	for $i (0..$#sText33){print OUT "sText33_$i=" . $sText33[$i] . "\n";}
	for $i (0..$#sText34){print OUT "sText34_$i=" . $sText34[$i] . "\n";}
	for $i (0..$#sText35){print OUT "sText35_$i=" . $sText35[$i] . "\n";}
	for $i (0..$#sText36){print OUT "sText36_$i=" . $sText36[$i] . "\n";}
	
	# 儲存變數
	print OUT "sText1=" . $sText[1] . "\n";
	print OUT "sText2=" . $sText[2] . "\n";
	print OUT "sText3=" . $sText[3] . "\n";
	print OUT "sText4=" . $sText[4] . "\n";
	print OUT "sText5=" . $sText[5] . "\n";
	print OUT "sText6=" . $sText[6] . "\n";
	print OUT "sText7=" . $sText[7] . "\n";
	print OUT "sText8=" . $sText[8] . "\n";
	print OUT "sText9=" . $sText[9] . "\n";
	print OUT "sText10=" . $sText[10] . "\n";
	print OUT "sText11=" . $sText[11] . "\n";
	print OUT "sText12=" . $sText[12] . "\n";
	print OUT "sText13=" . $sText[13] . "\n";
	print OUT "sText14=" . $sText[14] . "\n";
	print OUT "sText15=" . $sText[15] . "\n";
	print OUT "sText16=" . $sText[16] . "\n";
	print OUT "sText17=" . $sText[17] . "\n";
	print OUT "sText18=" . $sText[18] . "\n";
	print OUT "sText19=" . $sText[19] . "\n";
	print OUT "sText20=" . $sText[20] . "\n";
	print OUT "sText21=" . $sText[21] . "\n";
	print OUT "sText22=" . $sText[22] . "\n";
	print OUT "sText23=" . $sText[23] . "\n";
	print OUT "sText24=" . $sText[24] . "\n";
	print OUT "sText25=" . $sText[25] . "\n";
	print OUT "sText26=" . $sText[26] . "\n";
	print OUT "sText27=" . $sText[27] . "\n";
	print OUT "sText28=" . $sText[28] . "\n";
	print OUT "sText29=" . $sText[29] . "\n";
	print OUT "sText30=" . $sText[30] . "\n";
	print OUT "sText31=" . $sText[31] . "\n";
	print OUT "sText32=" . $sText[32] . "\n";
	print OUT "sText33=" . $sText[33] . "\n";
	print OUT "sText34=" . $sText[34] . "\n";
	print OUT "sText35=" . $sText[35] . "\n";
	print OUT "sText36=" . $sText[36] . "\n";

	# 儲存選項
	
	print OUT "IsNormal=" . $IsNormal . "\n";
	print OUT "no_head=" . $no_head . "\n";
	print OUT "no_normal=" . $no_normal . "\n";
	print OUT "jk_num=" . $jk_num . "\n";

	close OUT;
}

# 把 Entry 的資料存入 ini 檔
sub load_ini
{
	local $_;
	open IN, "bm2txt_all.ini";
	$_ = <IN>;
	unless(/\[bm2txt\_all\]/)
	{
     	return;
     }
	while(<IN>)
	{
		chomp;
		if(/sText1_.*?=(.*)/)
		{
			push(@sText1,$1);
			$sText1{$1} = 1;
		}
		elsif(/sText2_.*?=(.*)/)
		{
			push(@sText2,$1);
			$sText2{$1} = 1;
		}
		elsif(/sText3_.*?=(.*)/)
		{
			push(@sText3,$1);
			$sText3{$1} = 1;
		}
		elsif(/sText4_.*?=(.*)/)
		{
			push(@sText4,$1);
			$sText4{$1} = 1;
		}
		elsif(/sText5_.*?=(.*)/)
		{
			push(@sText5,$1);
			$sText5{$1} = 1;
		}
		elsif(/sText6_.*?=(.*)/)
		{
			push(@sText6,$1);
			$sText6{$1} = 1;
		}
		elsif(/sText7_.*?=(.*)/)
		{
			push(@sText7,$1);
			$sText7{$1} = 1;
		}
		elsif(/sText8_.*?=(.*)/)
		{
			push(@sText8,$1);
			$sText8{$1} = 1;
		}
		elsif(/sText9_.*?=(.*)/)
		{
			push(@sText9,$1);
			$sText9{$1} = 1;
		}
		elsif(/sText10_.*?=(.*)/)
		{
			push(@sText10,$1);
			$sText10{$1} = 1;
		}
		elsif(/sText11_.*?=(.*)/){push(@sText11,$1); $sText11{$1} = 1;}
		elsif(/sText12_.*?=(.*)/){push(@sText12,$1); $sText12{$1} = 1;}
		elsif(/sText13_.*?=(.*)/){push(@sText13,$1); $sText13{$1} = 1;}
		elsif(/sText14_.*?=(.*)/){push(@sText14,$1); $sText14{$1} = 1;}
		elsif(/sText15_.*?=(.*)/){push(@sText15,$1); $sText15{$1} = 1;}
		elsif(/sText16_.*?=(.*)/){push(@sText16,$1); $sText16{$1} = 1;}
		elsif(/sText17_.*?=(.*)/){push(@sText17,$1); $sText17{$1} = 1;}
		elsif(/sText18_.*?=(.*)/){push(@sText18,$1); $sText18{$1} = 1;}
		elsif(/sText19_.*?=(.*)/){push(@sText19,$1); $sText19{$1} = 1;}
		elsif(/sText20_.*?=(.*)/){push(@sText20,$1); $sText20{$1} = 1;}
		elsif(/sText21_.*?=(.*)/){push(@sText21,$1); $sText21{$1} = 1;}
		elsif(/sText22_.*?=(.*)/){push(@sText22,$1); $sText22{$1} = 1;}
		elsif(/sText23_.*?=(.*)/){push(@sText23,$1); $sText23{$1} = 1;}
		elsif(/sText24_.*?=(.*)/){push(@sText24,$1); $sText24{$1} = 1;}
		elsif(/sText25_.*?=(.*)/){push(@sText25,$1); $sText25{$1} = 1;}
		elsif(/sText26_.*?=(.*)/){push(@sText26,$1); $sText26{$1} = 1;}
		elsif(/sText27_.*?=(.*)/){push(@sText27,$1); $sText27{$1} = 1;}
		elsif(/sText28_.*?=(.*)/){push(@sText28,$1); $sText28{$1} = 1;}
		elsif(/sText29_.*?=(.*)/){push(@sText29,$1); $sText29{$1} = 1;}
		elsif(/sText30_.*?=(.*)/){push(@sText30,$1); $sText30{$1} = 1;}
		elsif(/sText31_.*?=(.*)/){push(@sText31,$1); $sText31{$1} = 1;}
		elsif(/sText32_.*?=(.*)/){push(@sText32,$1); $sText32{$1} = 1;}
		elsif(/sText33_.*?=(.*)/){push(@sText33,$1); $sText33{$1} = 1;}
		elsif(/sText34_.*?=(.*)/){push(@sText34,$1); $sText34{$1} = 1;}
		elsif(/sText35_.*?=(.*)/){push(@sText35,$1); $sText35{$1} = 1;}
		elsif(/sText36_.*?=(.*)/){push(@sText36,$1); $sText36{$1} = 1;}
		
		elsif(/sText[1]=(.*)/)
		{
			$sText[1] = $1;
		}
		elsif(/sText[2]=(.*)/)
		{
			$sText[2] = $1;
		}
		elsif(/sText[3]=(.*)/)
		{
			$sText[3] = $1;
		}
		elsif(/sText[4]=(.*)/)
		{
			$sText[4] = $1;
		}
		elsif(/sText[5]=(.*)/)
		{
			$sText[5] = $1;
		}
		elsif(/sText[6]=(.*)/)
		{
			$sText[6] = $1;
		}
		elsif(/sText[7]=(.*)/)
		{
			$sText[7] = $1;
		}
		elsif(/sText[8]=(.*)/)
		{
			$sText[8] = $1;
		}
		elsif(/sText[9]=(.*)/)
		{
			$sText[9] = $1;
		}
		elsif(/sText[10]=(.*)/)
		{
			$sText[10] = $1;
		}
		elsif(/sText[11]=(.*)/) {$sText[11] = $1;}
		elsif(/sText[12]=(.*)/) {$sText[12] = $1;}
		elsif(/sText[13]=(.*)/) {$sText[13] = $1;}
		elsif(/sText[14]=(.*)/) {$sText[14] = $1;}
		elsif(/sText[15]=(.*)/) {$sText[15] = $1;}
		elsif(/sText[16]=(.*)/) {$sText[16] = $1;}
		elsif(/sText[17]=(.*)/) {$sText[17] = $1;}
		elsif(/sText[18]=(.*)/) {$sText[18] = $1;}
		elsif(/sText[19]=(.*)/) {$sText[19] = $1;}
		elsif(/sText[20]=(.*)/) {$sText[20] = $1;}
		elsif(/sText[21]=(.*)/) {$sText[21] = $1;}
		elsif(/sText[22]=(.*)/) {$sText[22] = $1;}
		elsif(/sText[23]=(.*)/) {$sText[23] = $1;}
		elsif(/sText[24]=(.*)/) {$sText[24] = $1;}
		elsif(/sText[25]=(.*)/) {$sText[25] = $1;}
		elsif(/sText[26]=(.*)/) {$sText[26] = $1;}
		elsif(/sText[27]=(.*)/) {$sText[27] = $1;}
		elsif(/sText[28]=(.*)/) {$sText[28] = $1;}
		elsif(/sText[29]=(.*)/) {$sText[29] = $1;}
		elsif(/sText[30]=(.*)/) {$sText[30] = $1;}
		elsif(/sText[31]=(.*)/) {$sText[31] = $1;}
		elsif(/sText[32]=(.*)/) {$sText[32] = $1;}
		elsif(/sText[33]=(.*)/) {$sText[33] = $1;}
		elsif(/sText[34]=(.*)/) {$sText[34] = $1;}
		elsif(/sText[35]=(.*)/) {$sText[35] = $1;}
		elsif(/sText[36]=(.*)/) {$sText[36] = $1;}
		elsif(/^(.*?)=(.*)/)
		{
			my $tmp1 = $1;
			my $tmp2 = $2;
			eval "\$$tmp1 = '$tmp2'";
		}
	}
	close IN;
}


sub show_readme
{
	if (Exists($win_readme))
	{
		$win_readme->deiconify();		# 會由最小化恢復
		$win_readme->raise();			# 大概是會跑到最前面, 但不會取得焦點
		$win_readme->focus();
	}
	else 
	{
		$win_readme = $mw->Toplevel( );
		$win_readme->focus();
		$win_readme->title("Toplevel");
		$txtReadme = $win_readme->Scrolled('ROText', -scrollbars => 'osoe')
			->pack(-expand => 1, -fill => 'both');
		$txtReadme->insert('end', << 'EOD'
------------------------------------------------------------------------------
BM2TXT_ALL.PL                                             by heaven  2011/01/25

【程式說明】

　　本程式是呼叫 c:\cbwork\simple\bin\fgformat.pl ，
　　程式目的是由簡單標記 BM 版經文產生各種版本的普及版。

【參數說明】

　　參數在程式中間左方，有大正、卍續、嘉興、正史、藏外等各組，用法相同。
　　此處以大正藏為例，參數有三種輸入法：

　　1. 只處理一冊，在「大正藏 從」輸入某一冊的數字即可。

　　2. 處理連續冊，例如由大正藏第 10 冊至第 20 冊，即在「大正藏 從」輸入 10，
　　  「大正藏 到」輸入 20 即可。

　　3. 處理指定冊數，可用半型逗號分開數字，也可用 (數字..數字) 來表示連續範圍。
　　   這種格式只能出現在「大正藏 從」，此時會忽略「大正藏 到」的欄位內容。
　　   例如在「大正藏 從」輸入：
　　   5,7,(10..14),20,(40..42)
　　   表示處理的冊數為 5,7,10,11,12,13,14,20,40,41,42
   
　　　 不存在的冊數會自動忽略，所以處理大正藏全部可以用方法 2 的由 1 到 85 冊，
　　　 也可以用方法 3 輸入 (1..55),85 或 (1..85) 甚至 (1..99) 都可以。
　　　 三位數以上的數字則不會通過檢查。

【按鈕工具】

　　程式中間左方是工具按鈕，方便提供基本的預設值。

　　也提供各種格式的選擇。	

【程式特色】

　　本程式會將使用過的參數及上次最後執行的參數存在 bm2txt_all.ini 該檔之中，
	此檔請勿隨意手動修改，至少不要破壞順序，歷史記錄最多30筆，下次再次執行
　　程式時，可以呈現上次最後開啟的畫面，而且可以很方便找到經常使用到的參數。

【版本歷史】

　　2011/01/25 V1.0    第一版
------------------------------------------------------------------------------
EOD
		);
	}
}