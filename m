Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1Q4bF2-00064c-1c
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 17:54:02 +0200
Received: by gwb11 with SMTP id 11so136311gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 08:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=NMfwpzLemGEqDntWzeip2LU+p9EYdfauQFd8gPPEUuA=;
	b=raA+MCYBQydggYqr5Z1dQTQTwp0O8fUHa4YO/iYXLGwWFXOW6jwt447N3j81ZhbL3x
	Ndlw443sGL2FXh8cEhWWqNrabG9bZvd31pV9OzciACDcc6L/qWFpJoZY8LngYHN7wFfg
	D7fow7pX0dFPl2Pi4iXae8oNpZd0ftCJ0Qtms=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=H6LIB6D0pHdL2ER8MJLItDKaWgfWqqjKR1/cnznQY5Fgfxk9nlrhEm4WlGWIemhzaz
	CIdFL3SjqWLFqcZMg4VCIhepCsFnKLZd1a7CLO1XXcaHbOvflQXapHTOQAXxI1F9HJm1
	KmoRQnoo1Dh2KI8cqVgJtMu/OX0o0oFAHukps=
Received: by 10.236.77.66 with SMTP id c42mr7737249yhe.259.1301412166546;
	Tue, 29 Mar 2011 08:22:46 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id z5sm2506909yhc.35.2011.03.29.08.22.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Mar 2011 08:22:45 -0700 (PDT)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 10:20:20 -0500
Message-Id: <1301498420-6480-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] matrix-gui: update SRCREV
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
X-List-Received-Date: Tue, 29 Mar 2011 15:54:02 -0000

  * am1808 - pull in better description for WiFi.

Signed-off-by: Jeff Lance   <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common_1.4.bb |    4 ++--
 recipes/ti/matrix-gui-e_1.3.bb      |    4 ++--
 recipes/ti/matrix-gui_1.3.bb        |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/ti/matrix-gui-common_1.4.bb b/recipes/ti/matrix-gui-common_1.4.bb
index 29d6b3e..04cdb2f 100644
--- a/recipes/ti/matrix-gui-common_1.4.bb
+++ b/recipes/ti/matrix-gui-common_1.4.bb
@@ -4,5 +4,5 @@ require matrix-gui-common.inc
 # prebuilt version in the repository.
 RRECOMMENDS_${PN} = "am-sysinfo"
 
-SRCREV = "242"
-PR = "${INC_PR}.7"
+SRCREV = "243"
+PR = "${INC_PR}.8"
diff --git a/recipes/ti/matrix-gui-e_1.3.bb b/recipes/ti/matrix-gui-e_1.3.bb
index 00aeb42..4519437 100644
--- a/recipes/ti/matrix-gui-e_1.3.bb
+++ b/recipes/ti/matrix-gui-e_1.3.bb
@@ -1,5 +1,5 @@
 require matrix-gui-e.inc
 
-SRCREV = "242"
-PR = "${INC_PR}.6"
+SRCREV = "243"
+PR = "${INC_PR}.7"
 
diff --git a/recipes/ti/matrix-gui_1.3.bb b/recipes/ti/matrix-gui_1.3.bb
index ddcb15a..727aca1 100644
--- a/recipes/ti/matrix-gui_1.3.bb
+++ b/recipes/ti/matrix-gui_1.3.bb
@@ -1,4 +1,4 @@
 require matrix-gui.inc
 
-SRCREV = "242"
-PR = "${INC_PR}.2"
+SRCREV = "243"
+PR = "${INC_PR}.3"
-- 
1.6.3.3



