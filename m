Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2arm-0000U1-Ua
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:39 +0200
Received: by an-out-0708.google.com with SMTP id b6so1008350ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=3oJcDG1OQDiaSW6sc3Iqlkii+q0XbijHx14Ouo7iukI=;
	b=YUTPgrK9nPFWE7c4rOpfp41giq2C4JxAhLPSNcqaIaJjVmfh6264fnYedh+p7g94NW
	3VtlVfjfjWACYhGCDE/Yp0ePZdYAhdglQ2aFka3C/B5VFSwqeV/2AnoA4kDfmi44O5LC
	qy2+AsXUrKHQuprULq95KwA6sAXsYYsRvqySM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=noUbth6j4KAxtNHQo7RFkNsyyp+JVtA+mw5lxfxHp4sPDNuHaL95hIT5r9ula/UQOw
	iVNaj+SfVdvThQXJTllpRVqLEPP+DiHErc1iOkE3j44crwsxKenZWscEhGBUMY5B6Ue9
	XsBfZ5JwCX1uigXAA/3/lGRk5XFJccr6yFZ30=
Received: by 10.100.126.19 with SMTP id y19mr9519354anc.100.1241830222223;
	Fri, 08 May 2009 17:50:22 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 8sm822914ywg.53.2009.05.08.17.50.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:20 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 09B6A6101A9; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:34 -0300
Message-Id: <1241830239-5594-19-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-18-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-6-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-7-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-8-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-9-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-10-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-11-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-12-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-13-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-14-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-15-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-16-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-17-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-18-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 18/23] Fixed indentation for Python code
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
X-List-Received-Date: Sat, 09 May 2009 00:56:39 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

 - recipes/boost/boost-36.inc
 - recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
 - recipes/gstreamer/gst-plugins-ugly_0.10.10.bb

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/boost/boost-36.inc                       |   22 +++++++++++-----------
 recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb |    8 ++++----
 recipes/gstreamer/gst-plugins-ugly_0.10.10.bb    |    8 ++++----
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/recipes/boost/boost-36.inc b/recipes/boost/boost-36.inc
index 5a4faaf..4bd065f 100644
--- a/recipes/boost/boost-36.inc
+++ b/recipes/boost/boost-36.inc
@@ -43,18 +43,18 @@ S = "${WORKDIR}/${BOOST_P}"
 # Make a package for each library, plus -dev
 PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
 python __anonymous () {
-	import bb
-
-	packages = []
-	extras = [] 
-	for lib in bb.data.getVar('BOOST_LIBS', d, 1).split( ):
-		pkg = "boost-%s" % lib.replace("_", "-")
-		extras.append("--with-%s" % lib)
-		packages.append(pkg)
-		if not bb.data.getVar("FILES_%s" % pkg, d, 1):
-			bb.data.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so*" % lib, d)
-	bb.data.setVar("BOOST_PACKAGES", " ".join(packages), d)
-	bb.data.setVar("BJAM_EXTRA", " ".join(extras), d)
+    import bb
+
+    packages = []
+    extras = []
+    for lib in bb.data.getVar('BOOST_LIBS', d, 1).split( ):
+            pkg = "boost-%s" % lib.replace("_", "-")
+            extras.append("--with-%s" % lib)
+            packages.append(pkg)
+            if not bb.data.getVar("FILES_%s" % pkg, d, 1):
+                    bb.data.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so*" % lib, d)
+    bb.data.setVar("BOOST_PACKAGES", " ".join(packages), d)
+    bb.data.setVar("BJAM_EXTRA", " ".join(extras), d)
 }
 
 # Override the contents of specific packages
diff --git a/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb b/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
index 77c4184..545a43a 100644
--- a/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
+++ b/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
@@ -10,8 +10,8 @@ SRC_URI = "\
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
 python() {
-	# Don't build, if we are building an ENTERPRISE distro
-	enterprise = bb.data.getVar("ENTERPRISE_DISTRO", d, 1)
-	if enterprise != "1":
-		raise bb.parse.SkipPackage("gst-plugins-ugly-sid will only build if ENTERPRISE_DISTRO == 1")
+    # Don't build, if we are building an ENTERPRISE distro
+    enterprise = bb.data.getVar("ENTERPRISE_DISTRO", d, 1)
+    if enterprise != "1":
+            raise bb.parse.SkipPackage("gst-plugins-ugly-sid will only build if ENTERPRISE_DISTRO == 1")
 }
diff --git a/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb b/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
index 0678e22..49350ed 100644
--- a/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
+++ b/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
@@ -10,9 +10,9 @@ SRC_URI += "\
 "
 
 python() {
-	# Don't build, if we are building an ENTERPRISE distro
-	enterprise = bb.data.getVar("ENTERPRISE_DISTRO", d, 1)
-	if enterprise == "1":
-		raise bb.parse.SkipPackage("gst-plugins-ugly will only build if ENTERPRISE_DISTRO != 1")
+    # Don't build, if we are building an ENTERPRISE distro
+    enterprise = bb.data.getVar("ENTERPRISE_DISTRO", d, 1)
+    if enterprise == "1":
+            raise bb.parse.SkipPackage("gst-plugins-ugly will only build if ENTERPRISE_DISTRO != 1")
 }
 
-- 
1.6.3.rc1.51.gea0b7



