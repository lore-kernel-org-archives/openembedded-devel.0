Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TbTIw-0007FK-4I
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Nov 2012 10:42:42 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id CB957CA8972
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2012 10:19:14 +0100 (CET)
Received: from eb-e6520.local.eukrea.com (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id ADEF64B0063;
	Thu, 22 Nov 2012 10:19:09 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Nov 2012 10:19:07 +0100
Message-Id: <1353575947-8283-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
Cc: koen@dominion.thruhere.net,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][danny][PATCH] README: update to danny
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
X-List-Received-Date: Thu, 22 Nov 2012 09:42:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-efl/README        |    8 ++++----
 meta-gpe/README        |    8 ++++----
 meta-initramfs/README  |    6 +++---
 meta-multimedia/README |    8 ++++----
 meta-networking/README |    5 ++++-
 meta-oe/README         |    6 +++---
 meta-systemd/README    |    8 ++++----
 meta-webserver/README  |    7 +++++--
 meta-xfce/README       |    8 ++++----
 toolchain-layer/README |    6 +++---
 10 files changed, 38 insertions(+), 32 deletions(-)

diff --git a/meta-efl/README b/meta-efl/README
index 62daa0a..2e3df9f 100644
--- a/meta-efl/README
+++ b/meta-efl/README
@@ -1,15 +1,15 @@
 This layer depends on:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: danny
 revision: HEAD
=20
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: danny
 revision: HEAD
=20
-Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-efl]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-efl][danny]' in the subject'
=20
-When sending single patches, please using something like 'git send-email=
 -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmet=
a-efl][PATCH'
+When sending single patches, please using something like 'git send-email=
 -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmet=
a-efl][danny][PATCH'
=20
 Interim layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
diff --git a/meta-gpe/README b/meta-gpe/README
index 220f031..f8e8255 100644
--- a/meta-gpe/README
+++ b/meta-gpe/README
@@ -1,15 +1,15 @@
 This layer depends on:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: danny
 revision: HEAD
=20
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: danny
 revision: HEAD
=20
-Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gpe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-gpe][danny]' in the subject'
=20
-When sending single patches, please using something like 'git send-email=
 -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmet=
