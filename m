Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Aws.Ismail@windriver.com>) id 1U4zvS-0003mO-CC
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2013 21:24:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1BIMI9e003125
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Feb 2013 10:22:18 -0800 (PST)
Received: from localhost.localdomain (128.224.147.212) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.318.4; Mon, 11 Feb 2013 10:22:17 -0800
From: Aws Ismail <aws.ismail@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 11 Feb 2013 13:16:17 -0500
Message-ID: <1360606580-27697-1-git-send-email-aws.ismail@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com
Subject: [meta-networking][PATCH 0/3] multilib fixes for some networking recipes
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
X-List-Received-Date: Mon, 11 Feb 2013 20:24:45 -0000
Content-Type: text/plain


Aws Ismail (3):
  traceroute: resolve multilib issues
  netcat-openbsd: resolve multilib issues.
  accel-ppp: resolve QA warnings and satisfy multilib

 .../recipes-protocols/accel-ppp/accel-ppp_git.bb   |    7 +++++++
 .../recipes-support/netcat/netcat-openbsd_1.89.bb  |    6 +++---
 .../traceroute/traceroute_2.0.18.bb                |    8 +++++---
 3 files changed, 15 insertions(+), 6 deletions(-)



