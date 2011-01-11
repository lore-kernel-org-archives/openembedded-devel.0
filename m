Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcgul-0002AM-Ia
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 17:17:43 +0100
Received: by ewy28 with SMTP id 28so5837900ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 08:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=dY/f3f+c3Fa6zqh8562MAO6t5zDbHwIsKaif67f1sYo=;
	b=uNG1ZCKGyY+Rgw7DoAWrSehOem/Tq78I7r/h3vK6X1sIZbCNswlaPZF7lAMOGZFOx+
	52LAtdIbBHjzI0exoGPHrpTWMqR4G1d4gl8hsmIPy0422vK8Gfr5t5KOlNItG1pLYKQ3
	Wd/DYtpYdGVkJFpROd0TXou3KLPLJ+H7h9DxQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=BrdW1tZd7Vt4KtZqCdXqbmNerH3Ye6NupZdX6woHmtLW2/t36tlqYnUCfFvV+5p+sZ
	3c62m1ykowxuEh9vLskfgq8WLtmE7Cf3Pu0UipqZemmEvFHRcIixGcGi5byJpO7v+bwZ
	13r2TuIijfUgfuUxg6426EfgwyuN6JIbeASIU=
Received: by 10.223.116.1 with SMTP id k1mr2246792faq.51.1294762631958;
	Tue, 11 Jan 2011 08:17:11 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n3sm7457401faa.5.2011.01.11.08.17.10
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 08:17:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 17:17:14 +0100
Message-Id: <1294762634-13995-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
Subject: [PATCH 10/12] removal: announce old xorg recipes removal
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
X-List-Received-Date: Tue, 11 Jan 2011 16:17:43 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 removal.txt |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/removal.txt b/removal.txt
index c526b45..8db663c 100644
--- a/removal.txt
+++ b/removal.txt
@@ -34,3 +34,10 @@ Proposed by:    Martin 'JaMa' Jansa
 Note:		Openmoko distribution removed 2010-08-10
 Note:		Moved to obsolete on 2010-10-19
 Note:           Removed 2010-12-22
+
+Package Name:	obsolete/xorg-*
+Removal Date:	2011-02-01
+Maintainer:	Martin 'JaMa' Jansa
+Reason:	Old not pinned versions, we have X11R7.6 now by default
+Proposed by:	Martin 'JaMa' Jansa
+Note:		Moved to obsolete on 2011-01-11
-- 
1.7.4.rc1



