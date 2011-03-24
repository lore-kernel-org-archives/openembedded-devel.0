Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2hXW-0002Ql-NL
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:13:14 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so7237376bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=jvreZ9xWsGrfiO8OxSIG0RqMTp7ZLD6ADlCkBWGHd1M=;
	b=aBLgImImD7n2x6cS4ooZieVSfzFXfzwLh/WPjgeYEoweeY8B+kok6TgjlYdLFBBn9i
	TEMFcXmGOSll3ICjngfLCLhdBhk0QPVANvlNWOwAk0QMgRWyfSWdToRWBed5oQNnp21r
	WqDE4vMxqqCgI2L/KYmrsmDM76a1ANwGNC1Hc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=iJJ702/mKOU6e+TM1Tv6Z6Mu6YcCUQYqom8UQVYNi5JdfDgyxf2Kf8RS9/Q5v7C2JI
	nVPHhMe/CHMQwcioD25fGrVmo5LPsvf6abyHb2IdWANHNqUaOOXPsxjkTCHwX1NK74tA
	ugo5S8VCtyNc54ifqQQLmNIpGU7IwI1Vr/Uqo=
Received: by 10.204.154.219 with SMTP id p27mr7235246bkw.110.1300961485016;
	Thu, 24 Mar 2011 03:11:25 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id q18sm6584432bka.15.2011.03.24.03.11.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 03:11:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 Mar 2011 11:11:17 +0100
Message-Id: <863e05d622098156ffc72304043d164f717a50af.1300961186.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300961186.git.Martin.Jansa@gmail.com>
References: <cover.1300961186.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/7] gitflib: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 24 Mar 2011 10:13:14 -0000

---
 meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb b/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
index 16be642..bd7b495 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_4.1.6.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "shared library for GIF images"
 SECTION = "libs"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ae11c61b04b2917be39b11f78d71519a"
 PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.bz2"
-- 
1.7.4.1



