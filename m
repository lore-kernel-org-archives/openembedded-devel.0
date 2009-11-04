Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N5ayA-0004vT-HS
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 09:11:57 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N5awc-0007Eu-VV for openembedded-devel@lists.openembedded.org;
	Wed, 04 Nov 2009 03:10:19 -0500
Date: Wed, 4 Nov 2009 03:09:17 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911040306440.17282@localhost>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] Aesthetic fix in chapter 1.
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
X-List-Received-Date: Wed, 04 Nov 2009 08:11:57 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


A simple tidy of a comma-separated list in Chapter 1.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  first in a list of patches to fix aesthetic stuff in user manual --
this patch is as trivial as it gets, but i would prefer to do this a
chapter at a time, if i might.  i promise that future patches will be
more substantive, but still be logically self-contained.

  is this the right format for submitting patches?  i'm just stealing
from the format for kernel patches.


diff --git a/docs/usermanual/chapters/introduction.xml b/docs/usermanual/chapters/introduction.xml
index 31f1f1f..28e7725 100644
--- a/docs/usermanual/chapters/introduction.xml
+++ b/docs/usermanual/chapters/introduction.xml
@@ -30,7 +30,7 @@
         </listitem>

         <listitem>
-          <para>Must be able to emit packages (tar, rpm, deb,ipk)</para>
+          <para>Must be able to emit packages (tar, rpm, deb, ipk)</para>
         </listitem>

         <listitem>


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


