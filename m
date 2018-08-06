Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C34797199E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 10:39:10 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w76AdAro028700
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Aug 2018 03:39:11 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Mon, 06 Aug 2018 03:39:10 -0700
From: Kai Kang <kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Aug 2018 03:39:02 -0700
Message-Id: <20180806103907.37227-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-perl][PATCH 0/5] Upgrade packages in layer meta-perl
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
X-List-Received-Date: Mon, 06 Aug 2018 10:39:10 -0000


Kai Kang (5):
  adduser: 3.116 -> 3.117
  libnet-dns-perl: 1.14 -> 1.17
  libnet-ssleay-perl: 1.84 -> 1.85
  libio-socket-ssl-perl: 2.054 -> 2.508
  logcheck: 1.3.18 -> 1.3.19

 .../logcheck/{logcheck_1.3.18.bb => logcheck_1.3.19.bb}           | 7 +++----
 .../recipes-perl/adduser/{adduser_3.116.bb => adduser_3.117.bb}   | 6 ++----
 ...io-socket-ssl-perl_2.054.bb => libio-socket-ssl-perl_2.058.bb} | 4 ++--
 .../libnet/{libnet-dns-perl_1.14.bb => libnet-dns-perl_1.17.bb}   | 8 ++++----
 .../{libnet-ssleay-perl_1.84.bb => libnet-ssleay-perl_1.85.bb}    | 4 ++--
 5 files changed, 13 insertions(+), 16 deletions(-)
 rename meta-perl/recipes-extended/logcheck/{logcheck_1.3.18.bb => logcheck_1.3.19.bb} (92%)
 rename meta-perl/recipes-perl/adduser/{adduser_3.116.bb => adduser_3.117.bb} (91%)
 rename meta-perl/recipes-perl/libio/{libio-socket-ssl-perl_2.054.bb => libio-socket-ssl-perl_2.058.bb} (91%)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.14.bb => libnet-dns-perl_1.17.bb} (68%)
 rename meta-perl/recipes-perl/libnet/{libnet-ssleay-perl_1.84.bb => libnet-ssleay-perl_1.85.bb} (90%)

-- 
2.11.0


