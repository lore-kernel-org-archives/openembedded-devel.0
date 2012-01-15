Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RmTHw-0002Fa-7l
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 17:50:36 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 5C6F0A64DD;
	Sun, 15 Jan 2012 17:42:59 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Jan 2012 17:42:48 +0100
Message-Id: <1326645768-13447-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.5
In-Reply-To: <1326645768-13447-1-git-send-email-eric@eukrea.com>
References: <1326645768-13447-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [meta-java 2/2] README: add a note concerning libstdc++-static
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
X-List-Received-Date: Sun, 15 Jan 2012 16:50:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

which is required for icedtea6-native

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 README |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/README b/README
index 926e5bf..803b4de 100644
--- a/README
+++ b/README
@@ -18,6 +18,8 @@ PREFERRED_VERSION_cacaoh-native =3D "0.99.3"
 PREFERRED_VERSION_openjdk-6-jre =3D "6b18-1.8.11"
 PREFERRED_VERSION_icedtea6-native =3D "1.8.11"
=20
+Please note that libstdc++ static is needed on your host to compile iced=
tea6-native
+(install libstdc++-static on a Fedora).
=20
 Send pull requests to openembedded-devel@lists.openembedded.org
=20
--=20
1.7.7.5



