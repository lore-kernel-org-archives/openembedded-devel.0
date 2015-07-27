Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3348976387
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 19:37:13 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so152385037wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2015 12:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=xxK3V8aw3dGlUDRCFCUS9aCS8ASkqFwOfmivACrTw+E=;
	b=NnpOpmS6beJ6SSdKwg0NZMsxtwJQTc2ZFDZYhzBfqWMwHJukq5Y3b+v7MXbz1yZ26K
	q9w1d7DKuYgEkKRpiZAOyCFVKEwBd4bNUFo3cS+ZVYYz59BLW/2ngN2t0qEbt+bK9Lkl
	fK0MVYYCc8RyiuwdueHZGpI0n0G43cvFp71/gI6UWZ1ZlR9aOR6C8Yr9zA9AP75LA3ik
	ZHoUgGJWse9EZi/M1dFbl6q2p420EKFCwbn5+1FWAsLo4CkPfEWgPxPZiRUSKDDdwxGw
	CBTcrQPUszIPxkIAuVXUx00QDRG3BiftelOXSh4GgJKbRhn/Vcb42nAFdL5CsRNJ9LBp
	lmFg==
X-Received: by 10.180.8.68 with SMTP id p4mr27268837wia.27.1438025834037;
	Mon, 27 Jul 2015 12:37:14 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2DA2.dip0.t-ipconnect.de.
	[91.10.45.162]) by smtp.googlemail.com with ESMTPSA id
	k12sm23016995wjw.4.2015.07.27.12.37.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 12:37:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jul 2015 21:36:55 +0200
Message-Id: <1438025815-31315-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1438025815-31315-1-git-send-email-schnitzeltony@googlemail.com>
References: <1438025815-31315-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] packagegroup-xfce-extended: add xfce4-hotcorner-plugin
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
X-List-Received-Date: Mon, 27 Jul 2015 19:37:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index db3a2ce..c19a46a 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -45,6 +45,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-mailwatch-plugin \
     xfce4-kbdleds-plugin \
     xfce4-smartbookmark-plugin \
+    xfce4-hotcorner-plugin \
     \
     thunar-media-tags-plugin \
     thunar-archive-plugin \
-- 
2.1.0


