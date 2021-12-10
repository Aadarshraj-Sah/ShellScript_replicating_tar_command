#!/bin/sh

# taking input
echo "Enter the command"
read string

#storing each word of command in an array
IFS=' ' read -r -a arr <<< "$string"


declare -i n=${#arr[@]} #size of the array
declare -i check=0  #to check the validity of command

delim="q1w2e3r4t5y6u7i8" #16 digit deliminator created to seperate two files


#Implementing cvf also taking care of each permutation
if [[ ( "${arr[1]}" == "cvf" ) || ( "${arr[1]}" == "vfc" ) || ( "${arr[1]}" == "fcv" ) || ( "${arr[1]}" == "fvc" ) || ( "${arr[1]}" == "cfv" ) || ( "${arr[1]}" == "vcf" ) ]]
then
    check=1
    echo "${arr[3]}"
    echo -e "\n$delim" > ${arr[2]}          #creation of file using redirection
    ls -l "${arr[3]}" | cat - "${arr[2]}" > temp && mv temp "${arr[2]}"         #verbose information stored in header
    echo "${arr[3]}" >> ${arr[2]}           #printing file name as cmd has -v
    cat ${arr[3]} >> ${arr[2]}              #copying contents to .tar file
    echo -e "\n$delim" >> ${arr[2]}
    a=4
    while [ $a -lt $n ]
    do
        echo "${arr[a]}"
        echo "${arr[a]}" >> ${arr[2]}
        cat ${arr[a]} >> ${arr[2]}
        echo -e "\n$delim" >> ${arr[2]}
        ls -l "${arr[a]}" | cat - "${arr[2]}" > temp && mv temp "${arr[2]}"
        a=`expr $a + 1`
    done

fi

#Implementing cf also taking care of each permutation, working is similar to cvf
if [[ ( "${arr[1]}" == "cf" ) || ( "${arr[1]}" == "fc" ) ]]
then
    check=1
    echo -e "\n$delim" > ${arr[2]}
    ls -l "${arr[3]}" | cat - "${arr[2]}" > temp && mv temp "${arr[2]}"
    echo "${arr[3]}" >> ${arr[2]}
    cat ${arr[3]} >> ${arr[2]}
    echo -e "\n$delim" >> ${arr[2]}
    a=4
    while [ $a -lt $n ]
    do
        echo "${arr[a]}" >> ${arr[2]}
        cat ${arr[a]} >> ${arr[2]}
        echo -e "\n$delim" >> ${arr[2]}
        ls -l "${arr[a]}" | cat - "${arr[2]}" > temp && mv temp "${arr[2]}"
        a=`expr $a + 1`
    done
fi


#Implementing rvf also taking care of each permutation, working is similar to cvf
if [[ ( "${arr[1]}" == "rvf" ) || ( "${arr[1]}" == "vfr" ) || ( "${arr[1]}" == "frv" ) || ( "${arr[1]}" == "fvr" ) || ( "${arr[1]}" == "rfv" ) || ( "${arr[1]}" == "vrf" ) ]]
then
    check=1
    echo "${arr[3]}"
    echo "${arr[3]}" >> ${arr[2]}
    cat ${arr[3]} >> ${arr[2]}
    echo -e "\n$delim" >> ${arr[2]}
    ls -l "${arr[3]}" | cat - "${arr[2]}" > temp && mv temp "${arr[2]}"
    a=4
    while [ $a -lt $n ]
    do
        echo "${arr[a]}"
        echo "${arr[a]}" >> ${arr[2]}
        cat ${arr[a]} >> ${arr[2]}
        echo -e "\n$delim" >> ${arr[2]}
        ls -l "${arr[a]}" | cat - "${arr[2]}" > temp && mv temp "${arr[2]}"
        a=`expr $a + 1`
    done

fi

#Implementing rf also taking care of each permutation, working is similar to cf
if [[ ( "${arr[1]}" == "rf" ) || ( "${arr[1]}" == "fr" ) ]]
then
    check=1
    echo "${arr[3]}" >> ${arr[2]}
    cat ${arr[3]} >> ${arr[2]}
    echo -e "\n$delim" >> ${arr[2]}
    ls -l "${arr[3]}" | cat - "${arr[2]}" > temp && mv temp "${arr[2]}"
    a=4
    while [ $a -lt $n ]
    do
        echo "${arr[a]}" >> ${arr[2]}
        cat ${arr[a]} >> ${arr[2]}
        echo -e "\n$delim" >> ${arr[2]}
        ls -l "${arr[a]}" | cat - "${arr[2]}" > temp && mv temp "${arr[2]}"
        a=`expr $a + 1`
    done
fi


#Implementing xvf also taking care of each permutation
if [[ ( "${arr[1]}" == "xvf" ) || ( "${arr[1]}" == "vfx" ) || ( "${arr[1]}" == "fxv" ) || ( "${arr[1]}" == "fvx" ) || ( "${arr[1]}" == "xfv" ) || ( "${arr[1]}" == "vxf" ) ]]
then
    check=1
    if [[ -z "${arr[3]}" ]]                             #checking whether input files are mentioned or not
    then
        declare -i temp1=0                              #setting switches
        declare -i temp2=0
        while read line; do                             #reading each line
        
        if [[ "$line" = "$delim" ]]                     #next line will be file name
        then
            temp1=1
            temp2=0
        
        elif [[ ( $temp1 -eq 1 && $temp2 -eq 0 ) ]]     #creation of new file with the filename
        then
            filename="$line"
            echo "$filename"
            touch "$filename"
            temp2=1
            temp1=0
        elif [[ ( $temp1 -eq 0 && $temp2 -eq 1 ) ]]     #appending each line into the file till we find a deliminator
        then
            echo "$line" >> "$filename"
        fi
        done < ${arr[2]}
        
    else                                                #specific files are mentioned which are to be extracted
        a=3
        while [ $a -lt $n ]                             #extracting each specified file one by one
        do
            declare -i temp3=0                          #switch
            while read line; do                         #reading each line
            
            if [[ $temp3 -eq 1 && "$line" = "$delim" ]]
            then
                break
            
            elif [[ $temp3 -eq 0 && "$line" = "${arr[a]}" ]]    #finding the file by filename
            then
                temp3=1
                echo "${arr[a]}"                        #printing file name as cmd has -v
                touch "${arr[a]}"                       #creation of new file by same file name
            
            elif [[ $temp3 -eq 1 ]]
            then
                echo "$line" >> "${arr[a]}"             #appending its contents to the created file
            fi
            
            done < ${arr[2]}
            
            a=`expr $a + 1`
        done
    fi
fi

#Implementing xf also taking care of each permutation, working is similar to xvf
if [[ ( "${arr[1]}" == "xf" ) || ( "${arr[1]}" == "fx" ) ]]
then
    check=1
    if [[ -z "${arr[3]}" ]]
    then
        declare -i temp1=0
        declare -i temp2=0
        while read line; do                             # reading each line
        
        if [[ "$line" = "$delim" ]]
        then
            temp1=1
            temp2=0
        
        elif [[ ( $temp1 -eq 1 && $temp2 -eq 0 ) ]]
        then
            filename="$line"
            touch "$filename"
            temp2=1
            temp1=0
        elif [[ ( $temp1 -eq 0 && $temp2 -eq 1 ) ]]
        then
            echo "$line" >> "$filename"
        fi
        
        done < ${arr[2]}
    else
        a=3
        while [ $a -lt $n ]
        do
            declare -i temp4=0
            while read line; do                         # reading each line
            
            if [[ $temp4 -eq 1 && "$line" = "$delim" ]]
            then
                break
            
            elif [[ $temp4 -eq 0 && "$line" = "${arr[a]}" ]]
            then
                temp4=1
                touch "${arr[a]}"
            
            elif [[ $temp4 -eq 1 ]]
            then
                echo "$line" >> "${arr[a]}"
            fi
            
            done < ${arr[2]}
            
            a=`expr $a + 1`
        done
        
    fi
fi


#Implementing tf also taking care of each permutation
if [[ ( "${arr[1]}" == "tf" ) || ( "${arr[1]}" == "ft" ) ]]
then
    check=1
    declare -i temp5=0
    while read line; do                                 # reading each line
    
    if [[ $temp5 -eq 0 && "$line" = "$delim" ]]         #next line will be file name
    then
        temp5=1
    
    elif [[ $temp5 -eq 1 ]]
    then
        echo "$line"                                    #print list of all files
        temp5=0
    fi
    done < ${arr[2]}
fi

#Implementing tvf also taking care of each permutation
if [[ ( "${arr[1]}" == "tvf" ) || ( "${arr[1]}" == "vft" ) || ( "${arr[1]}" == "ftv" ) || ( "${arr[1]}" == "fvt" ) || ( "${arr[1]}" == "tfv" ) || ( "${arr[1]}" == "vtf" ) ]]
then
    check=1
    if [[ -z "${arr[3]}" ]]
    then
        declare -i temp6=0
        while read line; do                             # reading each line
        
        if [[ "$line" = "$delim" ]]                     #need to break when 1st deliminator comes
        then
            break;
        else
            echo "$line"                                #print all detailed information stored in header
        fi
        done < ${arr[2]}
        
    fi
fi

#if none of the above command was executed
if [[ $check -eq 0 ]]
then
echo "command not found"
fi
