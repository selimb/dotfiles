#!/usr/bin/env python
import datetime
import os
import sys
import subprocess

OUT = os.path.expanduser('~/JOBS')
PYTHON_CMD = 'python ~/scripts/monitr.py'
ARGS = '$PBS_JOBID $PBS_O_WORKDIR'
CMD_LINE = PYTHON_CMD + ' %s ' + ARGS + '\n'
JOB_IN = 'job_script'
JOB_OUT = 'job_script_selimb'


def write(line):
    stamp = now()
    stamped_line = '%s %s' % (stamp, line)
    open(OUT, 'a').write(stamped_line + '\n')


def now():
    time = datetime.datetime.now().time()
    return '[%s:%s:%s]' % (time.hour, time.minute, time.second)


def format_jobid(jobid):
    return jobid.strip().split('.')[0]


def submit(info):
    print 'submit -- ', info
    lines = open(JOB_IN).readlines()
    out = open(JOB_OUT, 'w')
    has_start = False
    has_finish = False
    for i, line in enumerate(lines):
        if line.startswith('mpiexec'):
            run_line = i
            break
    else:
        print 'Could not find mpiexec line'
        return

    out.writelines(lines[:run_line])
    out.write(CMD_LINE % 'start')
    out.write(lines[run_line])
    out.write(CMD_LINE % 'finish')
    out.writelines(lines[run_line+1:])
    out.close()
    p = subprocess.Popen('qsub %s' % JOB_OUT, stdout=subprocess.PIPE, shell=True)
    out, _ = p.communicate()
    jobid = format_jobid(out)
    workdir = os.getcwd()
    line = 'SUBMIT %s in %s:\n  %s' % (jobid, workdir, info)
    write(line)


def progress(stat, jobid, workdir):
    line = '%s %s in %s' % (stat, format_jobid(jobid), workdir)
    write(line)


if __name__ == '__main__':
    argv = sys.argv[1:]
    cmd = argv[0]
    if cmd == 'submit':
        info = argv[1]
        submit(info)
    elif cmd == 'start' or cmd == 'finish'
        jobid, workdir = argv[1:]
        progress(cmd.upper(), jobid, workdir)
