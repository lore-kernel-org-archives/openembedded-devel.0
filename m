Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi3W-0002Sw-Km
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:16:18 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926125eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ItsQspFFp2kffkPL44NKa5PlygJwQ2gCjAd3IWtmK/w=;
	b=qnYuaWt1HOT3kjhbkdCkdM1N9NOu1s18q9RxYxfsCVzlNzsuYWAHPVW5PR334UBRo/
	R3VOs4FQS4y0JcjafgO0oAIKVv/yFAfSc2hcsCrc1fgkW/LknS1Wr1hkxg188Jy5FOaY
	+2ba+9sRTx5wqB+IIHPjtIAQ/eFgdrPlCFCzWKoExDL3FJBnuiU6ugjdWxWqhPjDeknb
	xi8kKLZtaLmhSZHxt92hsNcQ1zqcHAaaaQev/ZsfBccjEqouz9W11V3P1NCZKHgX9liO
	ou/FZas8al/k7obooXVFgUX9DiJUk/Gn5GimPs/9USO2ecOGKcMyI3WSz6lT/5yzvhs8
	iWbA==
Received: by 10.14.176.66 with SMTP id a42mr42752756eem.34.1354586519033;
	Mon, 03 Dec 2012 18:01:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e2sm34799397eeo.8.2012.12.03.18.01.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:01:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:50 +0100
Message-Id: <231dce0bf12a1d1d9c7ba76e2683da3fc3ae44fc.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 17/58] forecast: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 04 Dec 2012 02:16:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/forecasts_svn.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-efl/recipes-efl/e17/forecasts_svn.bb b/meta-efl/recipes-efl/e17/forecasts_svn.bb
index a6316ed..a030952 100644
--- a/meta-efl/recipes-efl/e17/forecasts_svn.bb
+++ b/meta-efl/recipes-efl/e17/forecasts_svn.bb
@@ -1,4 +1,7 @@
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
+                    file://COPYING-PLAIN;md5=51328cfb73bfec3eed7cfd3dbed73988"
+
 PV = "0.2.0+svnr${SRCREV}"
 PR = "${INC_PR}.0"
 
-- 
1.8.0



