Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1OHA0W-0006yM-P9
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 08:22:25 +0200
Received: by mail-ew0-f221.google.com with SMTP id 21so599647ewy.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 23:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Hp6GhNpuvxhmiDCKDBz9kDTvO677cgr2vkrfEObf3HY=;
	b=P/+gSqrRkuwv3qr+iOIcO1R9NncI/kIVTn+TOT9fcRKQThV63saVSBhdx3a3Mq/cxQ
	BgpMBAepY7Pxpxv4KdvZxMBoviz7E32M5jrhDTj+C4jlMnwuD1NnLFd/EMJ8ovlPNVHX
	8NAQS36oJ7XlNE99zoZ50dxuyiydq2Hm6dUG0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=n6vs0MZs3mxxv7FIc31L1QSx/ULvZqZ3HZ12M2WlZvT2kOWwbiNQhn/C4fkfuL0xDd
	pW2EcT/TQ6j114OZriRbDZTnOqobW5AECw82jCUcx3O0UgrBoSFuo6am4KMfeCRnxJiy
	SyFgQne6uwdGDIn8tyqQcWO+9hpAyvPRnuXfc=
Received: by 10.213.31.203 with SMTP id z11mr1048599ebc.88.1274854699062;
	Tue, 25 May 2010 23:18:19 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 14sm2871424ewy.6.2010.05.25.23.18.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 May 2010 23:18:18 -0700 (PDT)
From: Koen Kooi <koen.kooi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 May 2010 08:17:54 +0200
Message-Id: <1274854676-5931-5-git-send-email-koen@openembedded.org>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <1274854676-5931-1-git-send-email-koen@openembedded.org>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
X-SA-Exim-Connect-IP: 209.85.219.221
X-SA-Exim-Mail-From: koen.kooi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k-kooi@ti.com>, Chase Maupin <chase.maupin@ti.com>
Subject: [PATCH 5/7] Usermanual/metadata: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 06:22:26 -0000

From: Chase Maupin <chase.maupin@ti.com>

* Fixed up typos and other errors in the documentation.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Koen Kooi <k-kooi@ti.com>
---
 docs/usermanual/chapters/metadata.xml |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/usermanual/chapters/metadata.xml b/docs/usermanual/chapters/metadata.xml
index bbf6f73..2b65454 100644
--- a/docs/usermanual/chapters/metadata.xml
+++ b/docs/usermanual/chapters/metadata.xml
@@ -95,7 +95,7 @@
 
     <para>OpenEmbedded has files ending with <emphasis>.conf</emphasis>,
     <emphasis>.inc</emphasis>, <emphasis>.bb</emphasis>
-    and<emphasis>.bbclass</emphasis>. The syntax and semantics of these files
+    and <emphasis>.bbclass</emphasis>. The syntax and semantic of these files
     are best described in the <ulink
     url="http://bitbake.berlios.de/manual"><application>BitBake</application>
     manual</ulink>.</para>
@@ -111,7 +111,7 @@
   <section id="metadata_writing_data">
     <title>Writing Meta Data (Adding packages)</title>
 
-    <para>This page will guide you trough the effort of writing a .bb file or
+    <para>This page will guide you through the effort of writing a .bb file or
     <emphasis>recipe</emphasis> in BitBake speak.</para>
 
     <para>Let's start with the easy stuff, like the package description,
@@ -128,23 +128,23 @@ DEPENDS = "gtk+"
 RDEPENDS = "cool-ttf-fonts"
                 </screen> The package needs gtk+ to build ('DEPENDS') and
     requires the 'cool-ttf-fonts' package to run ('RDEPENDS'). OE will add
-    run-time dependencies on libraries on its own via the so called
-    <emphasis>shlibs</emphasis>-code, but you need to specify everything other
+        run-time dependencies on libraries on its own via the so called
+    <emphasis>shlibs</emphasis>-code, but you need to specify everything else
     by yourself, which in this case is the 'cool-ttf-fonts' package.</para>
 
     <para>After entering all this OE will know what to build before trying to
     build your application, but it doesn't know where to get it yet. So let's
     add the source location: <screen>
 SRC_URI = "http://www.host.com/foo/files/${P}.tar.bz2;md5sum=yoursum"
-                </screen> This will tell the fetcher to where to download the
+                </screen> This will tell the fetcher where to download the
     sources from and it will check the integrity using md5sum if you provided
     the appropriate <emphasis>yoursum</emphasis>. You can make one by doing
     <screen>md5sum foo-1.9.tar.bz2</screen> and replacing
     <emphasis>yoursum</emphasis> with the md5sum on your screen. A typical
-    md5sum will look like this: <screen>a6434b0fc8a54c3dec3d6875bf3be8mtn </screen>Notice
-    the <emphasis>${P}</emphasis> variable, that one holds the package name,
-    <emphasis>${PN}</emphasis> in BitBake speak and the package version,
-    <emphasis>${PV}</emphasis> in BitBake speak. It's a short way of writing
+    md5sum will look like this: <screen>a6434b0fc8a54c3dec3d6875bf3be868 </screen>Notice
+    the <emphasis>${P}</emphasis> variable holds the package name 
+    (<emphasis>${PN}</emphasis> in BitBake speak) and the package version 
+    (<emphasis>${PV}</emphasis> in BitBake speak). It's a short way of writing
     <emphasis>${PN}-${PV}</emphasis>. Using this notation means you can copy
     the recipe when a new version is released without having to alter the
     contents. You do need to check if everything is still correct, because new
-- 
1.7.0



