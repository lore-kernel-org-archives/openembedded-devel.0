Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1RLikv-0000OH-D7
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Nov 2011 22:53:57 +0100
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LU100JOMZ79SKGX@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	02 Nov 2011 16:47:38 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5214114AF5D; Wed,
	02 Nov 2011 17:47:33 -0400 (EDT)
Date: Wed, 02 Nov 2011 17:47:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111102214733.GY15391@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: [2011.03-maintenance] Pull request 20111006
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
X-List-Received-Date: Wed, 02 Nov 2011 21:53:57 -0000
Content-type: text/plain; charset=koi8-r
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

Tom,

Please pull this 1 commit, that updates sourceipk.bbclass to derefere=
nce
symlinks properly. Cherry-picked from oe.dev.

Pull URL: git://arago-project.org/git/people/denix/openembedded.git
  Branch: 2011.03-maintenance
  Browse: http://arago-project.org/git/people/?p=3Ddenix/openembedded=
.git;a=3Dshortlog;h=3Drefs/heads/2011.03-maintenance

Thanks,
    Denys Dmytriyenko <denys@ti.com>
---

The following changes since commit 656bed267ae71e63ff443bfd2dd7ca0d2f=
eff11d:
  Mats K=C3=A4rrman (1):
        binutils_2.18: update SRC_URI to avoid manual delete

Chase Maupin (1):
  sourceipk: dereference symlinks in sourceipk

 classes/sourceipk.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)




