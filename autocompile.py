#!/usr/bin/env python
from watchdog import events, observers
from paver.easy import *
import subprocess

class AutoCompile(events.FileSystemEventHandler):
    def compile(self, src):
        if src.endswith('.cpp'):
            src = path(src)
            dst = src.splitext()[0]
            print src, '=>', dst
            ret = subprocess.call(['g++', '-Wall', '-O2', '-g',
                '-DTEST=1', '-std=c++11', src, '-o', dst])
            if ret:
                return
            subprocess.call([dst])

    def on_created(self, event):
        self.compile(event.src_path)

    def on_modified(self, event):
        self.compile(event.src_path)

observer = observers.Observer()
observer.schedule(AutoCompile(), '.', True)
observer.start()

try:
    while True:
        observer.join(1)
except KeyboaardInterrupt:
    observer.stop()
