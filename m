Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E2B337CC14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 08:42:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1R8g21T012720
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 00:42:12 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 27 Feb 2019 00:41:51 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Feb 2019 16:41:46 +0800
Message-ID: <1551256910-119653-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/4] Add PACKAGECONFIG
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
X-List-Received-Date: Wed, 27 Feb 2019 08:42:22 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Add PACKAGECONFIG for 4 recipes

Changqing Li (4):
  net-snmp: add PACKAGECONFIG disable-des
  krb5: add PACKAGECONFIG disable-pkinit
  openhpi: add PACKAGECONFIG disable-snmpbc
  freeradius: add PACKAGECONFIGs

 meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb | 3 +++
 meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb             | 1 +
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb           | 1 +
 meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb                     | 1 +
 4 files changed, 6 insertions(+)

-- 
2.7.4


