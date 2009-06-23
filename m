Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1MJ1yc-0006Bz-Pi
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 11:07:38 +0200
Received: (qmail 32428 invoked by uid 813007); 23 Jun 2009 08:56:36 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO localhost.localdomain)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 23 Jun 2009 08:56:35 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jun 2009 10:55:49 +0200
Message-Id: <1245747353-27218-1-git-send-email-marcin@juszkiewicz.com.pl>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <200906230939.34062.marcin@juszkiewicz.com.pl>
References: <200906230939.34062.marcin@juszkiewicz.com.pl>
Cc: Cliff Brake <cbrake@bec-systems.com>
Subject: [STABLE][PATCH 047/125] doc: change openembedded.net reference to openembedded.org
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
X-List-Received-Date: Tue, 23 Jun 2009 09:07:39 -0000

From: Cliff Brake <cbrake@bec-systems.com>


Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
---
 docs/usermanual/chapters/getting_oe.xml |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
index ed7fd11..a04e233 100644
--- a/docs/usermanual/chapters/getting_oe.xml
+++ b/docs/usermanual/chapters/getting_oe.xml
@@ -105,7 +105,7 @@ $ <command>svn</command> co svn://svn.berlios.de/bitbake/branches/bitbake-1.8/ b
       <para>Once you have installed Git, checkout the OpenEmbedded repository:
         <screen>
 $ cd $OEBASE
-$ git clone git://git.openembedded.net/openembedded</screen>
+$ git clone git://git.openembedded.org/openembedded</screen>
         The <literal>$OEBASE/openembedded/</literal> directory should now
         exist.</para>
     </section>
-- 
1.6.3.1





