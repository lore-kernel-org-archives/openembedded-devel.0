Received: from [209.85.200.168] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1Lbl6F-0003Cq-4b
	for openembedded-devel@openembedded.org; Tue, 24 Feb 2009 01:24:39 +0100
Received: by wf-out-1314.google.com with SMTP id 25so2299632wfc.6
	for <openembedded-devel@openembedded.org>;
	Mon, 23 Feb 2009 16:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=uzGtH/PeNxbYEznYQGVcvR9T95reGPkMiGHxc1pbZUo=;
	b=vWmIBsN/nWYF7vKnO+Zt+4j6xQJFHv5D+6hbz+zvofXi6Oms9VD1MfEGiZFlEir/Ma
	fbF9M1ioIKvrL5+23ofxoKgbXC68CL4g0nDoojlfFT1scRSfFNtm7TK+1E90NtCtTg1e
	VCsneoxX2dXyoROpBf/JSypxFf4ahMcwlF5bE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=G9aTClFBdtSrIpc5mNeD+kmMtn3+WCUrxODpXzL2wTX8DDoKT7r31D0lAs6VgdmFRq
	8m+MRC122vSmbl30r5JAK/fZeG7LbIepfV0TbaQjynix3kbQP6uqgu/nl7TCzoJDTJaD
	yhT4iJde9R7LEBuZUMOqb85cm/iWDx0k/a4mc=
MIME-Version: 1.0
Received: by 10.143.4.16 with SMTP id g16mr2206556wfi.307.1235434902191; Mon, 
	23 Feb 2009 16:21:42 -0800 (PST)
Date: Mon, 23 Feb 2009 16:21:42 -0800
Message-ID: <f46da1cf0902231621w553de26bkbb4773bddadfe68f@mail.gmail.com>
From: "Theodore A. Roth" <taroth@gmail.com>
To: openembedded-devel@openembedded.org
Subject: [patch] [Doc] introduction.xml: Fix spelling of Angstrom.
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
X-List-Received-Date: Tue, 24 Feb 2009 00:24:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

 * Use character entities.

---
 usermanual/chapters/introduction.xml |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/usermanual/chapters/introduction.xml
b/usermanual/chapters/introduction.xml
index b218cb5..cbe5833 100644
--- a/usermanual/chapters/introduction.xml
+++ b/usermanual/chapters/introduction.xml
@@ -17,7 +17,7 @@
     is a set of metadata used to cross-compile, package and install softwa=
re
     packages. <application>OpenEmbedded</application> is being used to bui=
ld
     and maintain a number of embedded Linux distributions, including
-    OpenZaurus, Angstr=F6m, Familiar and SlugOS.</para>
+    OpenZaurus, &Aring;ngstr&ouml;m, Familiar and SlugOS.</para>

     <para>The primary use-case of <application>OpenEmbedded</application> =
are:
     <itemizedlist>
@@ -69,4 +69,4 @@
     two parts: BitBake, a generic task executor and OpenEmbedded, the meta=
data
     for BitBake.</para>
   </section>
-</chapter>
\ No newline at end of file
+</chapter>
--=20
1.5.4.3

Signed-off-by: Theodore A. Roth <taroth@gmail.com>


