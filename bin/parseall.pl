# parse ����
# v 1.1.1 2003/12/29 03:57�U�� by Ray
# v 1.1.2 2003/12/30 09:28�W�� by Ray

$xml_root="c:/cbwork/xml";
$log_file = "c:/temp/parseall.out";

open O, ">$log_file" or die;
select O;

opendir DIR, "$xml_root" or die;
@alldir = grep /^[TXJHWIABCDFGKLMNPQSU]\d\d/, readdir DIR;
closedir DIR;
foreach $vol (@alldir) {
	$dir = "$xml_root/$vol";
	if(-d $dir)
	{
		chdir($dir);
		do_vol();
	}
}

sub do_vol {
	$vol = substr($vol,0,3);
	
	opendir (INDIR, $dir);
	@allfiles = grep(/\.xml$/i, readdir(INDIR));
	
	die "$dir No files to process\n" unless @allfiles;	
	        
	for $file (sort(@allfiles)) { 
		do1file($file); 
	}
}

sub do1file {
	$file = shift;
	$file =~ s/^t/T/;
	$file =~ s/\.xml$//;
	print STDERR "$file ";
	system "c:\\bin\\w32\\sp\\bin\\nsgmls.exe -e -s -E20 -f$file.err c:\\bin\\w32\\sp\\pubtext\\xml.dcl $file.xml";
	if (-s "$file.err") {
		open I, "$file.err" or die;
		while (<I>) {
			print;
		}
		close I;
	}
	unlink "$file.err";
}