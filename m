Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id E242A6F348
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 16:31:16 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id g10so2325273pdj.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 08:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2z6hpbR1Vb74pQECiiDJ9NygBlWHOh/o0ZZ/i1+eK8I=;
	b=MmX9dyxCjzeXwhbGUsTe0Z+WvkSfVI7mwOwDP6DGUTRdbnjrrTPqkdsdYIb38CZRGU
	qpz7UZrE2grU971kBLiCEzKfCzwPD4h4pfysUHSRWZx63q9TCqbWkAhE95yr/UA9qINg
	lZOWvmlGmfIQBI8MQXF10K0K8tsnaO5+xoxv5Qj5WnDhIwO+o2BhIFJUI5wAip0FQUXx
	7oxwRaJsIXVBAGdyNO34Yvdv+1f0Jzfi4KNWyuXtNKQHnzVr78FV/Z3smcZ4CAQsuRzl
	366/VqOz3sp9OtzDFfzXD1XwHuhcfWdM+yZgOCpF40MeqlrQ0YfSWxyJJrVCfxiE3oTk
	wzBA==
X-Received: by 10.66.151.205 with SMTP id us13mr2535619pab.93.1393345878024;
	Tue, 25 Feb 2014 08:31:18 -0800 (PST)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	eb5sm146677117pad.22.2014.02.25.08.31.16 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Feb 2014 08:31:17 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Feb 2014 08:32:54 -0800
Message-Id: <1393345975-20556-3-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1393345975-20556-1-git-send-email-ticotimo@gmail.com>
References: <1393345975-20556-1-git-send-email-ticotimo@gmail.com>
Subject: [meta-multimedia][PATCH 2/3] live555: update to 2013.04.30
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
X-List-Received-Date: Tue, 25 Feb 2014 16:31:19 -0000

From: Tim Orling <TicoTimo@gmail.com>

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-oe/recipes-multimedia/live555/live555_20130430.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/live555/live555_20130430.bb

diff --git a/meta-oe/recipes-multimedia/live555/live555_20130430.bb b/meta-oe/recipes-multimedia/live555/live555_20130430.bb
new file mode 100644
index 0000000..935550a
--- /dev/null
+++ b/meta-oe/recipes-multimedia/live555/live555_20130430.bb
@@ -0,0 +1,9 @@
+require live555.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "95533d91bd196e42fd748076dc244b09"
+SRC_URI[sha256sum] = "e549af608c9961d85cb647bc3b99804fec0fbaf5338c1b72d057558ae5cd2aea"
+
-- 
1.8.3.2


