Received: from mail-gw0-f65.google.com ([74.125.83.65])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1OHGVw-0006xu-QL
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 15:19:26 +0200
Received: by mail-gw0-f65.google.com with SMTP id 23so25561gwj.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 06:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=1dXo4oZTmgo3maBexqeWSswIg2d5ojekaRb1fEHRwcs=;
	b=NMXEVEoGTgg8HGVYm5Ue7wG8ruG3btre7qfWq7RkaD8J/wIMyrzKlRr4byyEEXdZjY
	MA+450IKNn6Hzn894h3rekHsTYLwwJqtTiv7K0QAMsfKwz4LO9aIJIxg/Er8CNVVvvXA
	YKAjGZ/ByPuQitWvJsWqNKcYenscNTffvCHVk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ESZqfxS1EbqTk9ivBR+xJZsVK2gpjIpOJrcB8Ag+IffAPdpk6Wdi0Mz1jN/AH/GKax
	xIxyplg0Wz3OGV6fAEp+MneRhEAedU3R982t/2DknCNRbLL5piQTJ/hyrOPmqxTCd/zm
	QTGybU038282sdyOs7sX/F4LDILm7qzLHNnfE=
Received: by 10.101.130.27 with SMTP id h27mr11168758ann.170.1274879695109;
	Wed, 26 May 2010 06:14:55 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id n18sm433983anl.12.2010.05.26.06.14.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 06:14:54 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 May 2010 08:09:33 -0500
Message-Id: <1274879375-19626-5-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1274879375-19626-4-git-send-email-chase.maupin@ti.com>
References: <1274879375-19626-1-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-2-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-3-git-send-email-chase.maupin@ti.com>
	<1274879375-19626-4-git-send-email-chase.maupin@ti.com>
X-SA-Exim-Connect-IP: 74.125.83.65
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>
Subject: [PATCHv2 5/7] metadata: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 13:20:30 -0000
X-List-Received-Date: Wed, 26 May 2010 13:20:30 -0000

* Fixed up typos and other errors in the documentation.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 docs/usermanual/chapters/metadata.xml |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/docs/usermanual/chapters/metadata.xml b/docs/usermanual/chapters/metadata.xml
index bbf6f73..794c66c 100644
--- a/docs/usermanual/chapters/metadata.xml
+++ b/docs/usermanual/chapters/metadata.xml
@@ -95,7 +95,7 @@
 
     <para>OpenEmbedded has files ending with <emphasis>.conf</emphasis>,
     <emphasis>.inc</emphasis>, <emphasis>.bb</emphasis>
-    and<emphasis>.bbclass</emphasis>. The syntax and semantics of these files
+    and <emphasis>.bbclass</emphasis>. The syntax and semantics of these files
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
1.6.0.4



