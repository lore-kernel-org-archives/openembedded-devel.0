Received: from [64.233.166.182] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <axel.lin@gmail.com>) id 1GdMIJ-0000Pz-9N
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Oct 2006 09:38:23 +0200
Received: by py-out-1112.google.com with SMTP id i75so467972pye
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Oct 2006 00:38:05 -0700 (PDT)
Received: by 10.35.52.18 with SMTP id e18mr135003pyk;
	Fri, 27 Oct 2006 00:38:05 -0700 (PDT)
Received: by 10.35.15.3 with HTTP; Fri, 27 Oct 2006 00:38:05 -0700 (PDT)
Message-ID: <427d64720610270038y6dca8347j657397752817c163@mail.gmail.com>
Date: Fri, 27 Oct 2006 15:38:05 +0800
From: "axel lin" <axel.lin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: package minimo-0.016+cvs20060720-r0: task do_compile: failed
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
X-List-Received-Date: Fri, 27 Oct 2006 07:38:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

bug submitted: package minimo-0.016+cvs20060720-r0: task do_compile: failed
http://bugs.openembedded.org/show_bug.cgi?id=1532

| make[7]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/mozilla/xpcom/typelib/xpt/tools'
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/mozilla/xpcom/typelib/xpt/tools'
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/mozilla/xpcom/typelib/xpt'
| make[5]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/mozilla/xpcom/typelib/xpidl'
| make[6]: Entering directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/mozilla/xpcom/typelib/xpidl'
| ccache gcc -o host_xpidl
-isystem/opt/oe/build/tmp/staging/arm-angstrom-linux-gnueabi/include
-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os
-DXP_UNIX -O3  -I/opt/oe/build/tmp/staging/arm-angstrom-linux-gnueabi/include/libIDL-2.0
-I/opt/oe/build/tmp/staging/arm-angstrom-linux-gnueabi/include/glib-2.0
-I/opt/oe/build/tmp/staging/arm-angstrom-linux-gnueabi/lib/glib-2.0/include
  -DMDCPUCFG=\"md/_linux.cfg\"  host_xpidl.o host_xpidl_idl.o
host_xpidl_util.o host_xpidl_header.o host_xpidl_typelib.o
host_xpidl_doc.o host_xpidl_java.o ../../../dist/host/lib/libhostxpt.a
-L/opt/oe/build/tmp/staging/arm-angstrom-linux-gnueabi/lib   -lIDL-2
-lglib-2.0
| /usr/bin/ld: skipping incompatible
/opt/oe/build/tmp/staging/arm-angstrom-linux-gnueabi/lib/libIDL-2.so
when searching for -lIDL-2
| /usr/bin/ld: skipping incompatible
/opt/oe/build/tmp/staging/arm-angstrom-linux-gnueabi/lib/libIDL-2.a
when searching for -lIDL-2
| /usr/bin/ld: cannot find -lIDL-2
| collect2: ld returned 1 exit status
| make[6]: *** [host_xpidl] Error 1
| make[6]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/mozilla/xpcom/typelib/xpidl'
| make[5]: *** [export] Error 2
| make[5]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/mozilla/xpcom/typelib/xpidl'
| make[4]: *** [export] Error 2
| make[4]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/mozilla/xpcom/typelib'
| make[3]: *** [export] Error 2
| make[3]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/mozilla/xpcom'
| make[2]: *** [tier_2] Error 2
| make[2]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/mozilla'
| make[1]: *** [default] Error 2
| make[1]: Leaving directory
`/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/mozilla'
| make: *** [build] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/opt/oe/build/tmp/work/armv5te-angstrom-linux-gnueabi/minimo-0.016+cvs20060720-r0/temp/log.do_compile.2610
NOTE: package minimo-0.016+cvs20060720-r0: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package minimo-0.016+cvs20060720: failed
ERROR: Build of minimo failed


