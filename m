Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1RUzxs-00047B-U7
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Nov 2011 13:05:41 +0100
Received: by localhost (Postfix, from userid 1000)
	id 6C10B449275; Mon, 28 Nov 2011 12:59:03 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2011 12:58:59 +0100
Message-Id: <1322481540-26151-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <4ED376D1.9010701@dresearch-fe.de>
References: <4ED376D1.9010701@dresearch-fe.de>
Cc: paulepanter@users.sourceforge.net
Subject: [PATCH v2] update live555 version
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
X-List-Received-Date: Mon, 28 Nov 2011 12:05:41 -0000

Steffen Sledz (1):
  live555: replace version 20110314 with 20111120

 recipes/live555/live555_20110314.bb |    8 --------
 recipes/live555/live555_20111120.bb |    7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)
 delete mode 100644 recipes/live555/live555_20110314.bb
 create mode 100644 recipes/live555/live555_20111120.bb

-- 
1.7.7



