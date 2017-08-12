Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id EF44578352
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Aug 2017 09:07:00 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g32so3906499wrd.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Aug 2017 02:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=VakAGjyx6yv/7qWeO00VWMz7R6YZ/PRagwFvEmzAuzA=;
	b=IRCSPHXN3v/nwP0bQoIVyh91fmxA9wLrquY+v+6XkcMFx05sFJiNESTQsrTpwYoatP
	QWPFgG6yzO/09bq8UjbFEwHK89heGlDilTDyE8TkEWTewO351Q+l1ukHpwp/gCeteUff
	/b3vSf9yjcHN7pDQUlvXGGdt2KSBcp7gWwjobMKNUrOU8DlbZ04w1xBUuo4Edk1+xAIC
	aMtSaIagus7CPLk1IdPES6cw0+eK+ZjiRA8CYXwc2hurq6o9sAYQNT1kuZLWT5IhtSfs
	QJ2HXFah0vf5MipDZb5zLA/AayULVra1yPCT0FnsHSfiMK1zieiqBc6u0fCPuUilbMa3
	dxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=VakAGjyx6yv/7qWeO00VWMz7R6YZ/PRagwFvEmzAuzA=;
	b=NzjKoZbCNDc7zMBSBdGrhfDeBpXnCpAtplAhVDP+JthWKTkBoWVStlkOPDWnCd8aDG
	b8VBczZ+XUFEhkev5igAygU6sunkG3JWTx3moXggHsVbmtu1W/T+j7byJiPfoLu0hbNx
	m+obJXd83rAY0WtlqVGS70AsSyM/oMm32OfuJU8/wlRo9cAMZ6Mm0DsZy1Yj4sSn1+kI
	5+wEgxOgsTFInvq1Z296KC2gdoQD5WqU0DAZbAvLOaCcz0w3F9VzQt0RU2gQzuScW8kf
	POSG56eB3mSeYSPeSrlOLfvSXCa0q2jfw+OCgFV9DOoKAcOaWgHb3ajONNMczOVLrqlQ
	o7tQ==
X-Gm-Message-State: AHYfb5iNsbOPAJmC+YtHUG+IeyXnhCWivI77HE3nD0AIuVBDOXQrXntT
	RYN3IcF/VhlIVX1h
X-Received: by 10.223.136.155 with SMTP id f27mr12695489wrf.291.1502528821277; 
	Sat, 12 Aug 2017 02:07:01 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 92sm1768812wrr.58.2017.08.12.02.06.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 12 Aug 2017 02:06:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 12 Aug 2017 11:08:30 +0200
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20170812090830.GA3337@jama>
References: <cover.1501142861.git.hongxu.jia@windriver.com>
	<2b121c2e2fbf3f417f9689d2435084d01a4a2f68.1501142861.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <2b121c2e2fbf3f417f9689d2435084d01a4a2f68.1501142861.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 5/6] python3-blivet: add recipe 2.2.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Aug 2017 09:07:01 -0000
