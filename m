Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SqlrW-00030e-Mw
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 16:01:22 +0200
Received: by bkcik5 with SMTP id ik5so3526137bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 06:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=AW/6KcdyjyZPJTZRSBuWxwe0Z5euUyzerhViXbAG4Ss=;
	b=IJESndnZfNVZzq7jKIFbbn5VjOa55fpzI3Lo73qQtz5quxvZQX9fGgOQBdHhu8o5JU
	ad+oZSBQtnb/Ren3PXjK137ImF5ZTqMMvrVevwICuc0fD1jULciD9kqYVd7CTZ0RAM72
	dKgxkQFKpL4YZ1tkSqqJFubwXMTql+FIeWyGU0PTYtTRreBWvqZt1+cTXwHuzmi3fhbw
	WiHHvf+WabBB9pRxPushYdDnk8qv6MOU5tFeZY7HTMhDXiqIpbHwl9Z8BgCOwYn6rMll
	TYBGcp9rxTKv/4v7rhlJ4a+U+EWp+ORj6haot8l5bK4PmNWJslMflWcQd9YVteWt2wMo
	25nw==
Received: by 10.204.130.216 with SMTP id u24mr4902276bks.119.1342446604396;
	Mon, 16 Jul 2012 06:50:04 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id hs2sm8179247bkc.1.2012.07.16.06.50.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 06:50:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2012 15:49:37 +0200
Message-Id: <1342446578-8330-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-xfce,resend 1/2] xfce4-power-manager: update to 1.2.0
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
X-List-Received-Date: Mon, 16 Jul 2012 14:01:22 -0000
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



