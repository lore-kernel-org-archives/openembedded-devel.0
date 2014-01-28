Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7609F6E9BD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 21:18:10 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d17so493549eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2014 13:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PNTYRM5GoM9EwMBHCTNxyWev91Fr7Z9i4bmGQ0Rlr0U=;
	b=U5hhLZErGvRk7xDkrIBVSVylNJkRQGj1v8vPXsaB9MPJlDfCSoL4vki5eQ0zidKJ+l
	yltzf31EKxtRDcAibVycluDfuZoI1a2N34YZurQsalFzc8bkXYjigMtfPPFIgJmUi0NN
	dUt2Jt2M8/zag9PlGY0XJK2e8BTL2ZzjFOFFThyYBJRSBF48FY9SQB4cvLh3N3mWd3Xu
	+O+wFQCchsdepSLEjgwavCxGFS2TTYOYXYWhIYCX8kzqZkx3+2/fnHVU/kGkaKjn+Cpo
	duXA4AbMQKGeSM1ijJDAw5M95Qz1zMgA9KRt2Tj1AlnQjtr/mrWVeMfU0n4ywaW26ZGY
	3y4g==
X-Received: by 10.15.42.72 with SMTP id t48mr4019898eev.45.1390943890741;
	Tue, 28 Jan 2014 13:18:10 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v7sm60223945eel.2.2014.01.28.13.18.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jan 2014 13:18:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2014 22:18:14 +0100
Message-Id: <1390943894-18907-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-systemd][PATCH] connman: Rename .bbappend to match new version from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jan 2014 21:18:10 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../connman/{connman_1.20.bbappend => connman_%.bbappend}                 | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.20.bbappend => connman_%.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.20.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_%.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/connman/connman_1.20.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/connman/connman_%.bbappend
-- 
1.8.5.3


