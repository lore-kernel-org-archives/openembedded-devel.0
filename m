Received: from seketeli.net ([91.121.166.71] helo=ms.seketeli.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <apelete@seketeli.net>) id 1Sh5LZ-000274-KL
	for openembedded-devel@openembedded.org; Tue, 19 Jun 2012 22:48:21 +0200
Received: from localhost (unknown [109.190.26.176])
	by ms.seketeli.net (Postfix) with ESMTP id 1B476EA040;
	Tue, 19 Jun 2012 22:45:21 +0200 (CEST)
Received: by localhost (Postfix, from userid 1000)
	id 1D50F604DE; Tue, 19 Jun 2012 22:37:39 +0200 (CEST)
Date: Tue, 19 Jun 2012 22:37:39 +0200
From: Apelete Seketeli <apelete@seketeli.net>
To: openembedded-devel@openembedded.org
Message-ID: <20120619203738.GD4845@hermes>
References: <1340055995-14534-1-git-send-email-apelete@seketeli.net>
	<1340055995-14534-3-git-send-email-apelete@seketeli.net>
MIME-Version: 1.0
In-Reply-To: <1340055995-14534-3-git-send-email-apelete@seketeli.net>
X-Operating-System: Debian GNU/Linux wheezy/sid
X-URL: http://www.seketeli.net/~apelete
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Subject: [oe-classic][udev][PATCH v2 0/2] Update recipe SRC_URI
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
X-List-Received-Date: Tue, 19 Jun 2012 20:48:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

The attached patches update the SRC_UI of both acl and attr recipes,
since the mirror.its.uidaho.edu repository seems to be down.
The patches are intended for oe-classic.

v2 replaces malformed v1 patch.

Apelete Seketeli (2):
  udev: Update acl recipe SRC_URI
  udev: Update attr recipe SRC_URI

 recipes/udev/acl_2.2.49.bb  |    2 +-
 recipes/udev/attr_2.4.44.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.10


-- 
        Apelete


