Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1LhrqC-0002ea-KT
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 21:49:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id C629350361A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 17:53:46 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K35TK-EZDgq2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 17:53:42 -0300 (BRT)
Received: from [192.168.15.100] (unknown [189.102.205.109])
	by mail.2mi.com.br (Postfix) with ESMTP id BF15550277F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 17:53:42 -0300 (BRT)
From: "Jader H. Silva" <jader@2mi.com.br>
To: Open Embedded <openembedded-devel@lists.openembedded.org>
Organization: 2MI Tecnologia
Date: Thu, 12 Mar 2009 17:48:55 -0300
Message-Id: <1236890935.6250.26.camel@northpole>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: calibrateproto git tag
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
X-List-Received-Date: Thu, 12 Mar 2009 20:49:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

xorg proto calibrateproto git tag added.

---
 packages/xorg-proto/calibrateproto_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/packages/xorg-proto/calibrateproto_git.bb
b/packages/xorg-proto/calibrateproto_git.bb
index fe9e1a4..08cefa3 100644
--- a/packages/xorg-proto/calibrateproto_git.bb
+++ b/packages/xorg-proto/calibrateproto_git.bb
@@ -6,5 +6,5 @@ PV = "0.0+gitr${SRCREV}"
 PR = "r1"
 PE = "1"
 
-SRC_URI =
"git://anongit.freedesktop.org/git/xorg/proto/calibrateproto;protocol=git"
+SRC_URI =
"git://anongit.freedesktop.org/git/xorg/proto/calibrateproto;protocol=git;tag=master"
 S = "${WORKDIR}/git"
-- 
1.5.6.3


Att.


Jader H. Silva
Depto. de desenvolvimento
2MI Tecnologia








