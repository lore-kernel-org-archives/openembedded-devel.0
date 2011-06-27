Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbHhL-0001BU-R2
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 21:42:19 +0200
Received: by gxk3 with SMTP id 3so1595989gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2011 12:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer; bh=2ynxWTRsqw1mR/BEXSmPEktImK/nvNLJFwBoJv0jiY8=;
	b=QmZ6XA+FpuTtkPU+sW7gseeZy2poeuf30qmbkJ7JgksnownXzfL+y4gaE7h/PObXQZ
	7SM+5DK/iNW6UeeZpKiRGFG5L+Ir3957b2lhPuuXVESqm2AHcETOYDZlmy0PL1FqswW0
	vsCKbgtfVgS5FrKrKzgNzfPDRk2+ZiRftkRsA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=g9BPjL2R3XjO37z89sMr0mt4cPfqjSSKcAdnwoBNAe97Ls9S3NWv3r7scJ/RobpsGw
	WvqhGt2JGY7kSO+t/WXvKfhoxGr+w0XwaH3pJP9KCfo/TQXG48vSlCl183BZ3mDeLcEF
	YSC9SjGG7RrRf7F+X1nqsoYbPSvx3OJVKHJmQ=
Received: by 10.236.138.197 with SMTP id a45mr10311531yhj.510.1309203518642;
	Mon, 27 Jun 2011 12:38:38 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e24sm3675890yhk.51.2011.06.27.12.38.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 12:38:36 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jun 2011 19:38:21 +0000
Message-Id: <cover.1309203431.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [[meta-oe][PATCH 0/4] O.S. Systems changes pending for merging
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
X-List-Received-Date: Mon, 27 Jun 2011 19:42:20 -0000

The following changes since commit 9e3f9dddd2d498a603c0e9eb8bf77d3476a21940:

  systemd: bump SRCREV to get the new daemons (2011-06-27 20:15:37 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (4):
  xf86-video-geode: add 2.11.12 version
  freerdp: bump SRCREV to gather fixes
  freerdp-extension-xpunlimited: bump SRCREV to fix a build failure
  inih: bump SRCREV to sync with upstream r12

 .../xorg-driver/xf86-video-geode_2.11.12.bb        |   11 +++++++++++
 .../freerdp/freerdp-extension-xpunlimited_git.bb   |    2 +-
 meta-oe/recipes-support/freerdp/freerdp_git.bb     |    2 +-
 meta-oe/recipes-support/inih/libinih_git.bb        |    4 ++--
 4 files changed, 15 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.12.bb

-- 
1.7.2.5



