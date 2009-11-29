Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NElr0-0004QH-UA
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Nov 2009 16:38:30 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NElpV-0003tY-C8 for openembedded-devel@lists.openembedded.org;
	Sun, 29 Nov 2009 10:36:53 -0500
Date: Sun, 29 Nov 2009 10:36:41 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911291035490.2789@localhost>
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
Subject: [PATCH] Docs: Update usermanual bitbake references to 1.8.18.
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
X-List-Received-Date: Sun, 29 Nov 2009 15:38:30 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/docs/usermanual/chapters/getting_oe.xml b/docs/usermanual/chapters/getting_oe.xml
index c71f32d..d18c955 100644
--- a/docs/usermanual/chapters/getting_oe.xml
+++ b/docs/usermanual/chapters/getting_oe.xml
@@ -53,13 +53,13 @@ $ <command>cd</command> $OEBASE</screen>
 	<section><title>Downloading a <application>BitBake</application> release</title>
 	  <para>Releases are available from the berlios project website. The current
           release series is <application>BitBake</application> <emphasis>1.8</emphasis>
-          and the current release is <emphasis>1.8.16</emphasis>. To download execute
+          and the current release is <emphasis>1.8.18</emphasis>. To download execute
 	  the following commands:
 		<screen>
 $ <command>cd</command> $OEBASE
-$ <command>wget</command> http://download.berlios.de/bitbake/bitbake-1.8.16.tar.gz
-$ <command>tar</command> -xvzf bitbake-1.8.16.tar.gz
-$ <command>mv</command> bitbake-1.8.16 bitbake
+$ <command>wget</command> http://download.berlios.de/bitbake/bitbake-1.8.18.tar.gz
+$ <command>tar</command> -xvzf bitbake-1.8.18.tar.gz
+$ <command>mv</command> bitbake-1.8.18 bitbake
 </screen>
 	  </para>


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


