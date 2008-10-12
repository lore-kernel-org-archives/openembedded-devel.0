Received: from [80.12.242.96] (helo=smtp27.orange.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <c.romain@laposte.net>) id 1Kp9sp-0001sO-5G
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Oct 2008 00:57:55 +0200
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2722.orange.fr (SMTP Server) with ESMTP id 2EB351C00087
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2008 00:52:56 +0200 (CEST)
Received: from [192.168.2.2] (AToulouse-157-1-125-72.w86-221.abo.wanadoo.fr
	[86.221.84.72])
	by mwinf2722.orange.fr (SMTP Server) with ESMTP id E53621C00086
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2008 00:52:55 +0200 (CEST)
X-ME-UUID: 20081012225255938.E53621C00086@mwinf2722.orange.fr
Message-ID: <48F281BB.3060908@laposte.net>
Date: Mon, 13 Oct 2008 01:01:15 +0200
From: cyril Romain <c.romain@laposte.net>
User-Agent: Thunderbird 2.0.0.16 (X11/20080726)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200810111447.57212.zecke@selfish.org>
In-Reply-To: <200810111447.57212.zecke@selfish.org>
Subject: Re: Final call for updating the name mapping script
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
X-List-Received-Date: Sun, 12 Oct 2008 22:57:55 -0000
Content-Type: multipart/mixed; boundary="------------050009010307000307040608"

--------------050009010307000307040608
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey,

Holger Freyther wrote:
> Patches welcome. Please send the output as diff -U 0... Otherwise this will be 
> the list of mappings we use for the conversion.
>   
Here is a patch with my correct email address.

Hope git will draw new OE hackers,

Best regards,

  Cyril
From 48570489c16db23ca63d97842bd1b5524443c34a Mon Sep 17 00:00:00 2001
From: Cyril Romain <cyril.romain@gmail.com>
Date: Mon, 13 Oct 2008 00:05:20 +0200
Subject: [PATCH] cyrilRomain

---
 email.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/email.py b/email.py
index ab8a58b..4075a74 100644
--- a/email.py
+++ b/email.py
@@ -28,7 +28,7 @@ all_names = {
     "Clement Hermann"    : (["clement.hermann@free.fr"], "clement.hermann@free.fr"),
     "Cliff Brake"        : (["cbrake@openembedded.org"], "cbrake@bec-systems.com"),
     "Craig Hughes"       : (["craig@gumstix.com"], "craig@gumstix.com"),
-    "Cyril Romain"       : (["c.romain@laposte.net", "CyrilRomain", "Cyril Romain", "cyril Romain <c.romain@laposte.net>", "Cyril Romain <c.romain@laposte.net>", "cyril.romain@gmail.com", "cyril.romain@laposte.net"], "cyril.romain@laposte.net"),
+    "Cyril Romain"       : (["c.romain@laposte.net", "CyrilRomain", "Cyril Romain", "cyril Romain <c.romain@laposte.net>", "Cyril Romain <c.romain@laposte.net>", "cyril.romain@gmail.com"], "cyril.romain@gmail.com"),
     "Dan Williams"       : (["Dan Williams <dan.j.williams@gmail.com>"], "dan.j.williams@gmail.com"),
     "David Karlstrom"    : (["daka@nslu2-linux.org", "daka@thg.se"], "daka@thg.se"),
     "Derek Young"        : (["dyoung@nslu2-linux.org"], "dyoung@nslu2-linux.org"),
-- 
1.6.0.2


--------------050009010307000307040608--
