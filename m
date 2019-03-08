Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0374B7CD66
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 08:07:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2886TJS011281
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Mar 2019 00:06:44 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 8 Mar 2019 00:06:18 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 8 Mar 2019 03:06:10 -0500
Message-ID: <20190308080614.184756-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 0/4] Update packages in meta-perl
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
X-List-Received-Date: Fri, 08 Mar 2019 08:07:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


Kai Kang (4):
  libnet-dns-perl: 1.18 -> 1.19
  libxml-libxml-perl: 2.0132 -> 2.0134
  libio-socket-ssl-perl: 2.060 -> 2.066
  logcheck: 1.3.19 -> 1.3.20

 .../logcheck/{logcheck_1.3.19.bb => logcheck_1.3.20.bb}     | 6 ++++--
 ...ket-ssl-perl_2.060.bb => libio-socket-ssl-perl_2.066.bb} | 6 +++---
 .../{libnet-dns-perl_1.18.bb => libnet-dns-perl_1.19.bb}    | 4 ++--
 ...l-libxml-perl_2.0132.bb => libxml-libxml-perl_2.0134.bb} | 4 ++--
 4 files changed, 11 insertions(+), 9 deletions(-)
 rename meta-perl/recipes-extended/logcheck/{logcheck_1.3.19.bb => logcheck_1.3.20.bb} (94%)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.060.bb => libio-socket-ssl-perl_2.066.bb} (87%)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.18.bb => libnet-dns-perl_1.19.bb} (92%)
 rename meta-perl/recipes-perl/libxml/{libxml-libxml-perl_2.0132.bb => libxml-libxml-perl_2.0134.bb} (90%)

-- 
2.20.0


