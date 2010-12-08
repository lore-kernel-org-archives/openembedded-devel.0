Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQJcY-0005JN-0e
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 13:59:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id D9F6A314B02B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 13:58:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id r8hnEpwpZvow
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 13:58:12 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 5A91C314B85D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 13:58:11 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 08 Dec 2010 12:58:11 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 12:58:07 +0000
Message-Id: <1291813088-23444-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291813088-23444-1-git-send-email-obi@opendreambox.org>
References: <1291813088-23444-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/4] usermanual: remove unused variable CVS_TARBALL_STASH
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
X-List-Received-Date: Wed, 08 Dec 2010 12:59:46 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 docs/usermanual/reference/var_src_uri.xml |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/docs/usermanual/reference/var_src_uri.xml b/docs/usermanual/reference/var_src_uri.xml
index c4f30a2..706452f 100644
--- a/docs/usermanual/reference/var_src_uri.xml
+++ b/docs/usermanual/reference/var_src_uri.xml
@@ -351,15 +351,6 @@ SRC_URI[sha256sum] = &quot;36bdb85c97b39ac604bc58cb7857ee08295242c78a12848ef8a31
 
     <para>Related variables:<variablelist>
         <varlistentry>
-          <term>CVS_TARBALL_STASH</term>
-
-          <listitem>
-            <para>Used to specifies a location to search for pre-generated tar
-            archives to use instead of accessing cvs directly.</para>
-          </listitem>
-        </varlistentry>
-
-        <varlistentry>
           <term>CVSDIR</term>
 
           <listitem>
-- 
1.7.2.3



