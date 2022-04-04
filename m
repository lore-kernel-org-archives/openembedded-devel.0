Return-Path: <stefan@datenfreihafen.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53D3C6369B
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:45 +0000 (UTC)
Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web11.34765.1649077455148692655
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 06:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185,
 mailfrom: stefan@datenfreihafen.org)
Received: from localhost.localdomain.datenfreihafen.local
 (p200300e9d74ad0b328e5b57aaa094595.dip0.t-ipconnect.de
 [IPv6:2003:e9:d74a:d0b3:28e5:b57a:aa09:4595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@sostec.de)
	by proxima.lasnet.de (Postfix) with ESMTPSA id 4D0DBC0DC7;
	Mon,  4 Apr 2022 15:04:13 +0200 (CEST)
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Cc: Stefan Schmidt <stefan@datenfreihafen.org>,
	Stefan Schmidt <stefan.schmidt@huawei.com>
Subject: [meta-networking][PATCH 4/4] MAINTAINERS: add entry for OpenThread
Date: Mon,  4 Apr 2022 15:03:54 +0200
Message-Id: <20220404130354.2131131-4-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404130354.2131131-1-stefan@datenfreihafen.org>
References: <20220404130354.2131131-1-stefan@datenfreihafen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96381

From: Stefan Schmidt <stefan.schmidt@huawei.com>

No need to put the pressure of this also on Khem. I am actively working
on this for Oniro and will support this work also upstream here.

Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
---
 meta-networking/MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/MAINTAINERS b/meta-networking/MAINTAINERS
index 77e90668c..ce53ec471 100644
--- a/meta-networking/MAINTAINERS
+++ b/meta-networking/MAINTAINERS
@@ -37,3 +37,7 @@ F:      recipes-*
 NETKIT
 M:      Armin Kuster <akuster808@gmail.com>
 F:      recipes-netkit
+
+OPENTHREAD
+M:      Stefan Schmidt <stefan@datenfreihafen.org>
+F:      recipes-connectivity/openthread/
--=20
2.35.1


