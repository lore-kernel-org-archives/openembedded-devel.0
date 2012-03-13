Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S7P8l-0007jz-4t
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Mar 2012 11:39:39 +0100
Received: by wibhj13 with SMTP id hj13so455559wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2012 03:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=G2ZkLUnEu7iJKpCUExnUGm7ou67IkfTBHgDxoEh62kg=;
	b=YcqMudTYwq88IodEoima1H3Ul8O+itdWOF3YIQesk2rdQPNOsO7DXv4g7kgI/SoXVI
	Cv6ZaV6reNNN4VBGoyn3fgNURVcHZULPAGm7g9J3qAq/fEfdu6/IAAolvgZQg3vE4bTk
	Pnr142CFkH6EwJhmRg5u3BAbbW9pm1S0ZUtihMwU/bhfioPeIInQgWcjpE/jPtUeGlT/
	HscqR52HS8F8hUefp1LcItQh98xrmRkOfKubsK3WSf3bSfJijcOcJ+wlyOSzOeFF3mKK
	Ff1JguM4eVRVchARSWqMZ0m+8+CjPQ1B2GFX8BKov7Y03rnP0tIfF4j+e/Mg2pW4mjft
	Mk2Q==
Received: by 10.180.97.41 with SMTP id dx9mr6098780wib.9.1331634655259;
	Tue, 13 Mar 2012 03:30:55 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-83.unitymediagroup.de.
	[95.222.156.83])
	by mx.google.com with ESMTPS id w10sm537764wiy.3.2012.03.13.03.30.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Mar 2012 03:30:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Mar 2012 11:30:51 +0100
Message-Id: <1331634653-5439-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-xfce 1/3] ristretto: update to 0.3.5
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
X-List-Received-Date: Tue, 13 Mar 2012 10:39:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{ristretto_0.3.4.bb => ristretto_0.3.5.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.3.4.bb => ristretto_0.3.5.bb} (70%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.3.4.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.3.5.bb
similarity index 70%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.3.4.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.3.5.bb
index 00133c6..c139ea5 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.3.4.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.3.5.bb
@@ -9,5 +9,5 @@ inherit xfce-app
 
 RRECOMMENDS_${PN} += "tumbler"
 
-SRC_URI[md5sum] = "86c042ee4ffefb0ff5e806849ec4d33c"
-SRC_URI[sha256sum] = "e2ed5c6bc3f56cf82942c54d1492e54607ccf073c7963c1df5fa2cd3a9a71a32"
+SRC_URI[md5sum] = "3bfdf129926236a45c58d7afdbb703b7"
+SRC_URI[sha256sum] = "96dc519c2e930955f97027d7b9bb7542b01a6ad0ca53a16f9af58f7c851eb8f2"
-- 
1.7.6.5



