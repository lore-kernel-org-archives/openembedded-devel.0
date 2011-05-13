Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QL1MD-0002Qc-8R
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 May 2011 01:01:17 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LL500BK9P4ZVAJ8@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	13 May 2011 17:58:17 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A3F4814AF5B; Fri,
	13 May 2011 18:58:11 -0400 (EDT)
Date: Fri, 13 May 2011 18:58:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110513225811.GB21433@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: [2011.03-maintenance] Pull request for libsndfile update
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
X-List-Received-Date: Fri, 13 May 2011 23:01:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Tom,

Please pull this 1 commit for libsndfile version update - older versions
are no longer downloadable from upstream.
It's a cherry pick from oe.dev, where it's been for several days now.


Pull URL: git://arago-project.org/git/people/denix/openembedded.git
  Branch: 2011.03-maintenance
  Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance

Thanks,
    Denys Dmytriyenko <denys@ti.com>
---


Denys Dmytriyenko (1):
  libsndfile: add latest version 1.0.24, as older no longer available

 recipes/libsndfile/libsndfile1_1.0.24.bb |   36 ++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libsndfile/libsndfile1_1.0.24.bb


