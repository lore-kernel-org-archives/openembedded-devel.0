Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RWeOR-0004pX-UN
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Dec 2011 02:27:56 +0100
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LVL00HMUT36XQE1@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	02 Dec 2011 19:21:07 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8666914AF5D; Fri,
	02 Dec 2011 20:21:06 -0500 (EST)
Date: Fri, 02 Dec 2011 20:21:06 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111203012106.GR20602@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: [2011.03-maintenance] Pull request 20111202
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
X-List-Received-Date: Sat, 03 Dec 2011 01:27:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Tom,

Please pull these 2 commits that fix fakeroot, cherry-picked from oe.dev

Pull URL: git://arago-project.org/git/people/denix/openembedded.git
  Branch: 2011.03-maintenance
  Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance

Thanks,
    Denys Dmytriyenko <denys@ti.com>
---

The following changes since commit bf617b522784fc83a678c5a5a10a053f84e39f7e:
  Steffen Sledz (1):
        gypsy: update to latest upstream version 0.8, and remove version 0.7

are available in the git repository at:

  git://arago-project.org/git/people/denix/openembedded 2011.03-maintenance

Florian Boor (1):
  fakeroot: Move from not fetchable 1.14.5 to 1.15.1

Tom Rini (1):
  fakeroot.inc: Add RDEPENDS_${PN}-virtclass-native

 .../fix-prefix.patch                               |    0
 .../quiet-getopt-check.patch                       |    0
 recipes/fakeroot/fakeroot.inc                      |    1 +
 .../{fakeroot_1.14.5.bb => fakeroot_1.15.1.bb}     |    4 ++--
 4 files changed, 3 insertions(+), 2 deletions(-)
 rename recipes/fakeroot/{fakeroot-1.14.5 => fakeroot-1.15.1}/fix-prefix.patch (100%)
 rename recipes/fakeroot/{fakeroot-1.14.5 => fakeroot-1.15.1}/quiet-getopt-check.patch (100%)
 rename recipes/fakeroot/{fakeroot_1.14.5.bb => fakeroot_1.15.1.bb} (53%)