X-Groupsio-MsgNum: 68097
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2017 at 04:44:25AM -0400, Hongxu Jia wrote:
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../python3-blivet/0001-comment-out-selinux.patch  |  70 ++++++++++++++
>  .../0002-run_program-support-timeout.patch         | 102 +++++++++++++++=
++++++
>  .../0003-support-infinit-timeout.patch             |  66 +++++++++++++
>  .../0004-Mount-var-volatile-during-install.patch   |  59 ++++++++++++
>  .../0005-update-fstab-by-appending.patch           |  32 +++++++
>  ...0006-fix-new.roots-object-is-not-iterable.patch |  28 ++++++
>  ...correct-timeout-while-system-time-changed.patch |  48 ++++++++++
>  .../python3-blivet/0008-tweak-btrfs-packages.patch |  45 +++++++++
>  ...0009-invoking-mount-with-infinite-timeout.patch |  31 +++++++
>  ...-use-oe-variable-to-replace-hardcoded-dir.patch |  34 +++++++
>  .../0011-invoking-fsck-with-infinite-timeout.patch |  31 +++++++
>  .../0012-invoking-mkfs-with-infinite-timeout.patch |  31 +++++++
>  ...evert-Adapt-to-logging-module-name-change.patch |  30 ++++++
>  .../python-blivet/python3-blivet_2.2.0.bb          |  46 ++++++++++
>  14 files changed, 653 insertions(+)
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet/0001-comment-out-selinux.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet/0002-run_program-support-timeout.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet/0003-support-infinit-timeout.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet/0004-Mount-var-volatile-during-install.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet/0005-update-fstab-by-appending.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet/0006-fix-new.roots-object-is-not-iterable.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet/0007-fix-incorrect-timeout-while-system-time-changed.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet/0008-tweak-btrfs-packages.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet/0009-invoking-mount-with-infinite-timeout.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet/0010-use-oe-variable-to-replace-hardcoded-dir.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet/0011-invoking-fsck-with-infinite-timeout.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet/0012-invoking-mkfs-with-infinite-timeout.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet/0013-Revert-Adapt-to-logging-module-name-change.patch
>  create mode 100644 meta-python/recipes-extended/python-blivet/python3-bl=
ivet_2.2.0.bb
>=20
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/00=
01-comment-out-selinux.patch b/meta-python/recipes-extended/python-blivet/p=
ython3-blivet/0001-comment-out-selinux.patch
> new file mode 100644
> index 0000000..0ee3205
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0001-comm=
ent-out-selinux.patch
> @@ -0,0 +1,70 @@
> +From 7d483c27ac0a23ca3bba7f320918afc40013bd8e Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 8 May 2017 14:25:52 +0800
> +Subject: [PATCH 01/13] comment out selinux
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + blivet/flags.py | 5 +++--
> + blivet/util.py  | 6 +++++-
> + 2 files changed, 8 insertions(+), 3 deletions(-)
> +
> +diff --git a/blivet/flags.py b/blivet/flags.py
> +index 06822db..b55a93f 100644
> +--- a/blivet/flags.py
> ++++ b/blivet/flags.py
> +@@ -20,7 +20,7 @@
> + #
> +=20
> + import shlex
> +-import selinux
> ++#import selinux
> +=20
> +=20
> + class Flags(object):
> +@@ -49,7 +49,8 @@ class Flags(object):
> +         #
> +         # enable/disable functionality
> +         #
> +-        self.selinux =3D selinux.is_selinux_enabled()
> ++        #self.selinux =3D selinux.is_selinux_enabled()
> ++        self.selinux =3D False
> +         self.multipath =3D True
> +         self.dmraid =3D True
> +         self.ibft =3D True
> +diff --git a/blivet/util.py b/blivet/util.py
> +index e3e71ce..0cf5188 100644
> +--- a/blivet/util.py
> ++++ b/blivet/util.py
> +@@ -4,7 +4,7 @@ import glob
> + import itertools
> + import os
> + import shutil
> +-import selinux
> ++#import selinux
> + import subprocess
> + import re
> + import sys
> +@@ -431,6 +431,8 @@ def get_cow_sysfs_path(dev_path, dev_sysfsPath):
> + def match_path_context(path):
> +     """ Return the default SELinux context for the given path. """
> +     context =3D None
> ++    return context
> ++
> +     try:
> +         context =3D selinux.matchpathcon(os.path.normpath(path), 0)[1]
> +     except OSError as e:
> +@@ -455,6 +457,8 @@ def set_file_context(path, context, root=3DNone):
> +=20
> +             True if successful, False if not.
> +     """
> ++    return False
> ++
> +     if root is None:
> +         root =3D '/'
> +=20
> +--=20
> +2.7.4
> +
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/00=
02-run_program-support-timeout.patch b/meta-python/recipes-extended/python-=
blivet/python3-blivet/0002-run_program-support-timeout.patch
> new file mode 100644
> index 0000000..01e71be
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0002-run_=
program-support-timeout.patch
> @@ -0,0 +1,102 @@
> +From 86744d408b91acdcb086a03d7779fcda152f2ac3 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 8 May 2017 14:39:56 +0800
> +Subject: [PATCH 02/13] run_program support timeout
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + blivet/util.py | 68 +++++++++++++++++++++++++++++++++------------------=
-------
> + 1 file changed, 39 insertions(+), 29 deletions(-)
> +
> +diff --git a/blivet/util.py b/blivet/util.py
> +index 0cf5188..d4bd9bb 100644
> +--- a/blivet/util.py
> ++++ b/blivet/util.py
> +@@ -158,6 +158,30 @@ class Path(str):
> +     def __hash__(self):
> +         return self._path.__hash__()
> +=20
> ++def timeout_command(argv, timeout, *args, **kwargs):
> ++    """call shell-command and either return its output or kill it
> ++    if it doesn't normally exit within timeout seconds and return None"=
""
> ++    import subprocess, datetime, os, time, signal
> ++    start =3D datetime.datetime.now()
> ++
> ++    try:
> ++        proc =3D subprocess.Popen(argv, *args, **kwargs)
> ++        while proc.poll() is None:
> ++            time.sleep(0.1)
> ++            now =3D datetime.datetime.now()
> ++            if (now - start).seconds> timeout:
> ++                os.kill(proc.pid, signal.SIGKILL)
> ++                os.waitpid(-1, os.WNOHANG)
> ++                program_log.debug("%d seconds timeout" % timeout)
> ++                return (-1, None)
> ++
> ++
> ++    except OSError as e:
> ++        program_log.error("Error running %s: %s", argv[0], e.strerror)
> ++        raise
> ++
> ++    program_log.debug("Return code: %d", proc.returncode)
> ++    return (proc.returncode, proc.stdout.read())
> +=20
> + def _run_program(argv, root=3D'/', stdin=3DNone, env_prune=3DNone, stde=
rr_to_stdout=3DFalse, binary_output=3DFalse):
> +     if env_prune is None:
> +@@ -180,36 +204,22 @@ def _run_program(argv, root=3D'/', stdin=3DNone, e=
nv_prune=3DNone, stderr_to_stdout=3DFa
> +             stderr_dir =3D subprocess.STDOUT
> +         else:
> +             stderr_dir =3D subprocess.PIPE
> +-        try:
> +-            proc =3D subprocess.Popen(argv,
> +-                                    stdin=3Dstdin,
> +-                                    stdout=3Dsubprocess.PIPE,
> +-                                    stderr=3Dstderr_dir,
> +-                                    close_fds=3DTrue,
> +-                                    preexec_fn=3Dchroot, cwd=3Droot, en=
v=3Denv)
> +-
> +-            out, err =3D proc.communicate()
> +-            if not binary_output and six.PY3:
> +-                out =3D out.decode("utf-8")
> +-            if out:
> +-                if not stderr_to_stdout:
> +-                    program_log.info("stdout:")
> +-                for line in out.splitlines():
> +-                    program_log.info("%s", line)
> +-
> +-            if not stderr_to_stdout and err:
> +-                program_log.info("stderr:")
> +-                for line in err.splitlines():
> +-                    program_log.info("%s", line)
> +-
> +-        except OSError as e:
> +-            program_log.error("Error running %s: %s", argv[0], e.strerr=
or)
> +-            raise
> +-
> +-        program_log.debug("Return code: %d", proc.returncode)
> +-
> +-    return (proc.returncode, out)
> +=20
> ++        res, out =3D timeout_command(argv, 10,
> ++                                   stdin=3Dstdin,
> ++                                   stdout=3Dsubprocess.PIPE,
> ++                                   stderr=3Dstderr_dir,
> ++                                   close_fds=3DTrue,
> ++                                   preexec_fn=3Dchroot, cwd=3Droot, env=
=3Denv)
> ++        if not binary_output and six.PY3:
> ++            out =3D out.decode("utf-8")
> ++        if out:
> ++            if not stderr_to_stdout:
> ++                program_log.info("stdout:")
> ++            for line in out.splitlines():
> ++                program_log.info("%s", line)
> ++
> ++    return (res, out)
> +=20
> + def run_program(*args, **kwargs):
> +     return _run_program(*args, **kwargs)[0]
> +--=20
> +2.7.4
> +
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/00=
03-support-infinit-timeout.patch b/meta-python/recipes-extended/python-bliv=
et/python3-blivet/0003-support-infinit-timeout.patch
> new file mode 100644
> index 0000000..489fb56
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0003-supp=
ort-infinit-timeout.patch
> @@ -0,0 +1,66 @@
> +From 923265e04df5920fc99393aa05f584032aa1b383 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 8 May 2017 16:18:02 +0800
> +Subject: [PATCH 03/13] support infinit timeout
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + blivet/util.py | 12 ++++++++----
> + 1 file changed, 8 insertions(+), 4 deletions(-)
> +
> +diff --git a/blivet/util.py b/blivet/util.py
> +index d4bd9bb..44a2da5 100644
> +--- a/blivet/util.py
> ++++ b/blivet/util.py
> +@@ -158,6 +158,7 @@ class Path(str):
> +     def __hash__(self):
> +         return self._path.__hash__()
> +=20
> ++# timeout =3D -1 means infinite timeout, always wait.
> + def timeout_command(argv, timeout, *args, **kwargs):
> +     """call shell-command and either return its output or kill it
> +     if it doesn't normally exit within timeout seconds and return None"=
""
> +@@ -169,7 +170,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
> +         while proc.poll() is None:
> +             time.sleep(0.1)
> +             now =3D datetime.datetime.now()
> +-            if (now - start).seconds> timeout:
> ++            if timeout !=3D -1 and (now - start).seconds> timeout:
> +                 os.kill(proc.pid, signal.SIGKILL)
> +                 os.waitpid(-1, os.WNOHANG)
> +                 program_log.debug("%d seconds timeout" % timeout)
> +@@ -183,7 +184,7 @@ def timeout_command(argv, timeout, *args, **kwargs):
> +     program_log.debug("Return code: %d", proc.returncode)
> +     return (proc.returncode, proc.stdout.read())
> +=20
> +-def _run_program(argv, root=3D'/', stdin=3DNone, env_prune=3DNone, stde=
rr_to_stdout=3DFalse, binary_output=3DFalse):
> ++def _run_program(argv, root=3D'/', stdin=3DNone, env_prune=3DNone, stde=
rr_to_stdout=3DFalse, binary_output=3DFalse, timeout=3D10):
> +     if env_prune is None:
> +         env_prune =3D []
> +=20
> +@@ -192,7 +193,10 @@ def _run_program(argv, root=3D'/', stdin=3DNone, en=
v_prune=3DNone, stderr_to_stdout=3DFa
> +             os.chroot(root)
> +=20
> +     with program_log_lock:  # pylint: disable=3Dnot-context-manager
> +-        program_log.info("Running... %s", " ".join(argv))
> ++        if timeout !=3D -1:
> ++            program_log.info("Running... %s", " ".join(argv))
> ++        else:
> ++            program_log.info("Running... %s ...infinite timeout", " ".j=
oin(argv))
> +=20
> +         env =3D os.environ.copy()
> +         env.update({"LC_ALL": "C",
> +@@ -205,7 +209,7 @@ def _run_program(argv, root=3D'/', stdin=3DNone, env=
_prune=3DNone, stderr_to_stdout=3DFa
> +         else:
> +             stderr_dir =3D subprocess.PIPE
> +=20
> +-        res, out =3D timeout_command(argv, 10,
> ++        res, out =3D timeout_command(argv, timeout,
> +                                    stdin=3Dstdin,
> +                                    stdout=3Dsubprocess.PIPE,
> +                                    stderr=3Dstderr_dir,
> +--=20
> +2.7.4
> +
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/00=
04-Mount-var-volatile-during-install.patch b/meta-python/recipes-extended/p=
ython-blivet/python3-blivet/0004-Mount-var-volatile-during-install.patch
> new file mode 100644
> index 0000000..cb837e2
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0004-Moun=
t-var-volatile-during-install.patch
> @@ -0,0 +1,59 @@
> +From c3959bd00665e24a955bbdbea1ef555e76372f12 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 8 May 2017 16:25:16 +0800
> +Subject: [PATCH 04/13] Mount /var/volatile during install
> +
> +The installed system needs /var/volatile clean, otherwise it
> +caused systemd's journalctl failed to record boot log.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + blivet/osinstall.py | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/blivet/osinstall.py b/blivet/osinstall.py
> +index a4f9535..61819c2 100644
> +--- a/blivet/osinstall.py
> ++++ b/blivet/osinstall.py
> +@@ -294,6 +294,7 @@ class FSSet(object):
> +         self._sysfs =3D None
> +         self._proc =3D None
> +         self._devshm =3D None
> ++        self._volatile =3D None
> +         self._usb =3D None
> +         self._selinux =3D None
> +         self._run =3D None
> +@@ -335,6 +336,12 @@ class FSSet(object):
> +         return self._devshm
> +=20
> +     @property
> ++    def volatile(self):
> ++        if not self._volatile:
> ++            self._volatile =3D NoDevice(fmt=3Dget_format("tmpfs", devic=
e=3D"tmpfs", mountpoint=3D"/var/volatile"))
> ++        return self._volatile
> ++
> ++    @property
> +     def usb(self):
> +         if not self._usb:
> +             self._usb =3D NoDevice(fmt=3Dget_format("usbfs", device=3D"=
usbfs", mountpoint=3D"/proc/bus/usb"))
> +@@ -591,6 +598,7 @@ class FSSet(object):
> +=20
> +         devices =3D list(self.mountpoints.values()) + self.swap_devices
> +         devices.extend([self.dev, self.devshm, self.devpts, self.sysfs,
> ++                        self.volatile,
> +                         self.proc, self.selinux, self.usb, self.run])
> +         if isinstance(_platform, EFI):
> +             devices.append(self.efivars)
> +@@ -650,6 +658,7 @@ class FSSet(object):
> +         """ unmount filesystems, except swap if swapoff =3D=3D False """
> +         devices =3D list(self.mountpoints.values()) + self.swap_devices
> +         devices.extend([self.dev, self.devshm, self.devpts, self.sysfs,
> ++                        self.volatile,
> +                         self.proc, self.usb, self.selinux, self.run])
> +         if isinstance(_platform, EFI):
> +             devices.append(self.efivars)
> +--=20
> +2.7.4
> +
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/00=
05-update-fstab-by-appending.patch b/meta-python/recipes-extended/python-bl=
ivet/python3-blivet/0005-update-fstab-by-appending.patch
> new file mode 100644
> index 0000000..4f343b7
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0005-upda=
te-fstab-by-appending.patch
> @@ -0,0 +1,32 @@
> +From 386ff899763f8473eb93a7a1578fb7cc4f86f66d Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 8 May 2017 16:28:12 +0800
> +Subject: [PATCH 05/13] update fstab by appending
> +
> +The 'storage.write()' has updated fstab by overwriting
> +the original one, we should update fstab by appending
> +to keep original tmpfs partitions.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + blivet/osinstall.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/blivet/osinstall.py b/blivet/osinstall.py
> +index 61819c2..afa82db 100644
> +--- a/blivet/osinstall.py
> ++++ b/blivet/osinstall.py
> +@@ -728,7 +728,7 @@ class FSSet(object):
> +         # /etc/fstab
> +         fstab_path =3D os.path.normpath("%s/etc/fstab" % get_sysroot())
> +         fstab =3D self.fstab()
> +-        open(fstab_path, "w").write(fstab)
> ++        open(fstab_path, "a").write(fstab)
> +=20
> +         # /etc/crypttab
> +         crypttab_path =3D os.path.normpath("%s/etc/crypttab" % get_sysr=
oot())
> +--=20
> +2.7.4
> +
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/00=
06-fix-new.roots-object-is-not-iterable.patch b/meta-python/recipes-extende=
d/python-blivet/python3-blivet/0006-fix-new.roots-object-is-not-iterable.pa=
tch
> new file mode 100644
> index 0000000..f5ff754
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0006-fix-=
new.roots-object-is-not-iterable.patch
> @@ -0,0 +1,28 @@
> +From cd92eea8fab37ba6b0c7f03daa5255343dc75716 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 8 May 2017 16:30:20 +0800
> +Subject: [PATCH 06/13] fix new.roots object is not iterable
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + blivet/blivet.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/blivet/blivet.py b/blivet/blivet.py
> +index 6a33e9c..79ae91a 100644
> +--- a/blivet/blivet.py
> ++++ b/blivet/blivet.py
> +@@ -1761,7 +1761,7 @@ class Blivet(object):
> +             p =3D partition.disk.format.parted_disk.getPartitionByPath(=
partition.path)
> +             partition.parted_partition =3D p
> +=20
> +-        for root in new.roots:
> ++        for root in new.roots or []:
> +             root.swaps =3D [new.devicetree.get_device_by_id(d.id, hidde=
n=3DTrue) for d in root.swaps]
> +             root.swaps =3D [s for s in root.swaps if s]
> +=20
> +--=20
> +2.7.4
> +
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/00=
07-fix-incorrect-timeout-while-system-time-changed.patch b/meta-python/reci=
pes-extended/python-blivet/python3-blivet/0007-fix-incorrect-timeout-while-=
system-time-changed.patch
> new file mode 100644
> index 0000000..6512d86
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0007-fix-=
incorrect-timeout-while-system-time-changed.patch
> @@ -0,0 +1,48 @@
> +From 78ee2b9090f9400ccc4f730e674f5ae972740ccb Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Fri, 26 Aug 2016 02:02:49 -0400
> +Subject: [PATCH 07/13] fix incorrect timeout while system time changed
> +
> +While system time changed by NTP, invoking timeout_command
> +breaks with incorrect timeout.
> +--------
> +|05:40:55,872 INFO program: Running... mount -t ext2 -o
> +  defaults,ro /dev/sda2 /mnt/sysimage
> +|01:40:55,086 DEBUG program: 10 seconds timeout
> +--------
> +
> +Use numbert count to replace current time count could workaround
> +the issue.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + blivet/util.py | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/blivet/util.py b/blivet/util.py
> +index 44a2da5..b3c45ac 100644
> +--- a/blivet/util.py
> ++++ b/blivet/util.py
> +@@ -163,14 +163,14 @@ def timeout_command(argv, timeout, *args, **kwargs=
):
> +     """call shell-command and either return its output or kill it
> +     if it doesn't normally exit within timeout seconds and return None"=
""
> +     import subprocess, datetime, os, time, signal
> +-    start =3D datetime.datetime.now()
> ++    count =3D 0
> +=20
> +     try:
> +         proc =3D subprocess.Popen(argv, *args, **kwargs)
> +         while proc.poll() is None:
> +             time.sleep(0.1)
> +-            now =3D datetime.datetime.now()
> +-            if timeout !=3D -1 and (now - start).seconds> timeout:
> ++            count +=3D 1
> ++            if timeout !=3D -1 and count > timeout*10:
> +                 os.kill(proc.pid, signal.SIGKILL)
> +                 os.waitpid(-1, os.WNOHANG)
> +                 program_log.debug("%d seconds timeout" % timeout)
> +--=20
> +2.7.4
> +
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/00=
08-tweak-btrfs-packages.patch b/meta-python/recipes-extended/python-blivet/=
python3-blivet/0008-tweak-btrfs-packages.patch
> new file mode 100644
> index 0000000..121336e
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0008-twea=
k-btrfs-packages.patch
> @@ -0,0 +1,45 @@
> +From 6f661a511eea096c073888c7adb836a9a880b476 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 8 May 2017 16:33:15 +0800
> +Subject: [PATCH 08/13] tweak btrfs packages
> +
> +In oe-cre/yocto, we name btrfs package with btrfs-tools,
> +rather than btrfs-progs.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + blivet/devices/btrfs.py | 2 +-
> + blivet/formats/fs.py    | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/blivet/devices/btrfs.py b/blivet/devices/btrfs.py
> +index c5cb21f..9d417b2 100644
> +--- a/blivet/devices/btrfs.py
> ++++ b/blivet/devices/btrfs.py
> +@@ -55,7 +55,7 @@ class BTRFSDevice(StorageDevice):
> +=20
> +     """ Base class for BTRFS volume and sub-volume devices. """
> +     _type =3D "btrfs"
> +-    _packages =3D ["btrfs-progs"]
> ++    _packages =3D ["btrfs-tools"]
> +     _external_dependencies =3D [availability.BLOCKDEV_BTRFS_PLUGIN]
> +=20
> +     def __init__(self, *args, **kwargs):
> +diff --git a/blivet/formats/fs.py b/blivet/formats/fs.py
> +index a49826f..e8f216d 100644
> +--- a/blivet/formats/fs.py
> ++++ b/blivet/formats/fs.py
> +@@ -918,7 +918,7 @@ class BTRFS(FS):
> +     _formattable =3D True
> +     _linux_native =3D True
> +     _supported =3D True
> +-    _packages =3D ["btrfs-progs"]
> ++    _packages =3D ["btrfs-tools"]
> +     _min_size =3D Size("256 MiB")
> +     _max_size =3D Size("16 EiB")
> +     _mkfs_class =3D fsmkfs.BTRFSMkfs
> +--=20
> +2.7.4
> +
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/00=
09-invoking-mount-with-infinite-timeout.patch b/meta-python/recipes-extende=
d/python-blivet/python3-blivet/0009-invoking-mount-with-infinite-timeout.pa=
tch
> new file mode 100644
> index 0000000..fc084b1
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0009-invo=
king-mount-with-infinite-timeout.patch
> @@ -0,0 +1,31 @@
> +From a6ac2157ee6793302e23ddbc5e3b249fa7da5b7e Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 31 Aug 2016 21:30:32 -0400
> +Subject: [PATCH 09/13] invoking mount with infinite timeout
> +
> +This large timeout is needed when running on machines with
> +lots of disks, or with slow disks.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + blivet/util.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/blivet/util.py b/blivet/util.py
> +index b3c45ac..9f02b18 100644
> +--- a/blivet/util.py
> ++++ b/blivet/util.py
> +@@ -257,7 +257,7 @@ def mount(device, mountpoint, fstype, options=3DNone=
):
> +=20
> +     argv =3D ["mount", "-t", fstype, "-o", options, device, mountpoint]
> +     try:
> +-        rc =3D run_program(argv)
> ++        rc =3D run_program(argv, timeout=3D-1)
> +     except OSError:
> +         raise
> +=20
> +--=20
> +2.7.4
> +
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/00=
10-use-oe-variable-to-replace-hardcoded-dir.patch b/meta-python/recipes-ext=
ended/python-blivet/python3-blivet/0010-use-oe-variable-to-replace-hardcode=
d-dir.patch
> new file mode 100644
> index 0000000..45d8fab
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0010-use-=
oe-variable-to-replace-hardcoded-dir.patch
> @@ -0,0 +1,34 @@
> +From e07133dbcf3c52e1ddd2f12797dcd16145269273 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Mon, 8 May 2017 03:54:12 -0400
> +Subject: [PATCH 10/13] use oe variable to replace hardcoded dir
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + setup.py | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 4d06a33..a994d06 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -61,10 +61,10 @@ class blivet_sdist(sdist):
> +=20
> +=20
> + data_files =3D [
> +-    ('/etc/dbus-1/system.d', ['dbus/blivet.conf']),
> +-    ('/usr/share/dbus-1/system-services', ['dbus/com.redhat.Blivet1.ser=
vice']),
> +-    ('/usr/libexec', ['dbus/blivetd']),
> +-    ('/usr/lib/systemd/system', ['dbus/blivet.service'])
> ++    (os.environ.get('sysconfdir')+'/dbus-1/system.d', ['dbus/blivet.con=
f']),
> ++    (os.environ.get('datadir')+'/dbus-1/system-services', ['dbus/com.re=
dhat.Blivet1.service']),
> ++    (os.environ.get('libexecdir'), ['dbus/blivetd']),
> ++    (os.environ.get('systemd_system_unitdir'), ['dbus/blivet.service'])
> + ]
> +=20
> +=20
> +--=20
> +2.7.4
> +
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/00=
11-invoking-fsck-with-infinite-timeout.patch b/meta-python/recipes-extended=
/python-blivet/python3-blivet/0011-invoking-fsck-with-infinite-timeout.patch
> new file mode 100644
> index 0000000..c61fe01
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0011-invo=
king-fsck-with-infinite-timeout.patch
> @@ -0,0 +1,31 @@
> +From e9ab4376a18cc1bd413c000b036320833eec80d7 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 1 Jun 2017 16:05:27 +0800
> +Subject: [PATCH 11/13] invoking fsck with infinite timeout
> +
> +This large timeout is needed when running on machines with
> +lots of disks, or with slow disks.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + blivet/tasks/fsck.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/blivet/tasks/fsck.py b/blivet/tasks/fsck.py
> +index c4214dc..e13ac6b 100644
> +--- a/blivet/tasks/fsck.py
> ++++ b/blivet/tasks/fsck.py
> +@@ -77,7 +77,7 @@ class FSCK(task.BasicApplication, fstask.FSTask):
> +             raise FSError("\n".join(error_msgs))
> +=20
> +         try:
> +-            rc =3D util.run_program(self._fsck_command)
> ++            rc =3D util.run_program(self._fsck_command, timeout=3D-1)
> +         except OSError as e:
> +             raise FSError("filesystem check failed: %s" % e)
> +=20
> +--=20
> +2.7.4
> +
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/00=
12-invoking-mkfs-with-infinite-timeout.patch b/meta-python/recipes-extended=
/python-blivet/python3-blivet/0012-invoking-mkfs-with-infinite-timeout.patch
> new file mode 100644
> index 0000000..33bdbe8
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0012-invo=
king-mkfs-with-infinite-timeout.patch
> @@ -0,0 +1,31 @@
> +From 9f5a048181cf29d241d96814e736b8235b3d42b1 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Fri, 16 Jun 2017 15:43:00 +0800
> +Subject: [PATCH 12/13] invoking mkfs with infinite timeout
> +
> +This large timeout is needed when running on machines with
> +lots of disks, or with slow disks.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + blivet/tasks/fsmkfs.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/blivet/tasks/fsmkfs.py b/blivet/tasks/fsmkfs.py
> +index ad166aa..7bf5075 100644
> +--- a/blivet/tasks/fsmkfs.py
> ++++ b/blivet/tasks/fsmkfs.py
> +@@ -170,7 +170,7 @@ class FSMkfs(task.BasicApplication, FSMkfsTask):
> +         options =3D options or []
> +         cmd =3D self._mkfs_command(options, label, set_uuid)
> +         try:
> +-            ret =3D util.run_program(cmd)
> ++            ret =3D util.run_program(cmd, timeout=3D-1)
> +         except OSError as e:
> +             raise FSError(e)
> +=20
> +--=20
> +2.7.4
> +
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet/00=
13-Revert-Adapt-to-logging-module-name-change.patch b/meta-python/recipes-e=
xtended/python-blivet/python3-blivet/0013-Revert-Adapt-to-logging-module-na=
me-change.patch
> new file mode 100644
> index 0000000..6bdf4ce
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet/0013-Reve=
rt-Adapt-to-logging-module-name-change.patch
> @@ -0,0 +1,30 @@
> +From bfdaf79a2109ac6aed408f0c94f69766991e60e2 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 27 Jul 2017 14:34:30 +0800
> +Subject: [PATCH 13/13] Revert "Adapt to logging module name change"
> +
> +Upstream-Status: Inappropriate [oe specific, sync with anaconda f26-rele=
ase]
> +
> +This reverts commit c367d62a516e541ad28636c8259321f1c53417ce.
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + blivet/__init__.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/blivet/__init__.py b/blivet/__init__.py
> +index 49277cb..a01e487 100644
> +--- a/blivet/__init__.py
> ++++ b/blivet/__init__.py
> +@@ -124,7 +124,7 @@ def enable_installer_mode():
> +         from pyanaconda.constants import ROOT_PATH  # pylint: disable=
=3Dredefined-outer-name,no-name-in-module
> +         _storage_root =3D _sysroot =3D ROOT_PATH
> +=20
> +-    from pyanaconda.anaconda_logging import program_log_lock
> ++    from pyanaconda.anaconda_log import program_log_lock
> +     util.program_log_lock =3D program_log_lock
> +=20
> +     flags.installer_mode =3D True
> +--=20
> +2.7.4
> +
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_2.=
2.0.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
> new file mode 100644
> index 0000000..8b9448c
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet_2.2.0.bb
> @@ -0,0 +1,46 @@
> +DESCRIPTION =3D "A python module for system storage configuration"
> +HOMEPAGE =3D "http://fedoraproject.org/wiki/blivet"
> +LICENSE =3D "LGPLv2+"
> +SECTION =3D "devel/python"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> +
> +S =3D "${WORKDIR}/git"
> +B =3D "${S}"
> +
> +SRCREV =3D "39db82f20d8d4904c0c4dc8912e595177c59e091"
> +SRC_URI =3D "git://github.com/rhinstaller/blivet;branch=3D2.2-devel \
> +           file://0001-comment-out-selinux.patch \
> +           file://0002-run_program-support-timeout.patch\
> +           file://0003-support-infinit-timeout.patch \
> +           file://0004-Mount-var-volatile-during-install.patch \
> +           file://0005-update-fstab-by-appending.patch \
> +           file://0006-fix-new.roots-object-is-not-iterable.patch \
> +           file://0007-fix-incorrect-timeout-while-system-time-changed.p=
atch \
> +           file://0008-tweak-btrfs-packages.patch \
> +           file://0009-invoking-mount-with-infinite-timeout.patch \
> +           file://0010-use-oe-variable-to-replace-hardcoded-dir.patch \
> +           file://0011-invoking-fsck-with-infinite-timeout.patch \
> +           file://0012-invoking-mkfs-with-infinite-timeout.patch \
> +           file://0013-Revert-Adapt-to-logging-module-name-change.patch \
> +"
> +
> +inherit distro_features_check
> +REQUIRED_DISTRO_FEATURES =3D "systemd"
> +
> +inherit setuptools3 python3native
> +
> +RDEPENDS_${PN} =3D "pykickstart python3-pyudev \

Should it rdepend on pykickstart or python3-pykickstart?

There is
PROVIDES =3D "pykickstart"
RPROVIDES_${PN} =3D "pykickstart"

in python3-pykickstart recipe so this works, but I don't understand why
not rdepend on python3-pykickstart directly like for most other python
packages.

> +                  parted python3-pyparted multipath-tools \
> +                  lsof cryptsetup libblockdev \
> +                  libbytesize \
> +"
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/dbus-1/system-services \
> +"
> +
> +inherit systemd
> +
> +SYSTEMD_AUTO_ENABLE =3D "disable"
> +SYSTEMD_SERVICE_${PN} =3D "blivet.service"
> --=20
> 2.8.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWY7FjgAKCRA3VSO3ZXaA
HLB2AKCa+SYp7U2nw+dQ3qMKM0sY5T4T2wCeJt3rovpMx/qKNDIK76oVAsf/4ls=
=/0Rh
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
