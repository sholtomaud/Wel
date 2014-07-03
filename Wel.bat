@rem = ' Perl Script
@echo off
echo Hello
set mycd=homedir_%cd:\=\\%
perl -wS %0 %1 %2 %mycd%
Pause&Exit
goto :EOF
';
undef @rem; 

use strict;
use warnings;
use Data::Dumper;
use FindBin qw($Bin);

=head1 Wel

Wel produce a .wel file from csv

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

csv input file should be of the form

2	50	AUTOFLOWREDUCE			
0	0	0	STRESS	PERIOD	1
0	0	1	STRESS	PERIOD	2
1	-5159.808				
0	0	1	STRESS	PERIOD	3
1	-5208.192				
0	0	1	STRESS	PERIOD	4
     
=cut

main: {
  my $file = $Bin.'/Wel.csv';
  my $output = $Bin.'/output.wel';
  open (my $infh,"<",$file);
  open (my $outfh,">",$output);

  print "Reading Wel csv file [$file]\n";
  print "Printing to [$output]\n";

  my $row = 0;
  while (<$infh>) {
    $row++;
    chomp $_;
    print "Formatting row $row\r";
    my @components = split(',',$_);

    #print Dumper(@components);
    #         1         50 AUTOFLOWREDUCE	
    #         0         0         0       STRESS PERIOD 1  
    my $stress = $components[3]//"";
    my $period = $components[4]//"";
    my $period_number = $components[5]//"";
    my $stressperiod = "$stress $period "; 
    
    my $output;
    if ( $row == 1 ) {
      my $spacer = "";
      $output = sprintf("%10s%9s%-3s%-21s",$components[0],$spacer,$components[1],$components[2]);  
    }
    else{ 
      
      my $wellval = ( $components[1] < 0)? sprintf("%4.3f",$components[1]): $components[1];
      $output = sprintf("%10s%10s%10s%21s%-3s",$components[0],$wellval,$components[2]//"",$stressperiod,$period_number);  
    }
    
    print $outfh "$output\n";
    #my $stdin = <STDIN>;
  }
  print "done                                           \n";
  close ($infh);
  close ($outfh);

}
1;
