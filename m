Received: from [72.14.220.157] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JEXy5-000632-4t
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2008 23:39:45 +0100
Received: by fg-out-1718.google.com with SMTP id 22so2163165fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jan 2008 14:39:44 -0800 (PST)
Received: by 10.86.89.4 with SMTP id m4mr6622431fgb.45.1200343594091;
	Mon, 14 Jan 2008 12:46:34 -0800 (PST)
Received: from widy.lan ( [194.79.8.36])
	by mx.google.com with ESMTPS id 12sm9817290fks.12.2008.01.14.12.46.32
	(version=SSLv3 cipher=OTHER); Mon, 14 Jan 2008 12:46:33 -0800 (PST)
Date: Mon, 14 Jan 2008 22:54:20 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1293838974.20080114225420@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <E1JDrCF-0008B9-Pj@linuxtogo.org>
References: <E1JDrCF-0008B9-Pj@linuxtogo.org>
MIME-Version: 1.0
Subject: [oe-commits] org.oe.dev add asterisk sound files for 1.4 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2008 22:39:45 -0000
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 8bit

We cannot have a separate dir for each recipe out there - we already
have them beyond manageability and people start to talk about
introducing additional structure into OE tree.

But recipes like these for quite some time usually being put into main
app's dir, so all these rather belong to packages/asterisk/ too.

This is a forwarded message
From: osas commit <openembedded-commits@lists.openembedded.org>
To: openembedded-commits@lists.openembedded.org
Date: Sunday, January 13, 2008, 2:59:31 AM
Subject: [oe-commits] org.oe.dev add asterisk sound files for 1.4 version

===8<==============Original message text===============
add asterisk sound files for 1.4 version

Author: osas@nslu2-linux.org
Branch: org.openembedded.dev
Revision: e487928e64a695ad063abe44cac31763dbb95e9c
ViewMTN: http://monotone.openembedded.org/revision/info/e487928e64a695ad063abe44cac31763dbb95e9c
Files:
1
packages/asterisk-core-sounds-en-alaw
packages/asterisk-core-sounds-en-g729
packages/asterisk-core-sounds-en-gsm
packages/asterisk-core-sounds-en-ulaw
packages/asterisk-extra-sounds-en-alaw
packages/asterisk-extra-sounds-en-g729
packages/asterisk-extra-sounds-en-gsm
packages/asterisk-extra-sounds-en-ulaw
packages/asterisk-moh-freeplay-alaw
packages/asterisk-moh-freeplay-g729
packages/asterisk-moh-freeplay-gsm
packages/asterisk-moh-freeplay-ulaw
packages/asterisk-core-sounds-en-alaw/asterisk-core-sounds-en-alaw_1.4.7.bb
packages/asterisk-core-sounds-en-g729/asterisk-core-sounds-en-g729_1.4.7.bb
packages/asterisk-core-sounds-en-gsm/asterisk-core-sounds-en-gsm_1.4.7.bb
packages/asterisk-core-sounds-en-ulaw/asterisk-core-sounds-en-ulaw_1.4.7.bb
packages/asterisk-extra-sounds-en-alaw/asterisk-extra-sounds-en-alaw_1.4.6.bb
packages/asterisk-extra-sounds-en-g729/asterisk-extra-sounds-en-g729_1.4.6.bb
packages/asterisk-extra-sounds-en-gsm/asterisk-extra-sounds-en-gsm_1.4.6.bb
packages/asterisk-extra-sounds-en-ulaw/asterisk-extra-sounds-en-ulaw_1.4.6.bb
packages/asterisk-moh-freeplay-alaw/asterisk-moh-freeplay-alaw_0.0.0.bb
packages/asterisk-moh-freeplay-g729/asterisk-moh-freeplay-g729_0.0.0.bb
packages/asterisk-moh-freeplay-gsm/asterisk-moh-freeplay-gsm_0.0.0.bb
packages/asterisk-moh-freeplay-ulaw/asterisk-moh-freeplay-ulaw_0.0.0.bb
Diffs:

