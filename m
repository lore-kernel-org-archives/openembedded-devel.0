Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <edoiron@edoiron.ott.cti.com>) id 1Mfg6P-0005is-Dq
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 22:25:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 923DC5488F1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 16:07:31 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16499-02 for <openembedded-devel@lists.openembedded.org>; 
	Mon, 24 Aug 2009 16:07:31 -0400 (EDT)
Received: from edoiron.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPS id 582CB549233
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 16:07:31 -0400 (EDT)
Received: by edoiron.ott.cti.com (Postfix, from userid 1000)
	id A28B17CE23E; Mon, 24 Aug 2009 11:07:08 -0400 (EDT)
From: Evan Doiron <edoiron@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2009 11:07:08 -0400
Message-Id: <1251126428-8995-1-git-send-email-edoiron@cbnco.com>
X-Mailer: git-send-email 1.6.0.2
X-Virus-Scanned: amavisd-new at cbnco.com
Cc: Evan Doiron <edoiron@cbnco.com>
Subject: [PATCH] nano: add v2.0.9
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
X-List-Received-Date: Mon, 24 Aug 2009 20:25:20 -0000

Signed-off-by: Evan Doiron <edoiron@cbnco.com>
---
 conf/checksums.ini                            |    4 ++++
 recipes/nano/{nano_2.0.7.bb => nano_2.0.9.bb} |    0
 2 files changed, 4 insertions(+), 0 deletions(-)
 copy recipes/nano/{nano_2.0.7.bb => nano_2.0.9.bb} (100%)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 2c85594..3ee124d 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -17762,6 +17762,10 @@ sha256=0d10d8f70a6fadfb9cfaa7b66c5fe7eba17e64ecb96104c4ddedc82f89765d5c
 md5=16187fed2bdefec6275ece6401ce4cd2
 sha256=5dc783c412c4d1ff463c450d2a2f9e1ea53a43d9ba1dda92bbf5182f60db532f
 
+[http://www.nano-editor.org/dist/v2.0/nano-2.0.9.tar.gz]
+md5=2be94dc43fb60fff4626a2401a977220
+sha256=6d212385680d29dcda35dda7801da19c80182a8bc6bc6d5cf7533034c853d37f
+
 [http://downloads.sourceforge.net/nasm/nasm-0.98.38.tar.bz2]
 md5=9f682490c132b070d54e395cb6ee145e
 sha256=87e64eff736196862ed46c04a3dffa612d765df980fa974fc65e026d811bd9d0
diff --git a/recipes/nano/nano_2.0.7.bb b/recipes/nano/nano_2.0.9.bb
similarity index 100%
copy from recipes/nano/nano_2.0.7.bb
copy to recipes/nano/nano_2.0.9.bb
-- 
1.6.0.2



