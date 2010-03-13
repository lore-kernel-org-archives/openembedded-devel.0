Received: from smtprelay-h11.telenor.se ([62.127.194.4])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1NqWbB-0008Mt-WB
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 20:02:10 +0100
Received: from ipb2.telenor.se (ipb2.telenor.se [195.54.127.165])
	by smtprelay-h11.telenor.se (Postfix) with ESMTP id 9845E440FB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Mar 2010 19:59:12 +0100 (CET)
X-SMTPAUTH-B2: 
X-SENDER-IP: 83.227.59.242
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Aoc6AMRvm0tT4zvyPGdsb2JhbACHYZMPDAEBAQE3LaxEjH6EewQ
X-IronPort-AV: E=Sophos;i="4.49,633,1262559600"; d="scan'208";a="49674402"
Received: from c-f23be353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	localhost.localdomain) ([83.227.59.242])
	by ipb2.telenor.se with ESMTP; 13 Mar 2010 19:59:09 +0100
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Mar 2010 19:59:08 +0100
Message-Id: <1268506748-18802-2-git-send-email-ulf.samuelsson@atmel.com>
X-Mailer: git-send-email 1.6.0.2
In-Reply-To: <1268506748-18802-1-git-send-email-ulf.samuelsson@atmel.com>
References: <1268506748-18802-1-git-send-email-ulf.samuelsson@atmel.com>
X-SA-Exim-Connect-IP: 62.127.194.4
X-SA-Exim-Mail-From: ulf.samuelsson@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Subject: [PATCH v3 2/2] multimedia: Media contents (currently empty)
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
X-List-Received-Date: Sat, 13 Mar 2010 19:02:10 -0000

This patch creates the file "multimedia.tar.bz2." containing the
default media to be copied to "/usr/share/multimedia"
(Note the dot at the end of the filename)
By replacing this file with your own, you can easily add
multimedia files to your file system for a demo.

Patch can be applied by
$ hg init
$ hg import --no-commit -f <patch>

"hg" is part of the "mercurial" package

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>
---
 recipes/multimedia/files/multimedia.tar.bz2. |  Bin 0 -> 118 bytes
 1 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 recipes/multimedia/files/multimedia.tar.bz2.

diff --git a/recipes/multimedia/files/multimedia.tar.bz2. b/recipes/multimedia/files/multimedia.tar.bz2.
new file mode 100644
index 0000000000000000000000000000000000000000..09d719c63e6aa4afafce68e4bd6131e1a484537a
GIT binary patch
literal 118
zcmV-+0Ez!XT4*^jL0KkKS(4QIK>z?-dw{@z03bjCe}DiGV+LLz1PCAibrDVIr<61U
z(g&0hL?8j6G-*F=sE|@fLNkjR-2x^Ik_Ts_))SHl@W5~jiU45mLa9=&!C73{3N630
Y^gyx_&QUp?$p_-@NT&)C5?Y^VAXlj?#Q*>R

literal 0
HcmV?d00001

-- 
1.6.0.2



