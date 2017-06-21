Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2F078066
	for <openembedded-deveL@lists.openembedded.org>;
	Wed, 21 Jun 2017 07:32:15 +0000 (UTC)
Received: from kw-mxoi2.gw.nic.fujitsu.com (unknown [192.168.231.133]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 05d3_680a_c30b555f_c04f_44b0_996d_dc6970826a13;
	Wed, 21 Jun 2017 16:32:11 +0900
Received: from g01jpfmpwkw01.exch.g01.fujitsu.local
	(g01jpfmpwkw01.exch.g01.fujitsu.local [10.0.193.38])
	by kw-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id A9878AC011F
	for <openembedded-deveL@lists.openembedded.org>;
	Wed, 21 Jun 2017 16:32:10 +0900 (JST)
Received: from g01jpexchkw35.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	A80FF692626 for <openembedded-deveL@lists.openembedded.org>;
	Wed, 21 Jun 2017 16:32:09 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw35.g01.fujitsu.local (10.0.193.50) with Microsoft SMTP
	Server id 14.3.266.1; Wed, 21 Jun 2017 16:32:09 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-deveL@lists.openembedded.org>
Date: Wed, 21 Jun 2017 16:33:35 +0900
Message-ID: <1498030415-12141-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] zabbix: 3.0.8 -> 3.0.9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Jun 2017 07:32:17 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../recipes-connectivity/zabbix/{zabbix_3.0.8.bb => zabbix_3.0.9.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_3.0.8.bb => zabbix_3.0.9.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_3.0.8.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_3.0.9.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_3.0.8.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_3.0.9.bb
index 7e7d6de..bab5a6a 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_3.0.8.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_3.0.9.bb
@@ -28,8 +28,8 @@ SRC_URI = "http://jaist.dl.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stab
     file://zabbix-agent.service \
 "
 
-SRC_URI[md5sum] = "f7f41850397d2078ccae4b7389f9a005"
-SRC_URI[sha256sum] = "1df3e106427ed21547b8119049a161092f597d04507f9eb535951a9ee887a476"
+SRC_URI[md5sum] = "489d21b464277c0d412155c7e5611a8f"
+SRC_URI[sha256sum] = "4445f26c025009681c29c9b350aa6c4ee7b124ddcaf1609ae36c55997bcb8cf2"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.7.4


