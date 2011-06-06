Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QThKm-0000IY-QE
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 23:27:40 +0200
Received: (qmail invoked by alias); 06 Jun 2011 21:24:24 -0000
Received: from p5B0A3086.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.48.134]
	by mail.gmx.net (mp013) with SMTP; 06 Jun 2011 23:24:24 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18+RmgGBzE+8mzcgBVHv1MpK3IY4urrw4AZIdDZpW
	UGsvNz8LiENmiL
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jun 2011 23:25:43 +0200
Message-Id: <1307395545-3738-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [PATCH v2 0/2] mx28evk: correct settings to make machine work
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
X-List-Received-Date: Mon, 06 Jun 2011 21:27:40 -0000

Changes to V1:

* changed commit messages
* split patch

Andreas Mueller (2):
  mx28 SOC: set correct addresses for u-boot
  mx28evk: set valid console

 conf/machine/include/imx28.inc |    4 ++--
 conf/machine/mx28evk.conf      |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.4.4



