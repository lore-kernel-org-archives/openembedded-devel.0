Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 2388 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 10 Aug 2019 22:00:37 UTC
Received: from 9.mo69.mail-out.ovh.net (9.mo69.mail-out.ovh.net [46.105.56.78])
	by mail.openembedded.org (Postfix) with ESMTP id 984356C45D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 22:00:37 +0000 (UTC)
Received: from player750.ha.ovh.net (unknown [10.108.54.13])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 846C962CB1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Aug 2019 23:20:49 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id 262658DD8AD9;
	Sat, 10 Aug 2019 21:20:44 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 10 Aug 2019 23:20:11 +0200
Message-Id: <20190810212014.23197-4-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
References: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 3832844761375911496
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudduledgudeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [meta-python][PATCH 4/7] python-socketio: upgrade to 4.3.1
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
X-List-Received-Date: Sat, 10 Aug 2019 22:00:37 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 .../python/{python-socketio_4.0.0.bb => python-socketio_4.3.1.bb} | 0
 .../{python3-socketio_4.0.0.bb => python3-socketio_4.3.1.bb}      | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-python/recipes-devtools/python/{python-socketio_4.0.0.bb => python-socketio_4.3.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-socketio_4.0.0.bb => python3-socketio_4.3.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-socketio_4.0.0.bb b/meta-python/recipes-devtools/python/python-socketio_4.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-socketio_4.0.0.bb
rename to meta-python/recipes-devtools/python/python-socketio_4.3.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.0.0.bb b/meta-python/recipes-devtools/python/python3-socketio_4.3.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-socketio_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_4.3.1.bb
-- 
2.20.1


