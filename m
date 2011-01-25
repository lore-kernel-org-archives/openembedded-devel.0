Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PhlaN-0000wR-SP
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 17:17:39 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ArcEAIyGPk1bdWOb/2dsb2JhbACEE5I+jxGsJIM7AY0ngSODOHQEjCg
X-IronPort-AV: E=Sophos;i="4.60,374,1291590000"; d="scan'208";a="721343384"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 25 Jan 2011 17:16:54 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PhlZe-0005Os-DI
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 17:16:54 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim) id 1PhlZe-0004Vz-7g
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 17:16:54 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PhlZd-00044f-TG
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 17:16:53 +0100
From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
	<vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jan 2011 17:16:51 +0100
Message-Id: <cover.1295971903.git.vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.2.3
MIME-Version: 1.0
Subject: [PATCHv2 0/2] scons misc patches
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
X-List-Received-Date: Tue, 25 Jan 2011 16:17:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I order to keep the atomic nature of the git commits, I splitted in
two this change set.

The version two is based on the previous requests for the first
approach submitted to the list (move the line to a better position in
the recipe and verifying the licence of the project).

Víctor Manuel Jáquez Leal (2):
  python-scons_1.3.0: add missing dependencies
  python-scons_1.3.0: fix licence type

 recipes/python/python-scons_1.3.0.bb |   11 ++++++++++-
 1 files changed, 10 insertions(+), 1 deletions(-)

-- 
1.7.2.3



