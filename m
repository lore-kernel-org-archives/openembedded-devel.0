Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1SU3po-0005jY-IW
	for openembedded-devel@openembedded.org; Tue, 15 May 2012 00:33:44 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id C345DEA040
	for <openembedded-devel@openembedded.org>;
	Tue, 15 May 2012 00:15:39 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 444B064387; Tue, 15 May 2012 00:03:21 +0200 (CEST)
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Date: Tue, 15 May 2012 00:03:08 +0200
Message-Id: <1337032989-28606-1-git-send-email-apelete@seketeli.net>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/1] Update package SRC_URI
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
X-List-Received-Date: Mon, 14 May 2012 22:33:44 -0000

Hello,

The attached patch updates the SRC_URI since the original kernel.org
URI is no longer valid. The patch is targeted at oe-classic.

Apelete Seketeli (1):
  util-linux-ng: Update SRC_URI to kernel.org valid URI

 util-linux-ng.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



