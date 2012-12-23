Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkno-0000lg-9b
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:37:12 +0100
Received: by mail-ee0-f42.google.com with SMTP id c41so3255547eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=ywxqWVx90QYTc/rbHdmWlweIdqScmzskJCGw4zNvdko=;
	b=wOD9unt9V7LUwX/8t5a00AidzUUdUjSx6QEtPNcnPXQ7zIYADQ7KcCXJm/f2o/ctSW
	es3gywn7KOF68jvxnxvVq8VgdvUZJU3FFfy7tc7m0ri+YD5W38pMnqonbnoRThaK7/8n
	qJtVf4Ah9obyXsEyYtDL4xOF1Ac1l16vF54E6vHBXMjMORME0iVdNKmPCRylcyHAWHZG
	xd6YyftOcU+4gCS6a5CEJPiFGiIUGGFINgjdQwqfYni93x/iMi2IsWXdoBof8M/nY1LZ
	w0GQdB0BOIEYaBlWWw/KfMAZ10UQPxs4Br9oRyxxK7UmRlsp8im/lUtPM/66Zznsn6Zl
	/2DQ==
X-Received: by 10.14.216.70 with SMTP id f46mr48041869eep.12.1356265344013;
	Sun, 23 Dec 2012 04:22:24 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id w3sm34605600eel.17.2012.12.23.04.22.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:22:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:28 +0100
Message-Id: <9ec6dd3dc8d8bc9e3cf6003d03b7b3e4e3dc6409.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/30] meta-efl: update efl svn recipes PV to 1.7.4+svnr
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
X-List-Received-Date: Sun, 23 Dec 2012 12:37:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/conf/distro/include/efl-from-svn-recipes.inc | 2 +-
 meta-efl/recipes-efl/efl/ecore_svn.bb                 | 2 +-
 meta-efl/recipes-efl/efl/edbus_svn.bb                 | 2 +-
 meta-efl/recipes-efl/efl/edje_svn.bb                  | 2 +-
 meta-efl/recipes-efl/efl/eet_svn.bb                   | 2 +-
 meta-efl/recipes-efl/efl/eeze_svn.bb                  | 2 +-
 meta-efl/recipes-efl/efl/efreet_svn.bb                | 2 +-
 meta-efl/recipes-efl/efl/eina_svn.bb                  | 2 +-
 meta-efl/recipes-efl/efl/eio_svn.bb                   | 2 +-
 meta-efl/recipes-efl/efl/elementary_svn.bb            | 2 +-
 meta-efl/recipes-efl/efl/embryo_svn.bb                | 2 +-
 meta-efl/recipes-efl/efl/emotion_svn.bb               | 2 +-
 meta-efl/recipes-efl/efl/ethumb_svn.bb                | 2 +-
 meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb  | 2 +-
 meta-efl/recipes-efl/efl/evas_svn.bb                  | 2 +-
 meta-efl/recipes-efl/efl/expedite_svn.bb              | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
index ade5b80..05dac91 100644
--- a/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
+++ b/meta-efl/conf/distro/include/efl-from-svn-recipes.inc
@@ -1,4 +1,4 @@
-EFL_PREFERRED_VERSION ?= "1.7.1+svn%"
+EFL_PREFERRED_VERSION ?= "1.7.4+svn%"
 EFL_PREFERRED_PYTHON_VERSION ?= "1.7.0+svn%"
 
 PREFERRED_VERSION_ecore ?= "${EFL_PREFERRED_VERSION}"
diff --git a/meta-efl/recipes-efl/efl/ecore_svn.bb b/meta-efl/recipes-efl/efl/ecore_svn.bb
index 2059626..945cfad 100644
--- a/meta-efl/recipes-efl/efl/ecore_svn.bb
+++ b/meta-efl/recipes-efl/efl/ecore_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/edbus_svn.bb b/meta-efl/recipes-efl/efl/edbus_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/edbus_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/edje_svn.bb b/meta-efl/recipes-efl/efl/edje_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/edje_svn.bb
+++ b/meta-efl/recipes-efl/efl/edje_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eet_svn.bb b/meta-efl/recipes-efl/efl/eet_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/eet_svn.bb
+++ b/meta-efl/recipes-efl/efl/eet_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eeze_svn.bb b/meta-efl/recipes-efl/efl/eeze_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/eeze_svn.bb
+++ b/meta-efl/recipes-efl/efl/eeze_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/efreet_svn.bb b/meta-efl/recipes-efl/efl/efreet_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/efreet_svn.bb
+++ b/meta-efl/recipes-efl/efl/efreet_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eina_svn.bb b/meta-efl/recipes-efl/efl/eina_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/eina_svn.bb
+++ b/meta-efl/recipes-efl/efl/eina_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/eio_svn.bb b/meta-efl/recipes-efl/efl/eio_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/eio_svn.bb
+++ b/meta-efl/recipes-efl/efl/eio_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/embryo_svn.bb b/meta-efl/recipes-efl/efl/embryo_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/embryo_svn.bb
+++ b/meta-efl/recipes-efl/efl/embryo_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/emotion_svn.bb b/meta-efl/recipes-efl/efl/emotion_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/emotion_svn.bb
+++ b/meta-efl/recipes-efl/efl/emotion_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/ethumb_svn.bb b/meta-efl/recipes-efl/efl/ethumb_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/ethumb_svn.bb
+++ b/meta-efl/recipes-efl/efl/ethumb_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/evas_svn.bb b/meta-efl/recipes-efl/efl/evas_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/evas_svn.bb
+++ b/meta-efl/recipes-efl/efl/evas_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/meta-efl/recipes-efl/efl/expedite_svn.bb b/meta-efl/recipes-efl/efl/expedite_svn.bb
index 78730be..95d8e02 100644
--- a/meta-efl/recipes-efl/efl/expedite_svn.bb
+++ b/meta-efl/recipes-efl/efl/expedite_svn.bb
@@ -1,7 +1,7 @@
 require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
-PV = "1.7.1+svnr${SRCPV}"
+PV = "1.7.4+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.8.0.2



