Received: from mail-ee0-f49.google.com ([74.125.83.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TpjE9-0005wo-U8
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Dec 2012 18:32:53 +0100
Received: by mail-ee0-f49.google.com with SMTP id c4so6143344eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Dec 2012 09:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=Zkz1SE4SN35ZbV3AX/M9A6m9b7C6mCVI0L53au5W9LM=;
	b=E49DHC/r0Q3uatQRmDI1BMpnXG4Lf7Cp0V67eKvkSuoVvThVpplQAF+HPqBzPyJApe
	KLLLo80zaGoHwv+sm1VbAmJH9MNX1xblMGhGNzcLEi561IpbHqd2a3LnmiyDXYc8Iv2n
	a5LcEVW63ur7v2zsMgLcDSd9ueVJwu1NIpVPmG15MXY2PEzllV2guNIohYfUe17TNkUK
	iMxR+4fdU0akgMCSPkAWbYIzOY4Qis1KqY8iYFYRMexaMd1ivhavKfQSM5LkC/0aMRLU
	PGVunBS5mstALYVgM1P006IsS0ln7t8/iwEG+zkm2u1+J198g18EQCbPPF8zM5hSPOdH
	37JA==
X-Received: by 10.14.174.132 with SMTP id x4mr110200769eel.39.1356974262157;
	Mon, 31 Dec 2012 09:17:42 -0800 (PST)
Received: from localhost.localdomain (p5B0A1BD4.dip.t-dialin.net.
	[91.10.27.212])
	by mx.google.com with ESMTPS id 46sm86204729eeg.4.2012.12.31.09.17.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Dec 2012 09:17:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Dec 2012 18:17:17 +0100
Message-Id: <1356974245-3497-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356974245-3497-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 02/10] tumbler: update to 0.1.26
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
X-List-Received-Date: Mon, 31 Dec 2012 17:33:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{tumbler_0.1.25.bb => tumbler_0.1.26.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_0.1.25.bb => tumbler_0.1.26.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.25.bb b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.26.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/tumbler/tumbler_0.1.25.bb
rename to meta-xfce/recipes-xfce/tumbler/tumbler_0.1.26.bb
index 3c2c2b3..a066713 100644
--- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.25.bb
+++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.26.bb
@@ -6,8 +6,8 @@ DEPENDS = "dbus-glib freetype gdk-pixbuf poppler"
 
 inherit xfce
 
-SRC_URI[md5sum] = "d4edc15c172714c7a3eaf3c719b8faf6"
-SRC_URI[sha256sum] = "02d5de508d8c18692a25a832a9280c2043f6b7c90dd3fcbd87f5955337015546"
+SRC_URI[md5sum] = "874621e7820b3bfe0e8ab66d17f1dc31"
+SRC_URI[sha256sum] = "6602ce700160d09edd88ea0b9bcb16abbc28974f372e646709e0ed8fbacc8a78"
 
 INSANE_SKIP_${PN} = "dev-so"
 
-- 
1.7.4.4



