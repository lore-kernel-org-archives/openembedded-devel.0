Return-Path: <lchristina26@hotmail.com>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 05 Jan 2016 16:33:40 UTC
Received: from BLU004-OMC3S5.hotmail.com (blu004-omc3s5.hotmail.com
	[65.55.116.80])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF4573177
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 16:33:40 +0000 (UTC)
Received: from BLU436-SMTP163 ([65.55.116.74]) by BLU004-OMC3S5.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Tue, 5 Jan 2016 08:28:40 -0800
X-TMN: [9XokHMdnceFsueZ7Vg9gwosYMU5cbIta]
X-Originating-Email: [lchristina26@hotmail.com]
Message-ID: <BLU436-SMTP1639BAACC4B25952154FE54D6F30@phx.gbl>
From: LC Mac <lchristina26@hotmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 5 Jan 2016 09:28:29 -0700
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 05 Jan 2016 16:28:39.0813 (UTC)
	FILETIME=[22846350:01D147D6]
MIME-Version: 1.0
Subject: [meta-networking][PATCH] wolfssl: updated version from 3.6.6 to 3.8.0
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
X-List-Received-Date: Tue, 05 Jan 2016 16:33:42 -0000
Content-Type: text/plain

Version 3.8.0 of wolfSSL includes VxWorks example client/server,
AESNI use with AES-GCM, Stunnel compatibility, C# wrapper, and more.

Signed-off-by: lchristina26 <leah@wolfssl.com>
---
 .../recipes-connectivity/wolfssl/{wolfssl_3.6.6.bb => wolfssl_3.8.0.bb}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.6.6.bb => wolfssl_3.8.0.bb} (100%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.8.0.bb
similarity index 100%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.8.0.bb
-- 
1.9.1


