Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3pR4-0000OE-Jq
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Sep 2011 15:23:30 +0200
Received: by ywf7 with SMTP id 7so1312381ywf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2011 06:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=ZmYtOKx74s6L3Y04kinAsTZ8kp+rMvz49QOjGsEAovk=;
	b=XagmwE89fqRHRa335wnnXr2pE33RTQmtZ9xtlsjw/p+8HU5fvR1YRn72C+IgH99J2S
	oZ9OXSQB5Ssh5Ewesm++WyoJuUyxrpFa6E+bSrSfJXCihly1SA8H5OQ9IKgspOjx/pKq
	IIkB0fRI21LLl1RW+xEclgW9DqETzl+TNySzk=
Received: by 10.151.69.15 with SMTP id w15mr3583471ybk.68.1316006299906;
	Wed, 14 Sep 2011 06:18:19 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id t10sm7567487anl.26.2011.09.14.06.18.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Sep 2011 06:18:19 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Sep 2011 13:18:07 +0000
Message-Id: <cover.1316006259.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/1] Fix usage of hardcoded path
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
X-List-Received-Date: Wed, 14 Sep 2011 13:23:30 -0000

The following changes since commit 0a2a6e16334c15f460ea5eba426e3f6f1d3d1936:

  xf86-input-void: add 1.4.0 recipe (2011-09-14 13:08:10 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  xorg-xserver-common.inc: usr ${datadir} instead of /usr/share

 .../xorg-xserver/xorg-xserver-common.inc           |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.2.5



