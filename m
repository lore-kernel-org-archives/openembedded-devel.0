Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B545565C7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 01:45:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0Q1jAFg003178
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2015 17:45:10 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 25 Jan 2015 17:45:10 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 25 Jan 2015 17:45:04 -0800
Message-ID: <cover.1422236615.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/5] 5 fixes
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
X-List-Received-Date: Mon, 26 Jan 2015 01:45:11 -0000
Content-Type: text/plain

The following changes since commit ddd3ccd63949f9a24040eb39c136ef9730f2662a:

  ntp: fix perl path (2015-01-23 07:45:20 -0500)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib rbt/5fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=rbt/5fixes

Robert Yang (5):
  openldap: fix for new libtool
  dnssec-conf: depends libxslt-native
  nuttcp: fix HOMEPAGE and SRC_URI
  wireshark: add PACKAGECONFIG for geoip
  cherokee: add PACKAGECONFIG for geoip

 .../dnssec-conf/dnssec-conf_2.02.bb                |    3 ++-
 .../recipes-support/nuttcp/nuttcp_7.2.1.bb         |    6 +++---
 .../recipes-support/wireshark/wireshark_1.12.2.bb  |    1 +
 .../recipes-support/openldap/openldap_2.4.39.bb    |    2 +-
 .../recipes-httpd/cherokee/cherokee_1.2.98.bb      |    1 +
 5 files changed, 8 insertions(+), 5 deletions(-)

-- 
1.7.9.5


