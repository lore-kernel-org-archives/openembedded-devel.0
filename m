Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1R1cHv-00080u-Gm
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Sep 2011 12:56:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 336343153D87;
	Thu,  8 Sep 2011 12:43:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ixvNsdZN3b1Z; Thu,  8 Sep 2011 12:43:51 +0200 (CEST)
Received: from pepe.dream-property.nete (dreamboxupdate.com [82.149.226.174])
	by mail.dream-property.net (Postfix) with SMTP id 3946B31538FE;
	Thu,  8 Sep 2011 12:43:50 +0200 (CEST)
Received: by pepe.dream-property.nete (sSMTP sendmail emulation);
	Thu, 08 Sep 2011 10:43:50 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Sep 2011 10:43:50 +0000
Message-Id: <cover.1315478126.git.obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.5
Cc: tom_rini@mentor.com
Subject: [2011.03-maintenance] libdca build fix
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
X-List-Received-Date: Thu, 08 Sep 2011 10:56:55 -0000

Hi Tom,

please apply this build fix, which was cherry-picked from master
4f4ed88bc7caa3d2b0b44ae2f51907aa9e68fc1b.

The following changes since commit bc8ddbf7944f82383936d88379619aa46c3954a2:

  binutils-2.18: fix checksums (2011-09-05 17:43:27 +0200)

are available in the git repository at:
  git://git.opendreambox.org/git/obi/openembedded.git 2011.03-maintenance
  http://cgit.opendreambox.org/obi/openembedded.git/log/?h=2011.03-maintenance

Andreas Oberritter (1):
  libdca: fix sed failing on unpack

 recipes/libdca/libdca_0.0.5-3.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.2.5



