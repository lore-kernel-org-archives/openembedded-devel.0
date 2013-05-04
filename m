Received: from mail-wg0-f45.google.com ([74.125.82.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UYZ9n-00047u-Sg
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 May 2013 11:53:38 +0200
Received: by mail-wg0-f45.google.com with SMTP id l18so2281585wgh.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 May 2013 02:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=M4CllgylcqmfBGkz1exvzjSoTsoEdsvXU4kuoCJFhoM=;
	b=pPXj7Pr9EAKHr2XEDkBX9MmlPQVDV85dH2dpLJ9FRbcW7m7L9p1Tc9DkR6rs29m+4Z
	XJsQ/sqBNnWVlcuprv+cKq4MN70p5Izc2x75OvBkagTrtl/e1gmTwLWjDsY3pLmCKVTI
	qnO9d9+FWO3W9Kp0sdk17cM+4ZThiR6GKRxIphhxz2TKXA2Gq+rwQSes5VM/KWCReUMp
	htQcXNMs9kyWF21P1abuUVKr42HnlII+3xmZzsQ3FxCU/OD2N54cdzOTGAKgwsZyZsHj
	1uumyJb/5GpapL89wxUYCq7Qo4xgV1HHehE9dpMtwakkO4A9L9KS8/GIzeUMyTM21OAV
	fabA==
X-Received: by 10.194.243.10 with SMTP id wu10mr6169943wjc.13.1367660135712;
	Sat, 04 May 2013 02:35:35 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id ed20sm2150948wic.0.2013.05.04.02.35.34
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 04 May 2013 02:35:34 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 May 2013 10:35:13 +0100
Message-Id: <1367660117-19572-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.2.2
In-Reply-To: <1367660117-19572-1-git-send-email-paul@paulbarker.me.uk>
References: <1367660117-19572-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-multimedia][PATCH 1/5] fluidsynth: fixed license name
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
X-List-Received-Date: Sat, 04 May 2013 09:53:49 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
index a989e76..4986da2 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Fluidsynth is a software synthesizer"
 HOMEPAGE = "http://www.fluidsynth.org/"
 SECTION = "libs/multimedia"
-LICENSE = "LGPLv-2.0+"
+LICENSE = "LGPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dda26baa823649da9a68947707650272"
 
 DEPENDS = "alsa-lib ncurses"
-- 
1.8.2.2



