Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48ADD71BB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:42:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1S5gH4x000367
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 21:42:17 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 27 Feb 2019 21:42:16 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Feb 2019 13:42:11 +0800
Message-ID: <1551332535-158589-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAMKF1srJuJQ8UHr1AAGgNYXi24MrfgTZA3KOfnoOjbWXVVq2JA@mail.gmail.com>
References: <CAMKF1srJuJQ8UHr1AAGgNYXi24MrfgTZA3KOfnoOjbWXVVq2JA@mail.gmail.com>
MIME-Version: 1.0
Subject: [PATCH 0/4 V2] Add PACKAGECONFIGs
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
X-List-Received-Date: Thu, 28 Feb 2019 05:42:17 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Add PACKAGECONFIGs

Changqing Li (4):
  freeradius: Add PACKAGECONFIG openssl/rlm-eap-fast/rlm-eap-pwd
  openhpi: Add PACKAGECONFIG snmp-bc
  net-snmp: Add PACKAGECONFIG des
  krb5: Add PACKAGECONFIG pkinit

 .../recipes-connectivity/freeradius/freeradius_3.0.17.bb            | 4 ++++
 meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb            | 3 ++-
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb          | 6 ++++--
 meta-oe/recipes-connectivity/krb5/krb5_1.16.2.bb                    | 3 ++-
 4 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.7.4


