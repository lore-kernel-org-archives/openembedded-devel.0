Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QtxsC-00066e-BM
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Aug 2011 10:22:45 +0200
Received: by bkbzu17 with SMTP id zu17so1462221bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2011 01:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Oz3bp1y6kmW/sIm7NJRJeJhZz5MJjksD8fdka525R2w=;
	b=mK3Ox2NHPNEWuo4ZXTGHO4yVwqFzqOF3kHEQwZUWW1/NampNCZFPtBEZrJ6ga45Adp
	cgzXhnIa3rKKvutFRLON9iKmTOtgFrnt6w0Ppvu6qTlmIapoUbZ6JRjam7/14an5Snej
	Ym9cvKRTVKtCSUp8dKHW2rFZgwV9uWx1NWtNs=
Received: by 10.204.232.78 with SMTP id jt14mr196977bkb.190.1313655485056;
	Thu, 18 Aug 2011 01:18:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m24sm643150bkm.0.2011.08.18.01.18.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Aug 2011 01:18:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Aug 2011 10:17:59 +0200
Message-Id: <cover.1313655444.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [meta-efl][PATCH 0/2] Pull request #8
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
X-List-Received-Date: Thu, 18 Aug 2011 08:22:46 -0000

The following changes since commit 3d0b866967529a14268541b85e79cb35981e1aed:

  xdotool: import from OE rev 5350bbef01b8979617e3d0fd38939f94f1fa5315 (2011-08-17 23:11:55 +0200)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/meta-efl
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/meta-efl

Martin Jansa (2):
  e-base: bump EFL_SRCREV
  e-wm: remove SHR specific patch

 meta-efl/classes/e-base.bbclass                    |    2 +-
 .../e17/e-wm/wizard-module-skipping.patch          |   63 --------------------
 meta-efl/recipes-efl/e17/e-wm_svn.bb               |    4 -
 3 files changed, 1 insertions(+), 68 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm/wizard-module-skipping.patch

-- 
1.7.6



