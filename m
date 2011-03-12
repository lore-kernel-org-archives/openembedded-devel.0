Received: from ns.awellconnected.net ([83.167.180.132]
	helo=edison.awellconnected.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lukas@htc-linux.org>) id 1PyO5H-0004pg-Rf
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 13:38:15 +0100
Received: from ip-80-226-0-1.vodafone-net.de ([80.226.0.1] helo=[10.225.81.7])
	by edison.awellconnected.net with esmtp (Exim 4.69)
	(envelope-from <lukas@htc-linux.org>) id 1PyO3f-0007kv-GD
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Mar 2011 12:36:35 +0000
From: Lukas-David Gorris <lukas@htc-linux.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Mar 2011 13:36:28 +0100
Message-ID: <1299933388.3518.2.camel@computer>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - edison.awellconnected.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - htc-linux.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: autoconf213: do_configure fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Mar 2011 12:38:15 -0000
X-Groupsio-MsgNum: 30123
Content-Type: multipart/mixed; boundary="=-l+crFFOmFIFxFO2h742q"

--=-l+crFFOmFIFxFO2h742q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Build Configuration:
BB_VERSION        = "1.12.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "9dd12ec"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "htcleo"
DISTRO            = "shr"
DISTRO_VERSION    = "-20110312"
TARGET_FPU        = "hard"

Log data follows:
| + do_configure
| + true
| + export ac_cv_path_PERL=/usr/bin/perl
| + ac_cv_path_PERL=/usr/bin/perl
| + export ac_cv_path_M4=/usr/bin/m4
| + ac_cv_path_M4=/usr/bin/m4
| + export ac_cv_prog_gnu_m4=yes
| + ac_cv_prog_gnu_m4=yes
| + sed -i '-es,^SUBDIRS = .*,SUBDIRS = bin .
lib,' /home/luke/linux/openembedded/tmp/work/armv7a-oe-linux-gnueabi/autoconf213-2.13-r13.0/autoconf-2.13/Makefile.am
| sed: can't
read /home/luke/linux/openembedded/tmp/work/armv7a-oe-linux-gnueabi/autoconf213-2.13-r13.0/autoconf-2.13/Makefile.am: No such file or directory


The same situation with autoconf213-native:
"Makefile.am: No such file or directory"

--=-l+crFFOmFIFxFO2h742q
Content-Disposition: attachment; filename="log.do_configure.3514"
Content-Type: text/plain; name="log.do_configure.3514"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

+ do_configure
+ true
+ export ac_cv_path_PERL=/usr/bin/perl
+ ac_cv_path_PERL=/usr/bin/perl
+ export ac_cv_path_M4=/usr/bin/m4
+ ac_cv_path_M4=/usr/bin/m4
+ export ac_cv_prog_gnu_m4=yes
+ ac_cv_prog_gnu_m4=yes
+ sed -i '-es,^SUBDIRS = .*,SUBDIRS = bin . lib,' /home/luke/linux/openembedded/tmp/work/armv7a-oe-linux-gnueabi/autoconf213-2.13-r13.0/autoconf-2.13/Makefile.am
sed: can't read /home/luke/linux/openembedded/tmp/work/armv7a-oe-linux-gnueabi/autoconf213-2.13-r13.0/autoconf-2.13/Makefile.am: No such file or directory

--=-l+crFFOmFIFxFO2h742q--
