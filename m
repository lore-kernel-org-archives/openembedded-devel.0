Received: from [70.96.188.114] (helo=outbound-mail-14.bluehost.com)
	by linuxtogo.org with smtp (Exim 4.63)
	(envelope-from <matt@kiatoa.com>) id 1GbiQm-0004sp-9d
	for openembedded-devel@openembedded.org; Sun, 22 Oct 2006 20:52:20 +0200
Received: (qmail 16660 invoked by uid 0); 22 Oct 2006 18:44:53 -0000
Received: from unknown (HELO box25.bluehost.com) (70.96.188.25)
	by mailproxy1.bluehost.com with SMTP; 22 Oct 2006 18:44:53 -0000
Received: from 71-37-217-5.phnx.qwest.net ([71.37.217.5] helo=tang)
	by box25.bluehost.com with esmtpsa (SSLv3:EXP1024-RC4-SHA:128)
	(Exim 4.52) id 1GbiJF-0003PF-MQ
	for openembedded-devel@openembedded.org; Sun, 22 Oct 2006 12:44:36 -0600
From: Matthew Welland <matt@kiatoa.com>
Organization: kiatoa.com
To: openembedded-devel@openembedded.org
Date: Sun, 22 Oct 2006 11:45:06 -0700
User-Agent: KMail/1.9.1
MIME-Version: 1.0
Message-Id: <200610221145.07238.matt@kiatoa.com>
X-Identified-User: {32296:box25.bluehost.com:kiatoaco:kiatoa.com} {sentby:smtp
	auth 71.37.217.5 authed with matt+kiatoa.com}
Subject: bitbake gpe-image fails
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
X-List-Received-Date: Sun, 22 Oct 2006 18:52:20 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm a little unsure whether this is apropriate for this list. If it
isn't please point me in the right direction.

I'm trying to build gpe-image. Currently it fails with the following
errors. Any pointers on how to proceed appreciated.

| Successfully terminated.
| Collected errors:
| ERROR: Cannot satisfy the following dependencies for gpe-task-base:
|        libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4)
| ERROR: Cannot satisfy the following dependencies for gpe-task-pim:
|        libgcc1 (>= 3.4.4)
| ERROR: Cannot satisfy the following dependencies for gpe-task-settings:
|        libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4)
| ERROR: Cannot satisfy the following dependencies for gpe-task-apps:
|        libgcc1 (>= 3.4.4)
| ERROR: Cannot satisfy the following dependencies for xserver-kdrive-fbdev:
|        libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 (>= 3.4.4) libgcc1 
(>= 3.4.4)
| ERROR: Cannot satisfy the following dependencies for 
gpe-task-connectivity:
|        libgcc1 (>= 3.4.4)
| 
NOTE: Task 
failed: /home/matt/oe/tmp/work/h2200-linux/gpe-image-1.0-r20/temp/log.do_rootfs.16082
NOTE: package gpe-image-1.0-r20: task do_rootfs: failed
ERROR: TaskFailed event exception, aborting
NOTE: package gpe-image-1.0: failed
ERROR: Build of gpe-image failed
matt@tang:~/oe$ bitbake libgcc1
NOTE: Using cache in '/home/matt/oe/tmp/cache'
NOTE: Parsing finished. 3877 cached, 0 parsed, 134 skipped, 0 masked.
ERROR: conflicting preferences for virtual/libsdl: both libsdl-x11 and 
libsdl-qpe specified
NOTE: build 200610221125: started

OE Build Configuration:
BB_VERSION     = "1.4.4"
OE_REVISION    = "a5d88999da9e4228eb53cd801f79b3036a490f74"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "h2200"
DISTRO         = "familiar"
DISTRO_VERSION = "unstable-20061022"
TARGET_FPU     = ""

ERROR: Nothing provides dependency libgcc1
matt@tang:~/oe$ 




