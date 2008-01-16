Received: from [220.181.13.26] (helo=m13-26.163.com)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <2008zhjw@163.com>) id 1JF6hT-0002Uh-CS
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jan 2008 12:44:56 +0100
Received: from 202.119.43.65 ( 202.119.43.65 [202.119.43.65] ) by
	ajax-webmail-wmsvr26 (Coremail) ; Wed, 16 Jan 2008 19:44:41 +0800 (CST)
Date: Wed, 16 Jan 2008 19:44:41 +0800 (CST)
From: =?GBK?B?1dS+rc6z?= <2008zhjw@163.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <5480059.1062251200483881474.JavaMail.coremail@bj163app26.163.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.208.57 (202.119.43.65)]
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XTx build 071218(4376.1446.1439)
	Copyright (c) 2002-2008 www.mailtech.cn 163com
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: ERROR: '/stuff/org.openembedded.dev/packages/gnome/gconf-dbus_svn.bb' faile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2008 11:44:57 -0000
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: quoted-printable

Hi all,

I am a newbie to OE and started trying to build "GPE" using Openembedded o=
n my Linux x86 host development machine.


zhjw@debian:/stuff$ bitbake gpe-image
NOTE: Handling BitBake files: | (4998/4998) [100 %]
NOTE: Parsing finished. 4766 cached, 0 parsed, 232 skipped, 0 masked.
NOTE: build 200801161928: started
OE Build Configuration:
BB_VERSION     =3D "1.8.9"
OE_REVISION    =3D "6d44b490ec30acc0370a045d7b1eb3eae2b73ab9"
TARGET_ARCH    =3D "arm"
TARGET_OS      =3D "linux-gnueabi"
MACHINE        =3D "qemuarm"
DISTRO         =3D "generic"
TARGET_FPU     =3D "soft"
=20
=20
=20
NOTE: Running task 657 of 3227 (ID: 2711, /stuff/org.openembedded.dev/pack=
ages/g nome/gconf-dbus_svn.bb, do_fetch)
NOTE: package gconf-dbus-2.16.0+svnr1: started
NOTE: package gconf-dbus-2.16.0+svnr1-r5: task do_fetch: started
NOTE: Fetch svn://developer.imendio.com/svn/gconf-dbus;module=3Dtrunk;prot=
o=3Dhttp
svn: ????&#65533;&#65533;http://developer.imendio.com/svn/gconf-dbus/trunk=
&#65533;&#65533;???????? ?? 1
NOTE: Task failed: Fetch failed: Fetch command export PATH=3D/stuff/tmp/st=
aging/i6 86-linux/bin/arm-linux:/stuff/tmp/staging/i686-linux/bin:/stuff/tm=
p/staging/i686 -linux/bin:/stuff/tmp/cross/bin:/stuff/tmp/staging/i686-linu=
x/bin:/stuff/bitbake /bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/ga=
mes; /usr/bin/env svn co - r 1 http://developer.imendio.com/svn/gconf-dbus/=
trunk trunk failed with signal 1 , output:
NOTE: package gconf-dbus-2.16.0+svnr1-r5: task do_fetch: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gconf-dbus-2.16.0+svnr1: failed
ERROR: Build of /stuff/org.openembedded.dev/packages/gnome/gconf-dbus_svn.=
bb do_ fetch failed
ERROR: Task 2711 (/stuff/org.openembedded.dev/packages/gnome/gconf-dbus_sv=
n.bb, do_fetch) failed
NOTE: Tasks Summary: Attempted 656 tasks of which 619 didn't need to be re=
run an d 1 failed.
ERROR: '/stuff/org.openembedded.dev/packages/gnome/gconf-dbus_svn.bb' fail=
e
=20
looking forward to your reply!
From 2008zhjw@163.com Wed Jan 16 12:48:52 2008
Received: from [220.181.13.26] (helo
