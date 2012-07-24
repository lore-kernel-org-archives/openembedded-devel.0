Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1StYEi-0000RY-2n
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Jul 2012 08:04:48 +0200
Received: from gandalf.denix.org ([unknown] [96.240.136.247])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M7N00BNMEVQ9SK6@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	23 Jul 2012 23:52:53 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D7429200E5; Tue,
	24 Jul 2012 00:52:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 Jul 2012 00:52:28 -0400
Message-id: <cover.1343104879.git.denys@ti.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [2011.03-maintenance][PATCH 0/1] Pull request 20110723
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
X-List-Received-Date: Tue, 24 Jul 2012 06:04:48 -0000

Tom,

Please pull this commit that fixes opkg-utils when generating pkg index

Pull URL: git://arago-project.org/git/people/denix/openembedded.git
  Branch: 2011.03-maintenance
  Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance

Thanks,
    Denys Dmytriyenko <denys@ti.com>
---

The following changes since commit f9611c025109a3e0d6cebf12f49ae24c97759c09:

  psplash: convert from svn.o-hand.com to git.yoctoproject.org (2012-07-04 22:34:04 +0200)

are available in the git repository at:
  git://arago-project.org/git/people/denix/openembedded 2011.03-maintenance

Denys Dmytriyenko (1):
  opkg-utils: bump SRCREV to pick up subprocess.check_output fixes

 recipes/opkg-utils/opkg-utils_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.8.6



