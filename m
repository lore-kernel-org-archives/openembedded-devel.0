Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RLOFr-0002YS-RH
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Nov 2011 01:00:32 +0100
Received: (qmail invoked by alias); 01 Nov 2011 23:54:21 -0000
Received: from p5B0A3AE4.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.58.228]
	by mail.gmx.net (mp006) with SMTP; 02 Nov 2011 00:54:21 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18zBwsQMGwzLyuWsY9DriwdsiC441R3Uh/SMcje+q
	gfrwbR8FqV3yV4
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Nov 2011 00:58:51 +0100
Message-Id: <1320191933-28392-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe][V2 0/2] Fix QA warnings for unpacked files
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
X-List-Received-Date: Wed, 02 Nov 2011 00:00:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

v1 -> v2:
* Combine two patches [1]/[2] into a patch series
* imagemagick: change commit message
* mime.bbclass: was gnome-control-center: fix unshipped packages

Andreas Müller (2):
  imagemagick: fix QA warnings for unshipped files
  mime.bbclass: Add --disable-update-mimedb to EXTRA_OECONF

 meta-oe/classes/mime.bbclass                       |    2 ++
 .../imagemagick/imagemagick_6.4.4.bb               |   14 +++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
1.7.4.4



