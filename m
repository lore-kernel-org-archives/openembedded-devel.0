Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3BB65C7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 21:14:41 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so57875432wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 14:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=dVN3syJZCXrk8UejX54PrtJqt7r6AuTRQkTfUabBso0=;
	b=lEBlc17MJmyrVg767MWvy4lREWoMEsYKS+/3AxpY3/sxjs1rSqAgV09E101KFf5UVz
	VWbAMjyqjH+Qp4z6jTP60jq4WrFxMoXbkpvSMIHF4bPYwUtm25LNI1AmDwU8aSRBwLAM
	fhOhFrTj95entD5or0w5DhWUKJ8baabwsSXUygRIsxvM2Mc2fkGrSyJnPlPEZhz13znZ
	juHLBEA/+owBfTx/0w2uRdw8554BiWiQkwaEI0HkRUzfTvxwkg6MUDHLVc/rVLu9k1wo
	+jsUk4npbG26XEuZ31sXmJ7i7ELzE37fzIwVyxpOdW3+mrjcwdN6Z9G8C9yZ6CZ5d68s
	XCwA==
X-Received: by 10.194.219.234 with SMTP id pr10mr3125072wjc.105.1432588482770; 
	Mon, 25 May 2015 14:14:42 -0700 (PDT)
Received: from localhost.localdomain (p5B0A35C6.dip0.t-ipconnect.de.
	[91.10.53.198])
	by mx.google.com with ESMTPSA id 16sm18515406wjs.41.2015.05.25.14.14.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:14:40 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 23:14:07 +0200
Message-Id: <1432588449-31413-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 10/12] xfce4-equake-plugin: update to 1.3.7
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
X-List-Received-Date: Mon, 25 May 2015 21:14:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-equake-plugin_1.3.6.bb => xfce4-equake-plugin_1.3.7.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/equake/{xfce4-equake-plugin_1.3.6.bb => xfce4-equake-plugin_1.3.7.bb} (74%)

diff --git a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.6.bb b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.7.bb
similarity index 74%
rename from meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.6.bb
rename to meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.7.bb
index d4f069f..5969021 100644
--- a/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.6.bb
+++ b/meta-xfce/recipes-panel-plugins/equake/xfce4-equake-plugin_1.3.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "ee76ed3825999b24ee9c2c976d906e22"
-SRC_URI[sha256sum] = "8129067080c8a4656063e7cde20f13fabb47b49c84ce610916f54644acb93d67"
+SRC_URI[md5sum] = "4f8b8fc85e9506f43c9343f3c3c99ae1"
+SRC_URI[sha256sum] = "6b9e14c2f54060d182b61e90b4c84a79b57aab1955e3ff877c757f26cefa23bf"
 
 FILES_${PN} += "${libdir}/xfce4/panel-plugins/xfce4-equake-plugin"
-- 
1.9.3


