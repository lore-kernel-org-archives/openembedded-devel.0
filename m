Received: from [62.2.86.239] (helo=a.mx.bitcloner.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <betheg@bitcloner.org>) id 1N8GPV-0002qi-Eh
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 17:51:12 +0100
Received: from p5b2ccb6b.dip.t-dialin.net ([91.44.203.107] helo=127.0.0.1)
	by a.mx.bitcloner.org with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <betheg@bitcloner.org>)
	id 1N8GIA-0005dm-0z for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 17:43:34 +0100
From: Michael Kurz <betheg@bitcloner.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Nov 2009 17:41:44 +0100
Message-Id: <1257957707-31349-1-git-send-email-betheg@bitcloner.org>
X-Mailer: git-send-email 1.6.5.2
X-SA-Exim-Connect-IP: 62.2.86.239
X-SA-Exim-Mail-From: betheg@bitcloner.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 0/3] tzdata fix and update version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Nov 2009 16:51:12 -0000

Michael Kurz (3):
  tzdata.inc: install iso3166.tab and zone.tab
  tzdata: update to version 2009r
  checksums.ini: add entry for tzdata2009r

 conf/checksums.ini             |    4 ++++
 recipes/tzdata/tzdata.inc      |    3 +++
 recipes/tzdata/tzdata_2009r.bb |    3 +++
 3 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 recipes/tzdata/tzdata_2009r.bb



