Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id 9165276B7C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:28:28 +0000 (UTC)
Received: from dastp.fritz.box ([79.250.183.143]) by mail.gmx.com (mrgmx001)
	with ESMTPSA (Nemesis) id 0MOf5S-1ZQ2Je0DzS-0066t0;
	Mon, 24 Aug 2015 17:28:28 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Aug 2015 17:27:50 +0200
Message-Id: <1440430077-551-2-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
References: <1440430077-551-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:j2bO67KVbyZ2bkDAlpvHcirBp68ksW2h7AuIjGa0iZaJPEMMg9/
	WxVR62FC5SREAt2ksPHWfFA9Dkb4tEMA1VmsoY6+GMqPg712xezYPwNdQgdiSJVS2GLCTcn
	CVBWfYlQwKvRQAR1mj5WFqv9ew2bW/FNMATsz1yd3xBz0bLstkV3llFKFohHT9rBN0pPwfR
	o8uCjFvgbW0LyvX6GbwQA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:irzpbVcMOuw=:C1OvP8izMBFpRHoDtT3iQT
	qY+ZbYWgrKUeac/9V44Dh7W6g01gz7c70brx2mIDl1Mxrgb2SzzuMFRB72nJTW5huz8kCOAmD
	JhmRgLOs7QXxJ/2YKs3aQNEmm8q0+XIgczGyuLnvHl6E5IJpkl3TUttVeIf+VVSYYChHnZ5Rw
	TKwkiPDdah+hxv48Xvbh+0E8nTtQBJDDg+Hwa/PFMg3Xk8P5gm6PrWfGSUXUaPo27LEDPocq9
	uR3W1Cr3z27CFMX7EM6SiwkWo3/rmKxXRNGjPt0HR2NBnMVfMh/BZoMAZJ2p5FCZ8dRVV7V8X
	qF7RBaYA3eGd34X4N24eLAtVxdeuBIjS2J+9uKOq2T3JDWNY8Ry0/s4vJEUt7AQ0D/pgAFhJz
	dRmVbC79QPs+KYInv6tMByeEEwPF7mgP5mDYJOx0IbQm2enCSMtNzLZBfmozPeBFxs5SPEhOh
	oYS2ByTkb2a3TGPeEBmkLOhw2Vjt8UIJBN+qCFY4JZ9ffQnp9AT4UXeKUNs3xzyOjKHe76fWk
	lnUJI1y3OF6kWR21Ng31C/V+/j0KI0Nx1zb5nphq9X8hXQBHbPosE6//SBI9V3JlHLwkN2agY
	SK/HNOmr4dmFi9W8SCC8lQBoZzh5nBoeRaVCmg52F1NWeRbd1bXnekAX6xlrm7B/bmMMCEV+r
	U2mgU5vL12qZzqQqg9B4AUmlTL/9I+W3Jv2Z8jO/kAeEAtX/XcXOCHG/xFvZU5g43D5X3wbFv
	iQRWAGcHNS7rahkV0AL6Ymy776xusXvRM8Ei0w==
Subject: [meta-python][PATCH 1/8] python-cython: Upgrade 0.20.2 -> 0.23.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Aug 2015 15:28:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 .../python/{python-cython_0.20.2.bb => python-cython_0.23.1.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cython_0.20.2.bb => python-cython_0.23.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python-cython_0.20.2.bb b/meta-python/recipes-devtools/python/python-cython_0.23.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python-cython_0.20.2.bb
rename to meta-python/recipes-devtools/python/python-cython_0.23.1.bb
index 3966e0b..a0babc8 100644
--- a/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
+++ b/meta-python/recipes-devtools/python/python-cython_0.23.1.bb
@@ -10,8 +10,8 @@ BBCLASSEXTEND = "native"
 SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-SRC_URI[md5sum] = "7fc13e1c665bdf7cea19ad08906af91f"
-SRC_URI[sha256sum] = "ed13b606a2aeb5bd6c235f8ed6c9988c99d01a033d0d21d56137c13d5c7be63f"
+SRC_URI[md5sum] = "db3c5b365e1c3f71c7cd90e96473a3ab"
+SRC_URI[sha256sum] = "bdfd12d6a2a2e34b9a1bbc1af5a772cabdeedc3851703d249a52dcda8378018a"
 
 inherit setuptools
 
-- 
2.5.0