a-gpe][PATCH'
+When sending single patches, please using something like 'git send-email=
 -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmet=
a-gpe][danny][PATCH'
=20
 Interim layer maintainer: Koen Kooi <koen@dominion.thruhere.net>
diff --git a/meta-initramfs/README b/meta-initramfs/README
index 8430555..99702d4 100644
--- a/meta-initramfs/README
+++ b/meta-initramfs/README
@@ -12,7 +12,7 @@ Dependencies
 This layer depends on:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: danny
 revision: HEAD
=20
=20
@@ -20,9 +20,9 @@ Maintenance
 -----------
=20
 Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
-with '[meta-initramfs]' in the subject.
+with '[meta-initramfs][danny]' in the subject.
=20
-When sending single patches, please using something like 'git send-email=
 -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmet=
a-initramfs][PATCH'
+When sending single patches, please using something like 'git send-email=
 -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmet=
a-initramfs][danny][PATCH'
=20
 Layer maintainers: Andrea Adami <andrea.adami@gmail.com>
                    Paul Eggleton <paul.eggleton@linux.intel.com>
diff --git a/meta-multimedia/README b/meta-multimedia/README
index 0e85179..f6008ca 100644
--- a/meta-multimedia/README
+++ b/meta-multimedia/README
@@ -1,16 +1,16 @@
 This layer depends on:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: danny
 revision: HEAD
=20
 URI: git://git.openembedded.org/meta-openembedded/meta-oe
-branch: master
+branch: danny
 revision: HEAD
=20
-Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-multimedia][danny]' in the subject'
=20
-When sending single patches, please use something like 'git send-email -=
1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmeta-=
multimedia][PATCH
+When sending single patches, please use something like 'git send-email -=
1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmeta-=
multimedia][danny][PATCH
=20
 You are encouraged to fork the mirror on github https://github.com/opene=
mbedded/meta-oe/ to share your patches, this is preferred for patch sets =
consisting of more than one patch. Other services like gitorious, repo.or=
.cz or self hosted setups are of course accepted as well, 'git fetch <rem=
ote>' works the same on all of them. We recommend github because it is fr=
ee, easy to use, has been proven to be reliable and has a really good web=
 GUI.
=20
diff --git a/meta-networking/README b/meta-networking/README
index 438f442..949d0e2 100644
--- a/meta-networking/README
+++ b/meta-networking/README
@@ -18,7 +18,7 @@ Dependencies
 This layer depends on:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: danny
 revision: HEAD
=20
 Maintenance
@@ -26,3 +26,6 @@ Maintenance
=20
 Please see the MAINTAINERS file for information on contacting the
 maintainers of this layer, as well as instructions for submitting patche=
s.=20
+
+When sending single patches, please using something like
+'git send-email -1 --to openembedded-devel@lists.openembedded.org --subj=
ect-prefix=3Dmeta-networking][danny][PATCH'
diff --git a/meta-oe/README b/meta-oe/README
index 4226c29..08ee07f 100644
--- a/meta-oe/README
+++ b/meta-oe/README
@@ -1,12 +1,12 @@
 This layer depends on:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: danny
 revision: HEAD
=20
-Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe][danny]' in the subject'
=20
-When sending single patches, please use something like 'git send-email -=
1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmeta-=
oe][PATCH'
+When sending single patches, please use something like 'git send-email -=
1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmeta-=
oe][danny][PATCH'
=20
 You are encouraged to fork the mirror on github https://github.com/opene=
mbedded/meta-oe/ to share your patches, this is preferred for patch sets =
consisting of more than one patch. Other services like gitorious, repo.or=
.cz or self hosted setups are of course accepted as well, 'git fetch <rem=
ote>' works the same on all of them. We recommend github because it is fr=
ee, easy to use, has been proven to be reliable and has a really good web=
 GUI.
=20
diff --git a/meta-systemd/README b/meta-systemd/README
index 84578b5..ad4fe5f 100644
--- a/meta-systemd/README
+++ b/meta-systemd/README
@@ -1,13 +1,13 @@
 This layer depends on:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: danny
 revision: HEAD
=20
 And we're working to break the dependency on this one:
=20
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: danny
 revision: HEAD
=20
 To make BBMASK'ing per layer possible the following directory structure =
is
@@ -15,9 +15,9 @@ used:
=20
 $[LAYERDIR}/<layer name>/recipes-<group-name>/<recipe-name>/<recipe-name=
>.bbappend
=20
-Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe][meta-systemd]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe][meta-systemd][danny]' in the subject'
=20
-When sending single patches, please use something like 'git send-email -=
1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmeta-=
oe][meta-systemd][PATCH'
+When sending single patches, please use something like 'git send-email -=
1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmeta-=
oe][meta-systemd][danny][PATCH'
=20
 You are encouraged to fork the mirror on github https://github.com/opene=
mbedded/meta-oe/ to share your patches, this is preferred for patch sets =
consisting of more than one patch. Other services like gitorious, repo.or=
.cz or self hosted setups are of course accepted as well, 'git fetch <rem=
ote>' works the same on all of them. We recommend github because it is fr=
ee, easy to use, has been proven to be reliable and has a really good web=
 GUI.
=20
diff --git a/meta-webserver/README b/meta-webserver/README
index 47136fb..83be7d2 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -12,7 +12,7 @@ Dependencies
 This layer depends on:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: danny
 revision: HEAD
=20
=20
@@ -21,7 +21,10 @@ Maintenance
 -----------
=20
 Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g
-with '[meta-webserver]' in the subject.
+with '[meta-webserver][danny]' in the subject.
+
+When sending single patches, please using something like
+'git send-email -1 --to openembedded-devel@lists.openembedded.org --subj=
ect-prefix=3Dmeta-webserver][danny][PATCH'
=20
 Layer maintainer: Paul Eggleton <paul.eggleton@linux.intel.com>
=20
diff --git a/meta-xfce/README b/meta-xfce/README
index 88f2332..6aafb4b 100644
--- a/meta-xfce/README
+++ b/meta-xfce/README
@@ -1,11 +1,11 @@
 This layer depends on:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: danny
 revision: HEAD
=20
 URI: git://git.openembedded.org/meta-openembedded
-branch: master
+branch: danny
 revision: HEAD
 meta-xfce depends on meta-oe and meta-multimedia in this repository.
=20
@@ -14,8 +14,8 @@ this to local.conf:
=20
 BBMASK =3D "meta-xfce/recipes-multimedia"
=20
-Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-xfce]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-xfce][danny]' in the subject'
=20
-When sending single patches, please using something like 'git send-email=
 -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmet=
a-xfce][PATCH'
+When sending single patches, please using something like 'git send-email=
 -1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmet=
a-xfce][danny][PATCH'
=20
 Interim layer maintainer: Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
diff --git a/toolchain-layer/README b/toolchain-layer/README
index 5996b6c..127983a 100644
--- a/toolchain-layer/README
+++ b/toolchain-layer/README
@@ -1,12 +1,12 @@
 This layer depends on:
=20
 URI: git://git.openembedded.org/openembedded-core
-branch: master
+branch: danny
 revision: HEAD
=20
-Send pull requests to openembedded-devel@lists.openembedded.org with '[m=
eta-oe][toolchain-layer]' in the subject'
+Send pull requests to openembedded-devel@lists.openembedded.org with '[t=
oolchain-layer][danny]' in the subject'
=20
-When sending single patches, please use something like 'git send-email -=
1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dmeta-=
oe][toolchain-layer][PATCH'
+When sending single patches, please use something like 'git send-email -=
1 --to openembedded-devel@lists.openembedded.org --subject-prefix=3Dtoolc=
hain-layer][danny][PATCH'
=20
 You are encouraged to fork the mirror on github https://github.com/opene=
mbedded/meta-oe/ to share your patches, this is preferred for patch sets =
consisting of more than one patch. Other services like gitorious, repo.or=
.cz or self hosted setups are of course accepted as well, 'git fetch <rem=
ote>' works the same on all of them. We recommend github because it is fr=
ee, easy to use, has been proven to be reliable and has a really good web=
 GUI.
=20
--=20
1.7.7.6



