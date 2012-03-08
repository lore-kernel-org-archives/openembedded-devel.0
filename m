Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1S5fB9-0002cl-NA
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Mar 2012 16:22:55 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id 18556F811E3; Thu,  8 Mar 2012 08:14:19 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Mar 2012 08:14:18 -0700
Message-Id: <1331219658-28720-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [meta-oe] README: fix typo
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
X-List-Received-Date: Thu, 08 Mar 2012 15:22:55 -0000

Without this change, 'git send-email' complains of a missing argument.
Tested with git 1.7.7.6 on Fedora 16.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta-oe/README |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/README b/meta-oe/README
index a195919..ed14866 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -6,7 +6,7 @@ revision: HEAD
 
 Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-oe]' in the subject'
 
-When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix meta-oe'
+When sending single patches, please use something like 'git send-email -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=meta-oe'
 
 You are encouraged to fork the mirror on github https://github.com/openembedded/meta-oe/ to share your patches, this is preferred for patch sets consisting of more than one patch. Other services like gitorious, repo.or.cz or self hosted setups are of course accepted as well, 'git fetch <remote>' works the same on all of them. We recommend github because it is free, easy to use, has been proven to be reliable and has a really good web GUI.
 
-- 
1.7.7.6



