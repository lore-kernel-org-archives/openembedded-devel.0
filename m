Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Qudtq-0004dO-Ge
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Aug 2011 07:15:14 +0200
Received: by gxk3 with SMTP id 3so2538389gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 22:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=MNp8xCa+r/nTtniaBrcd6DeBuwicqPHWmwSDYSVdVbA=;
	b=Nvnmrb4m9TpXtKqWvYCBUXOyIWENnpoG8OOoggScsprh4PX5Y1TTYSiQ5JiIN1a6C6
	qtCdbm7itv1LbkJZzbTOiF8TfILmOUtdNb2+Xt6iHFT6T8UMkurpOtEEq4K6DMtJKDpR
	P3Kp5b5DR/t/blKTl6szpjs16oLr5gVQ476x4=
Received: by 10.150.194.14 with SMTP id r14mr181455ybf.43.1313817032812;
	Fri, 19 Aug 2011 22:10:32 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id k17sm772692yba.29.2011.08.19.22.10.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 22:10:32 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Aug 2011 05:10:18 +0000
Message-Id: <cover.1313816970.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/3] Pending patches from O.S. Systems tree
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
X-List-Received-Date: Sat, 20 Aug 2011 05:15:14 -0000

The following changes since commit 3d0b866967529a14268541b85e79cb35981e1aed:

  xdotool: import from OE rev 5350bbef01b8979617e3d0fd38939f94f1fa5315 (2011-08-17 23:11:55 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (3):
  freerdp: bump SRCREV to gather major RemoteFX improvements
  kernel.bbclass: fix spacing to reduce delta between oe-core and
    meta-oe
  kernel.bbclass: save kernel image name into $kerneldir

 meta-oe/classes/kernel.bbclass                 |   15 ++++++++++-----
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    2 +-
 2 files changed, 11 insertions(+), 6 deletions(-)

-- 
1.7.2.5



