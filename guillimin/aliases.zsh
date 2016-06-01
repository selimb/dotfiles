# Connect to Guillimin
alias guigui='ssh selimb@guillimin.clumeq.ca'

# SFTP to Guillimin
alias guiguiftp='sftp selimb@guillimin.clumeq.ca'

# cd to syn3d's project directory
alias syn3d='cd /sb/project/rck-371-aa/selimb/syn3d'

# Request job node
alias jobnode='qsub -I -l walltime=6:00:00,nodes=1:ppn=16 -A rck-371-aa'
