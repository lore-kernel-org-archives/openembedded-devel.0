Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6876A6F1C8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Mar 2014 19:42:52 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id g15so4823794eak.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Mar 2014 11:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5JwlspanpP86pGgd5s5E0fDVWmCIGot2JLnxfT7BN0U=;
	b=yP+67uw64dCZG/gOYpRAwGtQhuvy42GS1bc27Z5LpR5inZ8qPq/7StYeuHjTJG3rTX
	LAXy9k3LHSDRsYGtfy65sBunBetLUPaTYOd7ke3AoK7I7A9tdNT30l41ojRvUOJDiaS4
	RIrrVn49mPe1C06CK/8J616QjdrHRpnU9YBuCjYxTDepZV3GnqcX1PPhQnZacunAPSaU
	uB4OY4iUjtZA9tLqFK4Vvt3vOmW7dD4Me1FOmtCyDz8HszwVFWFCKIUKCULJtwEyCzCT
	ExlSxTJ7Uc2wXZP03jo58/eM1yJ2D0q1KlJ5B690Lmzi8YB9hS6sHstVa/84zC1lyQvS
	Tfew==
X-Received: by 10.15.76.1 with SMTP id m1mr4635275eey.108.1393875773201;
	Mon, 03 Mar 2014 11:42:53 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	x3sm53951582eep.17.2014.03.03.11.42.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 11:42:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Mar 2014 20:42:54 +0100
Message-Id: <1393875775-29375-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-systemd][PATCH 1/2] openssh: Rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Mon, 03 Mar 2014 19:42:53 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../openssh/{openssh_6.4p1.bbappend => openssh_6.5p1.bbappend}            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/oe-core/recipes-connectivity/openssh/{openssh_6.4p1.bbappend => openssh_6.5p1.bbappend} (100%)

diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.4p1.bbappend b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.5p1.bbappend
similarity index 100%
rename from meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.4p1.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.5p1.bbappend
-- 
1.9.0


