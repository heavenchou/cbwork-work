# my $ver = "normal";
my $ver = "pda";
# my $ver = "app";
# my $ver = "app1";

my $source_root;
my $target_root;

$source_root = "C:/release/$ver/";		# �ӷ��ؿ�
$target_root = "c:/work/$ver/";		# �ت��ؿ�

my $TFrom = 1; 		# �j���óB�z�U�ƶ}�l
my $Tto = 85;		# �j���óB�z�U�Ƶ���
my $XFrom = 1; 		# �����óB�z�U�ƶ}�l
my $Xto = 88;		# �����óB�z�U�Ƶ���
my $JFrom = 1;		# �ſ��óB�z�U�ƶ}�l
my $Jto = 40;		# �ſ��óB�z�U�Ƶ���
my $HFrom = 1;		# ���v�B�z�U�ƶ}�l
my $Hto = 1;		# ���v�B�z�U�Ƶ���
my $WFrom = 1;		# �å~�B�z�U�ƶ}�l
my $Wto = 9;		# �å~�B�z�U�Ƶ���

my $runT = 1;		# ����j����
my $runX = 1;		# ����������
my $runJ = 0;		# ����ſ���
my $runH = 0;		# ���楿�v
my $runW = 0;		# �����å~

##############################################
# �D�{��
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


# �B�z��@�ؿ�

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

# �B�z��@�ɮ�

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
			s/[TXJHWI]\d\dn.{5}p\d{4}.\d\d.*?��//;
		}
		chomp;
		s/ //g;
		s/�@//g;
		print OUT "$_";
	}
	close IN;	
}
