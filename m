Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QzzM4-0002WY-69
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Sep 2011 01:10:28 +0200
Received: by gyg4 with SMTP id 4so2430025gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Sep 2011 16:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=pCbz2WBNSwRVcG8k/ScVNfcyXUCUgd9qmkQfcLz8qSM=;
	b=LS/zyvwIOYbXEXB7NLB8LOWv8D3Vtfi7LPWElyquFA5EbZyGzNPjG6WEQt4bZUFBj0
	71fEDqmvzskNawpwMI/3kbbGsHAoKK6d35YByI6djmFB6mjB0fJFrDG51xC3W55Wi84u
	yjcbij1P4M58ZWliu2ycGXzYEcfcYgA/Jxb/c=
Received: by 10.150.68.31 with SMTP id q31mr2177420yba.242.1315091129393;
	Sat, 03 Sep 2011 16:05:29 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id f5sm553704ybd.13.2011.09.03.16.05.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Sep 2011 16:05:28 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Sep 2011 23:05:16 +0000
Message-Id: <cover.1315091074.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [meta-oe][PATCH 0/1] Support to SRCREV_FORMAT for gitpkgv
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
X-List-Received-Date: Sat, 03 Sep 2011 23:10:28 -0000

The following changes since commit 22cede3ee0edeb203ebe42bfb805ee8b7d6dddfa:

  thunar-volman: Add udev to DEPENDS (2011-09-02 09:09:52 +0200)

are available in the git repository at:
  git://github.com/OSSystems/meta-oe master
  https://github.com/OSSystems/meta-oe/tree/master

Otavio Salvador (1):
  gitpkgv: add support SRCREV_FORMAT

 meta-oe/classes/gitpkgv.bbclass |   59 +++++++++++++++++++++++----------------
 1 files changed, 35 insertions(+), 24 deletions(-)

-- 
1.7.2.5



