Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 751 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 10 Aug 2019 21:39:45 UTC
Received: from 1.mo179.mail-out.ovh.net (1.mo179.mail-out.ovh.net
	[178.33.111.220])
	by mail.openembedded.org (Postfix) with ESMTP id 638ED7C377
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 21:39:45 +0000 (UTC)
Received: from player750.ha.ovh.net (unknown [10.109.160.244])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 248C813D7A8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 23:20:44 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id B45708DD8ACA;
	Sat, 10 Aug 2019 21:20:40 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Aug 2019 23:20:10 +0200
Message-Id: <20190810212014.23197-3-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
References: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3831437386168610376
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudduledgudeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [meta-python][PATCH 3/7] python-engineio: upgrade to 3.9.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 10 Aug 2019 21:39:45 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../python/{python-engineio_3.5.0.bb => python-engineio_3.9.3.bb} | 0
 .../{python3-engineio_3.5.0.bb => python3-engineio_3.9.3.bb}      | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-python/recipes-devtools/python/{python-engineio_3.5.0.bb => python-engineio_3.9.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-engineio_3.5.0.bb => python3-engineio_3.9.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-engineio_3.5.0.bb b/meta-python/recipes-devtools/python/python-engineio_3.9.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-engineio_3.5.0.bb
rename to meta-python/recipes-devtools/python/python-engineio_3.9.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.5.0.bb b/meta-python/recipes-devtools/python/python3-engineio_3.9.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-engineio_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-engineio_3.9.3.bb
-- 
2.20.1


