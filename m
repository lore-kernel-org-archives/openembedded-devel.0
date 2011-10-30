Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RKSEa-0007X3-0J
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Oct 2011 11:03:20 +0100
Received: (qmail invoked by alias); 30 Oct 2011 09:57:16 -0000
Received: from p4FDF1C25.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.28.37]
	by mail.gmx.net (mp015) with SMTP; 30 Oct 2011 10:57:16 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18WGmlTi3oWykY67zhqkD9gX8gj1i19SKOnJMIG3C
	uqxjcPqZmtXKXe
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Oct 2011 11:01:56 +0100
Message-Id: <1319968917-3120-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe] task-basic: include wireless-tools for distros featuring wifi
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
X-List-Received-Date: Sun, 30 Oct 2011 10:03:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On image based on angstrom xfce-nm-image wireless-tools were missing (although
networkmanager has them in DEPENDS). 
Was it intended not to have them on distos supporting wifi?

Andreas Müller (1):
  task-basic: include wireless-tools for distros featuring wifi

 meta-oe/recipes-core/tasks/task-basic.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.4.4



