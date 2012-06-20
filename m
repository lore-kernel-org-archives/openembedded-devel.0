Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ShOCe-0002tV-6j
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jun 2012 18:56:29 +0200
Received: by bkcjm2 with SMTP id jm2so6219123bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2012 09:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=AW/6KcdyjyZPJTZRSBuWxwe0Z5euUyzerhViXbAG4Ss=;
	b=YbkJ0YymTpFXAf1QIn7P2hgsCOqfyPM608Oau4I2jcBTP6S7AhFS0cT/IhLgNOETLv
	oM9SDrVqkzRfpDWeR0haY6QprQ0JE1BuyVZ+CEWaWyMhLCfZNO03WUx0aHNDTwFYi629
	eWlvotAN9OkcAubeUqG6/wmllFlObqSLDhvmdsmRNH5Pr/3HtHubODoDZre8QwTX56Jp
	qfU6zoaGRn+qMRRvq51tLM4xo7joQRXeEhRyEWg0LsppYCmxsev4rTJrKnlp76BMU6KN
	Mcl2DRV9M8Wm/f2S1SzlzfHDTjh1ijedRlJ2xGfTfXEyCoRZq1OE+22jR6j0vLpPUNXI
	Uwug==
Received: by 10.204.154.18 with SMTP id m18mr10859482bkw.23.1340210739192;
	Wed, 20 Jun 2012 09:45:39 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id iq16sm28603285bkc.6.2012.06.20.09.45.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 09:45:38 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jun 2012 18:45:20 +0200
Message-Id: <1340210721-21548-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-xfce 1/2] xfce4-power-manager: update to 1.2.0
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
X-List-Received-Date: Wed, 20 Jun 2012 16:56:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...ager_1.0.10.bb => xfce4-power-manager_1.2.0.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.0.10.bb => xfce4-power-manager_1.2.0.bb} (85%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.10.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
similarity index 85%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.10.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
index 4641178..670fc25 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.0.10.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
@@ -24,5 +24,5 @@ FILES_xfce4-brightness-plugin = " \
     ${datadir}/xfce4/panel-plugins/xfce4-brightness-plugin.desktop \
     "
 
-SRC_URI[md5sum] = "38cbd272eb30e36ae538d9f38858bd38"
-SRC_URI[sha256sum] = "80e4bb44f81c485ec09654dde432d6e28667d49a787625632a4413aac30422f0"
+SRC_URI[md5sum] = "935599b7114b0a4b0e2c9a5d6c72524c"
+SRC_URI[sha256sum] = "d7fb98a540284b62f4201527de17d4b24123f9d26c9f49131dd497c8387184e9"
-- 
1.7.6.5



