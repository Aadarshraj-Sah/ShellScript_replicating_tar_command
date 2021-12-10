# ShellScript_replicating_tar_command
The command that has to be typed from command prompt to execute your programme: <br>
 	 ``
	 bash -f 200101001.sh 
   ``


________________________________________________________________________________

Some Salient features of my programme are as follows : 


*	This is the programme replicating behaviour of tar cmd.
	Input cmd format:
	tar [functions] [filename.tar] [file(s).txt (if required)]


*	The following functions can be executed in this program:

	**cvf**: <br>
		tar cvf filename.tar [input file(s)]
       	creates an uncompressed tar Archive and displays verbose information.

	**cf**: <br> 
		tar cf filename.tar [input file(s)]
       	Creates an uncompressed tar Archive.

	**rvf**: <br>
		tar rvf filename.tar [input file(s)]
	Appends more files to our uncompressed tar Archive
	and displays verbose information.

	**rf**: <br>
		tar rf filename.tar [input file(s)]
     	Appends more files to our uncompressed tar Archive.

	**xvf**: <br> 
       		tar xvf filename.tar [output file(s)]
       	Extracting particular [output file(s)] from Archive and displays verbose       
       	information.
    		tar xvf filename.tar
       	Extracting all files from Archive and displays verbose information.

	**xf**: <br>
    		tar xvf filename.tar [output file(s)]
       	Extracting particular [output file(s)] from Archive.
    		tar xvf filename.tar
       	Extracting all files from Archive.

	**tvf**: <br> 
		tar tvf filename.tar 
       	Displays detailed information about the contents in tar file.

	**tf**:  <br>
		tar tf filename.tar 
       	Lists the contents stored in the tarfile
	

*	All permutations of cvf, cf, rvf, rf, xvf, xf, tvf, tf is taken care.


*	Error message will be shown if incorrect command is entered.


*	The programme is very well commented at each step for ease of understanding.


*	Programme works perfectly fine for .txt files but may or may not work
	for other formats. 


*	Only the .tar files which are created by this programme can be extracted
	using 'xvf' command using this programme.

