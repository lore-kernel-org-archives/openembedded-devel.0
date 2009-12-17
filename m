Received: from smtp-out112.alice.it ([85.37.17.112])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1NLPUn-000169-7X
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Dec 2009 00:11:00 +0100
Received: from fbcmmo06.fbc.local ([192.168.184.137]) by smtp-out112.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 18 Dec 2009 00:09:09 +0100
Received: from FBCMCL01B01.fbc.local ([192.168.69.82]) by fbcmmo06.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 18 Dec 2009 00:08:43 +0100
Received: from localhost.localdomain ([79.41.7.172]) by FBCMCL01B01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 18 Dec 2009 00:08:43 +0100
From: Denis 'Gnutoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Dec 2009 00:08:41 +0100
Message-Id: <1261091322-11271-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.6.4.4
X-OriginalArrivalTime: 17 Dec 2009 23:08:43.0608 (UTC)
	FILETIME=[E0F95580:01CA7F6D]
X-SA-Exim-Connect-IP: 85.37.17.112
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] udev: add bug device's device nodes
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
X-List-Received-Date: Thu, 17 Dec 2009 23:11:00 -0000

hi,
I'd like to add some devices nodes for the bug device,
some of theses nodes are needed for touchscreen support
in xorg.conf
By the way theses files comes from :
meta-bug/packages/udev-rules/bug-udev/
in:
svn://svn.buglabs.net/bug/branches/hrw/oe-stable-2009/

In #oe I was told to post for review(I bet udev is a core thing)
Denis.


