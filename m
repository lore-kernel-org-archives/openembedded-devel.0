Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id C93736163D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 08:45:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,467,1574092800"; d="scan'208";a="83686048"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 21 Feb 2020 16:35:58 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id F331650A9978
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 16:26:16 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Fri, 21 Feb 2020 16:35:56 +0800
Received: from localhost.local (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Fri, 21 Feb 2020 16:35:58 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Feb 2020 16:37:37 +0800
Message-ID: <20200221083737.17042-6-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200221083737.17042-1-zangrc.fnst@cn.fujitsu.com>
References: <20200221083737.17042-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: F331650A9978.A877F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] [meta-perl] [PATCH] libio-socket-ssl-perl: upgrade 2.066 -> 2.067
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
X-List-Received-Date: Fri, 21 Feb 2020 08:45:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ocket-ssl-perl_2.066.bb => libio-socket-ssl-perl_2.067.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.066.bb => libio-socket-ssl-perl_2.067.bb} (91%)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.066.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.067.bb
similarity index 91%
rename from meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.066.bb
rename to meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.067.bb
index 7609846d6..c262d3a21 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.066.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.067.bb
@@ -22,8 +22,8 @@ RDEPENDS_${PN} += "\
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Socket-SSL-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "ecf96ce2ff9e04a03a2d101c76ce1020"
-SRC_URI[sha256sum] = "0d47064781a545304d5dcea5dfcee3acc2e95a32e1b4884d80505cde8ee6ebcd"
+SRC_URI[md5sum] = "1d55e9f66ca442f4e0ae4d018e3067fc"
+SRC_URI[sha256sum] = "ef8842806d047cf56e2af64add4ed30b24547bcbb50e8df33cee0c54609af1c1"
 
 S = "${WORKDIR}/IO-Socket-SSL-${PV}"
 
-- 
2.20.1