#
# mt diff -r6ba62f12da9c22b26c9140edcee9774e1adaad27 -re487928e64a695ad063abe44cac31763dbb95e9c
#
# 
# 
# add_dir "packages/asterisk-core-sounds-en-alaw"
# 
# add_dir "packages/asterisk-core-sounds-en-g729"
# 
# add_dir "packages/asterisk-core-sounds-en-gsm"
# 
# add_dir "packages/asterisk-core-sounds-en-ulaw"
# 
# add_dir "packages/asterisk-extra-sounds-en-alaw"
# 
# add_dir "packages/asterisk-extra-sounds-en-g729"
# 
# add_dir "packages/asterisk-extra-sounds-en-gsm"
# 
# add_dir "packages/asterisk-extra-sounds-en-ulaw"
# 
# add_dir "packages/asterisk-moh-freeplay-alaw"
# 
# add_dir "packages/asterisk-moh-freeplay-g729"
# 
# add_dir "packages/asterisk-moh-freeplay-gsm"
# 
# add_dir "packages/asterisk-moh-freeplay-ulaw"
# 
# add_file "packages/asterisk-core-sounds-en-alaw/asterisk-core-sounds-en-alaw_1.4.7.bb"
#  content [5937b70427319f211e2c6e621c67920a55b30d26]
# 
# add_file "packages/asterisk-core-sounds-en-g729/asterisk-core-sounds-en-g729_1.4.7.bb"
#  content [3749a81c19bb6ece50291cfc1e8b8f51c743891d]
# 
# add_file "packages/asterisk-core-sounds-en-gsm/asterisk-core-sounds-en-gsm_1.4.7.bb"
#  content [9ee5cf5d0245b1883eaa997690cc72c7eac1df4c]
# 
# add_file "packages/asterisk-core-sounds-en-ulaw/asterisk-core-sounds-en-ulaw_1.4.7.bb"
#  content [cb70f337ec851d833b4772bb15bece0fcdd788fd]
# 
# add_file "packages/asterisk-extra-sounds-en-alaw/asterisk-extra-sounds-en-alaw_1.4.6.bb"
#  content [2cf4bac2b83ff6352cb4315ebe9bcea76fa47ce7]
# 
# add_file "packages/asterisk-extra-sounds-en-g729/asterisk-extra-sounds-en-g729_1.4.6.bb"
#  content [84fc3a38f5414cbd71aabdebd2df8cb422c94290]
# 
# add_file "packages/asterisk-extra-sounds-en-gsm/asterisk-extra-sounds-en-gsm_1.4.6.bb"
#  content [49e28cdbdf947670361e9bf063c2e5cb74702417]
# 
# add_file "packages/asterisk-extra-sounds-en-ulaw/asterisk-extra-sounds-en-ulaw_1.4.6.bb"
#  content [43abb0834bd9e900f53ffd78c329cdc8ba920e57]
# 
# add_file "packages/asterisk-moh-freeplay-alaw/asterisk-moh-freeplay-alaw_0.0.0.bb"
#  content [7c1bf1fa2e9f82ba101416c2950affac0d78270a]
# 
# add_file "packages/asterisk-moh-freeplay-g729/asterisk-moh-freeplay-g729_0.0.0.bb"
#  content [f02532baf8649b02c0bea6f21eaef543f76c44cd]
# 
# add_file "packages/asterisk-moh-freeplay-gsm/asterisk-moh-freeplay-gsm_0.0.0.bb"
#  content [98809f216b57bfaf8be2324c05315b99eeb80b24]
# 
# add_file "packages/asterisk-moh-freeplay-ulaw/asterisk-moh-freeplay-ulaw_0.0.0.bb"
#  content [3b80353861635af18fa9f1b070716a83b7a1c835]
# 
============================================================
--- packages/asterisk-core-sounds-en-alaw/asterisk-core-sounds-en-alaw_1.4.7.bb	5937b70427319f211e2c6e621c67920a55b30d26
+++ packages/asterisk-core-sounds-en-alaw/asterisk-core-sounds-en-alaw_1.4.7.bb	5937b70427319f211e2c6e621c67920a55b30d26
@@ -0,0 +1,46 @@
+DESCRIPTION="The Asterisk open source software PBX"
+HOMEPAGE="http://www.asterisk.org"
+SECTION = "voip"
+LICENSE="GPL"
+#DEPENDS="asterisk"
+#PR = "r1"
+
+SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sounds-en-alaw-${PV}.tar.gz"
+
+do_install() {
+       install -d ${D}${localstatedir}/lib/asterisk/sounds
+       #install -m 644 ${WORKDIR}/*.alaw ${D}${localstatedir}/lib/asterisk/sounds/
+       #install -m 644 ${WORKDIR}/CREDITS* ${D}${localstatedir}/lib/asterisk/sounds/
+       #install -m 644 ${WORKDIR}/core-sounds-en.txt ${D}${localstatedir}/lib/asterisk/sounds/
+       mv ${WORKDIR}/*.alaw ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/dictate
+       #install -m 644 ${WORKDIR}/dictate/* ${D}${localstatedir}/lib/asterisk/sounds/dictate/
+       mv ${WORKDIR}/dictate ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/digits
+       #install -m 644 ${WORKDIR}/digits/* ${D}${localstatedir}/lib/asterisk/sounds/digits/
+       mv ${WORKDIR}/digits ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/followme
+       #install -m 644 ${WORKDIR}/followme/* ${D}${localstatedir}/lib/asterisk/sounds/followme/
+       mv ${WORKDIR}/followme ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/letters
+       #install -m 644 ${WORKDIR}/letters/* ${D}${localstatedir}/lib/asterisk/sounds/letters/
+       mv ${WORKDIR}/letters ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/phonetic
+       #install -m 644 ${WORKDIR}/phonetic/* ${D}${localstatedir}/lib/asterisk/sounds/phonetic/
+       mv ${WORKDIR}/phonetic ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/silence
+       #install -m 644 ${WORKDIR}/silence/* ${D}${localstatedir}/lib/asterisk/sounds/silence/
+       mv ${WORKDIR}/silence ${D}${localstatedir}/lib/asterisk/sounds/
+}
+
+pkg_postinst_prepend() {
+       chown -R asterisk:asterisk ${localstatedir}/lib/asterisk/sounds/
+}
+
+
============================================================
--- packages/asterisk-core-sounds-en-g729/asterisk-core-sounds-en-g729_1.4.7.bb	3749a81c19bb6ece50291cfc1e8b8f51c743891d
+++ packages/asterisk-core-sounds-en-g729/asterisk-core-sounds-en-g729_1.4.7.bb	3749a81c19bb6ece50291cfc1e8b8f51c743891d
@@ -0,0 +1,46 @@
+DESCRIPTION="The Asterisk open source software PBX"
+HOMEPAGE="http://www.asterisk.org"
+SECTION = "voip"
+LICENSE="GPL"
+#DEPENDS="asterisk"
+#PR = "r1"
+
+SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sounds-en-g729-${PV}.tar.gz"
+
+do_install() {
+       install -d ${D}${localstatedir}/lib/asterisk/sounds
+       #install -m 644 ${WORKDIR}/*.g729 ${D}${localstatedir}/lib/asterisk/sounds/
+       #install -m 644 ${WORKDIR}/CREDITS* ${D}${localstatedir}/lib/asterisk/sounds/
+       #install -m 644 ${WORKDIR}/core-sounds-en.txt ${D}${localstatedir}/lib/asterisk/sounds/
+       mv ${WORKDIR}/*.g729 ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/dictate
+       #install -m 644 ${WORKDIR}/dictate/* ${D}${localstatedir}/lib/asterisk/sounds/dictate/
+       mv ${WORKDIR}/dictate ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/digits
+       #install -m 644 ${WORKDIR}/digits/* ${D}${localstatedir}/lib/asterisk/sounds/digits/
+       mv ${WORKDIR}/digits ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/followme
+       #install -m 644 ${WORKDIR}/followme/* ${D}${localstatedir}/lib/asterisk/sounds/followme/
+       mv ${WORKDIR}/followme ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/letters
+       #install -m 644 ${WORKDIR}/letters/* ${D}${localstatedir}/lib/asterisk/sounds/letters/
+       mv ${WORKDIR}/letters ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/phonetic
+       #install -m 644 ${WORKDIR}/phonetic/* ${D}${localstatedir}/lib/asterisk/sounds/phonetic/
+       mv ${WORKDIR}/phonetic ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/silence
+       #install -m 644 ${WORKDIR}/silence/* ${D}${localstatedir}/lib/asterisk/sounds/silence/
+       mv ${WORKDIR}/silence ${D}${localstatedir}/lib/asterisk/sounds/
+}
+
+pkg_postinst_prepend() {
+       chown -R asterisk:asterisk ${localstatedir}/lib/asterisk/sounds/
+}
+
+
============================================================
--- packages/asterisk-core-sounds-en-gsm/asterisk-core-sounds-en-gsm_1.4.7.bb   9ee5cf5d0245b1883eaa997690cc72c7eac1df4c
+++ packages/asterisk-core-sounds-en-gsm/asterisk-core-sounds-en-gsm_1.4.7.bb   9ee5cf5d0245b1883eaa997690cc72c7eac1df4c
@@ -0,0 +1,48 @@
+DESCRIPTION="The Asterisk open source software PBX"
+HOMEPAGE="http://www.asterisk.org"
+SECTION = "voip"
+LICENSE="GPL"
+#DEPENDS="asterisk"
+#PR = "r1"
+
+SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sounds-en-gsm-${PV}.tar.gz"
+
+do_install() {
+       install -d ${D}${localstatedir}/lib/asterisk/sounds
+       #install -m 644 ${WORKDIR}/*.gsm ${D}${localstatedir}/lib/asterisk/sounds/
+       #install -m 644 ${WORKDIR}/CREDITS* ${D}${localstatedir}/lib/asterisk/sounds/
+       #install -m 644 ${WORKDIR}/core-sounds-en.txt ${D}${localstatedir}/lib/asterisk/sounds/
+       mv ${WORKDIR}/*.gsm ${D}${localstatedir}/lib/asterisk/sounds/
+       mv ${WORKDIR}/CREDITS* ${D}${localstatedir}/lib/asterisk/sounds/
+       mv ${WORKDIR}/core-sounds-en.txt ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/dictate
+       #install -m 644 ${WORKDIR}/dictate/* ${D}${localstatedir}/lib/asterisk/sounds/dictate/
+       mv ${WORKDIR}/dictate ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/digits
+       #install -m 644 ${WORKDIR}/digits/* ${D}${localstatedir}/lib/asterisk/sounds/digits/
+       mv ${WORKDIR}/digits ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/followme
+       #install -m 644 ${WORKDIR}/followme/* ${D}${localstatedir}/lib/asterisk/sounds/followme/
+       mv ${WORKDIR}/followme ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/letters
+       #install -m 644 ${WORKDIR}/letters/* ${D}${localstatedir}/lib/asterisk/sounds/letters/
+       mv ${WORKDIR}/letters ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/phonetic
+       #install -m 644 ${WORKDIR}/phonetic/* ${D}${localstatedir}/lib/asterisk/sounds/phonetic/
+       mv ${WORKDIR}/phonetic ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/silence
+       #install -m 644 ${WORKDIR}/silence/* ${D}${localstatedir}/lib/asterisk/sounds/silence/
+       mv ${WORKDIR}/silence ${D}${localstatedir}/lib/asterisk/sounds/
+}
+
+pkg_postinst_prepend() {
+       chown -R asterisk:asterisk ${localstatedir}/lib/asterisk/sounds/
+}
+
+
============================================================
--- packages/asterisk-core-sounds-en-ulaw/asterisk-core-sounds-en-ulaw_1.4.7.bb	cb70f337ec851d833b4772bb15bece0fcdd788fd
+++ packages/asterisk-core-sounds-en-ulaw/asterisk-core-sounds-en-ulaw_1.4.7.bb	cb70f337ec851d833b4772bb15bece0fcdd788fd
@@ -0,0 +1,46 @@
+DESCRIPTION="The Asterisk open source software PBX"
+HOMEPAGE="http://www.asterisk.org"
+SECTION = "voip"
+LICENSE="GPL"
+#DEPENDS="asterisk"
+#PR = "r1"
+
+SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-core-sounds-en-ulaw-${PV}.tar.gz"
+
+do_install() {
+       install -d ${D}${localstatedir}/lib/asterisk/sounds
+       #install -m 644 ${WORKDIR}/*.ulaw ${D}${localstatedir}/lib/asterisk/sounds/
+       #install -m 644 ${WORKDIR}/CREDITS* ${D}${localstatedir}/lib/asterisk/sounds/
+       #install -m 644 ${WORKDIR}/core-sounds-en.txt ${D}${localstatedir}/lib/asterisk/sounds/
+       mv ${WORKDIR}/*.ulaw ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/dictate
+       #install -m 644 ${WORKDIR}/dictate/* ${D}${localstatedir}/lib/asterisk/sounds/dictate/
+       mv ${WORKDIR}/dictate ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/digits
+       #install -m 644 ${WORKDIR}/digits/* ${D}${localstatedir}/lib/asterisk/sounds/digits/
+       mv ${WORKDIR}/digits ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/followme
+       #install -m 644 ${WORKDIR}/followme/* ${D}${localstatedir}/lib/asterisk/sounds/followme/
+       mv ${WORKDIR}/followme ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/letters
+       #install -m 644 ${WORKDIR}/letters/* ${D}${localstatedir}/lib/asterisk/sounds/letters/
+       mv ${WORKDIR}/letters ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/phonetic
+       #install -m 644 ${WORKDIR}/phonetic/* ${D}${localstatedir}/lib/asterisk/sounds/phonetic/
+       mv ${WORKDIR}/phonetic ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/silence
+       #install -m 644 ${WORKDIR}/silence/* ${D}${localstatedir}/lib/asterisk/sounds/silence/
+       mv ${WORKDIR}/silence ${D}${localstatedir}/lib/asterisk/sounds/
+}
+
+pkg_postinst_prepend() {
+       chown -R asterisk:asterisk ${localstatedir}/lib/asterisk/sounds/
+}
+
+
============================================================
--- packages/asterisk-extra-sounds-en-alaw/asterisk-extra-sounds-en-alaw_1.4.6.bb       2cf4bac2b83ff6352cb4315ebe9bcea76fa47ce7
+++ packages/asterisk-extra-sounds-en-alaw/asterisk-extra-sounds-en-alaw_1.4.6.bb       2cf4bac2b83ff6352cb4315ebe9bcea76fa47ce7
@@ -0,0 +1,37 @@
+DESCRIPTION="The Asterisk open source software PBX"
+HOMEPAGE="http://www.asterisk.org"
+SECTION = "voip"
+LICENSE="GPL"
+#DEPENDS="asterisk"
+#PR = "r1"
+
+SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-extra-sounds-en-alaw-${PV}.tar.gz"
+
+do_install() {
+       install -d ${D}${localstatedir}/lib/asterisk/sounds
+       # HACK: moving the files in chunkes (too many of them)
+       rm ${WORKDIR}/conf-thereare.alaw
+       rm ${WORKDIR}/invalid.alaw
+       mv ${WORKDIR}/[a-d]*.alaw ${D}${localstatedir}/lib/asterisk/sounds/
+       mv ${WORKDIR}/[e-l]*.alaw ${D}${localstatedir}/lib/asterisk/sounds/
+       mv ${WORKDIR}/*.alaw ${D}${localstatedir}/lib/asterisk/sounds/
+       #install -m 644 ${WORKDIR}/*.alaw ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/ha
+       #install -m 644 ${WORKDIR}/ha/* ${D}${localstatedir}/lib/asterisk/sounds/ha/
+       mv ${WORKDIR}/ha ${D}${localstatedir}/lib/asterisk/sounds
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/phonetic
+       #install -m 644 ${WORKDIR}/phonetic/* ${D}${localstatedir}/lib/asterisk/sounds/phonetic/
+       mv ${WORKDIR}/phonetic ${D}${localstatedir}/lib/asterisk/sounds
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/wx
+       #install -m 644 ${WORKDIR}/wx/* ${D}${localstatedir}/lib/asterisk/sounds/wx/
+       mv ${WORKDIR}/wx ${D}${localstatedir}/lib/asterisk/sounds
+}
+
+pkg_postinst_prepend() {
+       chown -R asterisk:asterisk ${localstatedir}/lib/asterisk/sounds/
+}
+
+
============================================================
--- packages/asterisk-extra-sounds-en-g729/asterisk-extra-sounds-en-g729_1.4.6.bb       84fc3a38f5414cbd71aabdebd2df8cb422c94290
+++ packages/asterisk-extra-sounds-en-g729/asterisk-extra-sounds-en-g729_1.4.6.bb       84fc3a38f5414cbd71aabdebd2df8cb422c94290
@@ -0,0 +1,37 @@
+DESCRIPTION="The Asterisk open source software PBX"
+HOMEPAGE="http://www.asterisk.org"
+SECTION = "voip"
+LICENSE="GPL"
+#DEPENDS="asterisk"
+#PR = "r1"
+
+SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-extra-sounds-en-g729-${PV}.tar.gz"
+
+do_install() {
+       install -d ${D}${localstatedir}/lib/asterisk/sounds
+       # HACK: moving the files in chunks (too many files)
+       rm ${WORKDIR}/conf-thereare.g729
+       rm ${WORKDIR}/invalid.g729
+       mv ${WORKDIR}/[a-d]*.g729 ${D}${localstatedir}/lib/asterisk/sounds/
+       mv ${WORKDIR}/[e-l]*.g729 ${D}${localstatedir}/lib/asterisk/sounds/
+       mv ${WORKDIR}/*.g729 ${D}${localstatedir}/lib/asterisk/sounds/
+       #install -m 644 ${WORKDIR}/*.g729 ${D}${localstatedir}/lib/asterisk/sounds/
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/ha
+       #install -m 644 ${WORKDIR}/ha/* ${D}${localstatedir}/lib/asterisk/sounds/ha/
+       mv ${WORKDIR}/ha ${D}${localstatedir}/lib/asterisk/sounds
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/phonetic
+       #install -m 644 ${WORKDIR}/phonetic/* ${D}${localstatedir}/lib/asterisk/sounds/phonetic/
+       mv ${WORKDIR}/phonetic ${D}${localstatedir}/lib/asterisk/sounds
+
+       #install -d ${D}${localstatedir}/lib/asterisk/sounds/wx
+       #install -m 644 ${WORKDIR}/wx/* ${D}${localstatedir}/lib/asterisk/sounds/wx/
+       mv ${WORKDIR}/wx ${D}${localstatedir}/lib/asterisk/sounds
+}
+
+pkg_postinst_prepend() {
+       chown -R asterisk:asterisk ${localstatedir}/lib/asterisk/sounds/
+}
+
+
============================================================
--- packages/asterisk-extra-sounds-en-gsm/asterisk-extra-sounds-en-gsm_1.4.6.bb	49e28cdbdf947670361e9bf063c2e5cb74702417
+++ packages/asterisk-extra-sounds-en-gsm/asterisk-extra-sounds-en-gsm_1.4.6.bb	49e28cdbdf947670361e9bf063c2e5cb74702417
@@ -0,0 +1,37 @@
+DESCRIPTION="The Asterisk open source software PBX"
+HOMEPAGE="http://www.asterisk.org"
+SECTION = "voip"
+LICENSE="GPL"
+#DEPENDS="asterisk"
+#PR = "r1"
+
+SRC_URI="http://downloads.digium.com/pub/telephony/sounds/releases/asterisk-extra-sounds-en-gsm-${PV}.tar.gz"
+
+do_install() {
+       install -d ${D}${localstatedir}/lib/asterisk/sounds
+       # HACK: moving th%s
>>> DIFF TRUNCATED @ 16K



_______________________________________________
Openembedded-commits mailing list
Openembedded-commits@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

===8<===========End of original message text===========



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



