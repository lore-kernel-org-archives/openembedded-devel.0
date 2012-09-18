Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TDym6-0001lE-67
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Sep 2012 16:27:42 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2999370bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Sep 2012 07:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=NjQevJhTKa5anGV7BrmHkrG0buy5I1fk1HOmVVZ0Zc4=;
	b=c++UvjbQnJypPcm7NK/0k07/ATHomr7m/0XaNXb/PTKThBGzGPfG4iS120PEKa/BHj
	wKOkq1S6KEVPjwXWPLeFvtKX/J2igAQbioWJuU3dQuXY4S9uEb4JSrQy6wjd8XZP2kSV
	ULCsj0LOg3JQNywB9O4rYsbAhKcz0jum916PB35Ki9vdT/BDlvmuQSI4UC2TpHsPCvVu
	H9Z5zWozvcFbsNrypQD30SBKJG6zmSsUCDM1TyVYfRh3H0rNdmSPUKuM/1e7BBc5BNFO
	Fo0/wkwIDNZ6C7GHY1VRCNdLiEbOolz3PI+cz0WCcXdCrogjKfqNAl7qUe80KBNgp1Od
	nIYQ==
Received: by 10.205.139.6 with SMTP id iu6mr18688bkc.20.1347977704450;
	Tue, 18 Sep 2012 07:15:04 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-156-96.unitymediagroup.de.
	[95.222.156.96])
	by mx.google.com with ESMTPS id y20sm8006887bkv.11.2012.09.18.07.15.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 07:15:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Sep 2012 16:13:15 +0200
Message-Id: <1347977601-28665-35-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
References: <1347977601-28665-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/-oe/-multimedia 34/40] midori: update to 0.4.6
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
X-List-Received-Date: Tue, 18 Sep 2012 14:32:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../midori/{midori_0.4.5.bb => midori_0.4.6.bb}    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/midori/{midori_0.4.5.bb => midori_0.4.6.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/midori/midori_0.4.5.bb b/meta-oe/recipes-connectivity/midori/midori_0.4.6.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/midori/midori_0.4.5.bb
rename to meta-oe/recipes-connectivity/midori/midori_0.4.6.bb
index 7d68720..8b1a982 100644
--- a/meta-oe/recipes-connectivity/midori/midori_0.4.5.bb
+++ b/meta-oe/recipes-connectivity/midori/midori_0.4.6.bb
@@ -8,8 +8,8 @@ PR = "r1"
 
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
           "
-SRC_URI[midori.md5sum] = "14288197a1e2251b7c0803e1448daa0e"
-SRC_URI[midori.sha256sum] = "7b57cf3ebb56eef586351f2ae9f71ec9683aedff0b79a071b70b811d9876ff84"
+SRC_URI[midori.md5sum] = "3c3f0030611d9126ab90be48d44cab57"
+SRC_URI[midori.sha256sum] = "910f47bd2b5f2998cd4fce45c08f9e282318820b68562d0bade2096b9a17e3ea"
 
 inherit gtk-icon-cache pkgconfig
 
-- 
1.7.6.5



