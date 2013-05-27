# my $ver = "normal";
my $ver = "pda";
# my $ver = "app";
# my $ver = "app1";

my $source_root;
my $target_root;

$source_root = "C:/release/$ver/";		# 來源目錄
$target_root = "c:/work/$ver/";		# 目的目錄

my $TFrom = 1; 		# 大正藏處理冊數開始
my $Tto = 85;		# 大正藏處理冊數結束
my $XFrom = 1; 		# 卍續藏處理冊數開始
my $Xto = 88;		# 卍續藏處理冊數結束
my $JFrom = 1;		# 嘉興藏處理冊數開始
my $Jto = 40;		# 嘉興藏處理冊數結束
my $HFrom = 1;		# 正史處理冊數開始
my $Hto = 1;		# 正史處理冊數結束
my $WFrom = 1;		# 藏外處理冊數開始
my $Wto = 9;		# 藏外處理冊數結束

my $runT = 1;		# 執行大正藏
my $runX = 1;		# 執行卍續藏
my $runJ = 0;		# 執行嘉興藏
my $runH = 0;		# 執行正史
my $runW = 0;		# 執行藏外

##############################################
# 主程式
##############################################

mkdir ($target_root) unless(-d $target_root);

$TFrom = 9999 if($runT == 0);
$XFrom = 9999 if($runX == 0);
$JFrom = 9999 if($runJ == 0);
$HFrom = 9999 if($runH == 0);
$WFrom = 9999 if($runW == 0);

for(my $i = $TFrom; $i<= $Tto; $i++)
{
	$i = 85 if ($i == 56);
	$vol = sprintf("T%02d", $i);
	dothisdir($vol);
}
for(my $i = $XFrom; $i<= $Xto; $i++)
{
	$i = 7 if ($i == 6);
	$i = 53 if ($i == 52);
	
	$vol = sprintf("X%02d", $i);
	dothisdir($vol);
}
for(my $i = $JFrom; $i<= $Jto; $i++)
{
	$i = 10 if ($i == 2);
	$i = 15 if ($i == 11);
	$i = 19 if ($i == 16);

	$vol = sprintf("J%02d", $i);
	dothisdir($vol);
}
for(my $i = $HFrom; $i<= $Hto; $i++)
{
	$vol = sprintf("H%02d", $i);
	dothisdir($vol);
}
for(my $i = $WFrom; $i<= $Wto; $i++)
{
	$vol = sprintf("W%02d", $i);
	dothisdir($vol);
}
print "ok!\n";
<>;
exit;


# 處理單一目錄

sub dothisdir
{
	my $vol = shift;
	my $source_dir = $source_root . $vol . "/*.*";
	open OUT, ">${target_root}${vol}.txt" or die "open ${target_root}${vol}.txt error!";
	my @files = <{$source_dir}>;
	foreach my $file (sort(@files))
	{
		dothisfile($file);
	}
	close OUT;
}

# 處理單一檔案

sub dothisfile
{
	my $file_from = shift;
	print $file_from . "\n";
	
	open IN, "$file_from" or die "open $file_from error";
	my $linenum = 0;
	while(<IN>)
	{
		$linenum++;
		if($ver eq "pda")
		{
			next if($linenum <=5);
			s/\[\d{4}[a-z]\d\d\]//;
		}
		if($ver eq "normal" or $ver eq "app" or $ver eq "app1")
		{
			next if($_ !~ /^[TXJHWI]/);
			s/[TXJHWI]\d\dn.{5}p\d{4}.\d\d.*?║//;
		}
		chomp;
		s/ //g;
		s/　//g;
		print OUT "$_";
	}
	close IN;	
}
