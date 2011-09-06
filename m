Received: from 16.mo3.mail-out.ovh.net ([188.165.56.217]
	helo=mo3.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R17zW-0005fv-52
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 04:35:54 +0200
Received: from mail33.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 7085FFFB5B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2011 22:33:25 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 6 Sep 2011 22:32:19 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 6 Sep 2011 22:32:19 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
Date: Tue,  6 Sep 2011 22:32:16 +0200
Message-Id: <1315341136-25548-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6
MIME-Version: 1.0
X-Ovh-Tracer-Id: 9462907242802752841
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfedvkedrtdduucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenuc
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe] bianutils-2.20.1: fix checksums
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
X-List-Received-Date: Wed, 07 Sep 2011 02:35:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

the source archive seems to have changed on the 26 aug 2011, thus
the checksums have to be updated.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../recipes-devtools/binutils/binutils_2.20.1.bb   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb b/meta-=
oe/recipes-devtools/binutils/binutils_2.20.1.bb
index 2558bda..cfceab3 100644
--- a/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
+++ b/meta-oe/recipes-devtools/binutils/binutils_2.20.1.bb
@@ -36,7 +36,7 @@ SRC_URI =3D "\
      file://202_elflink_noaddneeded_vs_weak.patch \
      "
=20
-SRC_URI[md5sum] =3D "9cdfb9d6ec0578c166d3beae5e15c4e5"
-SRC_URI[sha256sum] =3D "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53=
df906498afe6f6f8"
+SRC_URI[md5sum] =3D "2b9dc8f2b7dbd5ec5992c6e29de0b764"
+SRC_URI[sha256sum] =3D "71d37c96451333c5c0b84b170169fdcb138bbb27397dc062=
81905d9717c8ed64"
=20
 BBCLASSEXTEND =3D "native"
--=20
1.7.6



