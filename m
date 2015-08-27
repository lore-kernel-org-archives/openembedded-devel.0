Return-Path: <lchristina26@hotmail.com>
X-Greylist: delayed 480 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 27 Aug 2015 16:30:06 UTC
Received: from BLU004-OMC3S28.hotmail.com (blu004-omc3s28.hotmail.com
	[65.55.116.103])
	by mail.openembedded.org (Postfix) with ESMTP id 3E75673E11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 16:30:06 +0000 (UTC)
Received: from BLU436-SMTP163 ([65.55.116.72]) by BLU004-OMC3S28.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Thu, 27 Aug 2015 09:22:06 -0700
X-TMN: [EoZHfAQWI7Fu/cyUcR8WiGQEILbS/i4u]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP163EC5681882060DBD6E64ED66F0@phx.gbl>
From: LC Mac <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Aug 2015 10:21:10 -0600
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 27 Aug 2015 16:22:04.0418 (UTC)
	FILETIME=[82BAA620:01D0E0E4]
MIME-Version: 1.0
Subject: [meta-networking][PATCH] wolfssl: update version from 3.4.0 to 3.6.6
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
X-List-Received-Date: Thu, 27 Aug 2015 16:30:06 -0000
Content-Type: text/plain

Updates include:
SSLv3 disabled by default
removed support for static cipher suites with PSK, RSA, ECDH

Signed-off-by: lchristina26 <leah@wolfssl.com>
---
 .../recipes-connectivity/wolfssl/{wolfssl_3.4.0.bb => wolfssl_3.6.6.bb}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.4.0.bb => wolfssl_3.6.6.bb} (100%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.4.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb
-- 
1.9.1


