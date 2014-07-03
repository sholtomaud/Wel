Wel
===
Batch file with embedded perl to produce well file from a CSV

Setup
===
* You must have Perl installed on your machine 
* Use strawberry perl - [http://strawberryperl.com/]
* csv input file should be of the form

```
2	50	AUTOFLOWREDUCE			
0	0	0	STRESS	PERIOD	1
0	0	1	STRESS	PERIOD	2
1	-5159.808				
0	0	1	STRESS	PERIOD	3
1	-5208.192				
0	0	1	STRESS	PERIOD	4
```

Output
===
Output is to output.wel in the same directory of the script. It should look like:

```
         2         50 AUTOFLOWREDUCE       
         0         0         0       STRESS PERIOD 1  
         0         0         1       STRESS PERIOD 2  
         1 -5159.808                                  
         0         0         1       STRESS PERIOD 3  
         1 -5208.192                                  
         0         0         1       STRESS PERIOD 4  
         1 -5063.904                                  
         0         0         1       STRESS PERIOD 5  
         1 -5039.712                                  
         0         0         1       STRESS PERIOD 6 
         etc ...
```
