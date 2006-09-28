Received: from [203.66.140.6] (helo=mtcmail.mitac-mtc.com.tw)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <Axel.Lin@mitac-mtc.com.tw>) id 1GSrVy-0000VE-Qb
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Sep 2006 10:45:08 +0200
Received: from taipei7.mitac-mtc.com.tw ([10.68.90.7])
	by mtcmail.mitac-mtc.com.tw with ESMTP id k8S8drHn066458
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Sep 2006 16:39:53 +0800 (CST)
	(envelope-from Axel.Lin@mitac-mtc.com.tw)
Received: by taipei7.mitac-mtc.com.tw with Internet Mail Service (5.5.2657.72)
	id <SFFW8K7L>; Thu, 28 Sep 2006 16:40:37 +0800
Message-ID: <451B8A47.6030405@mitac-mtc.com.tw>
From: "Axel.Lin" <Axel.Lin@mitac-mtc.com.tw>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Sep 2006 16:39:35 +0800
MIME-Version: 1.0
X-Mailer: Internet Mail Service (5.5.2657.72)
x-originalarrivaltime: 28 Sep 2006 08:39:53.0133 (UTC)
	FILETIME=[AB001DD0:01C6E2D9]
user-agent: Thunderbird 1.5.0.5 (X11/20060728)
X-MAIL: mtcmail.mitac-mtc.com.tw k8S8drHn066458
X-Content-Filtered-By: Mailman/MimeDel 2.1.8
Subject: package xserver-xorg-X11R7.1-1.1.0-r0: task do_configure: failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Sep 2006 08:45:08 -0000
Content-Type: text/plain;
	charset="BIG5"

hi list,
I'm using mainstone/generic config.
When I try to build gpe-image, I got failed message as below.
xaw7 package is missing.
How to fix this issue?


| checking for XDMCP... yes
| checking for XdmcpWrap in -lXdmcp... no
| checking for XSERVERCFLAGS... yes
| checking for XSERVERLIBS... yes
| checking if SVR4 needs to be defined... no
| checking whether to build Xdmx DDX... checking for DMXMODULES... yes
| yes
| checking linux/input.h usability... yes
| checking linux/input.h presence... yes
| checking for linux/input.h... yes
| checking linux/keyboard.h usability... yes
| checking linux/keyboard.h presence... yes
| checking for linux/keyboard.h... yes
| checking for XDMXCONFIG_DEP... Package xaw7 was not found in the
pkg-config search path.
| Perhaps you should add the directory containing `xaw7.pc'
| to the PKG_CONFIG_PATH environment variable
| No package 'xaw7' found
| configure: error: Package requirements (xaw7 xmu xt xpm x11) were not met:
|
|
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables XDMXCONFIG_DEP_CFLAGS
| and XDMXCONFIG_DEP_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
|
| FATAL: oe_runconf failed
NOTE: Task failed:
/opt/oe/build/tmp/work/iwmmxt-linux/xserver-xorg-X11R7.1-1.1.0-r0/temp/log.d
o_configure.8897
NOTE: package xserver-xorg-X11R7.1-1.1.0-r0: task do_configure: failed
ERROR: TaskFailed event exception, aborting
NOTE: package xserver-xorg-X11R7.1-1.1.0: failed
ERROR: Build of gpe-image failed

Thanks for your help.

Axel


