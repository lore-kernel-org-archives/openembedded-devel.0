Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SPdm1-000328-S8
	for openembedded-devel@openembedded.org; Wed, 02 May 2012 19:55:34 +0200
Received: (qmail 20994 invoked by uid 1003); 2 May 2012 17:45:48 -0000
Received: from unknown (HELO localhost.localdomain)
	(philip@balister.org@71.171.22.246)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	2 May 2012 17:45:47 -0000
From: Philip Balister <philip@balister.org>
To: openembedded-devel@openembedded.org
Date: Wed,  2 May 2012 13:45:44 -0400
Message-Id: <1335980745-29862-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe 0/1] Linux Containers recipe.
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
X-List-Received-Date: Wed, 02 May 2012 17:55:34 -0000

Build tested with oe-core for the pandaboard.  I want to get this comitted
in a basic form before it gets moldy on my disk.

More patches welcome.

Philip Balister (1):
  lxc : Add recipe for building Linux Containers tools.

 meta-oe/recipes-extended/lxc/lxc_git.bb |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/lxc/lxc_git.bb

-- 
1.7.3.4



