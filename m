Received: from zimbra.elbe-net.de ([78.46.64.122])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kakuschky@elbe-net.de>) id 1RStLs-0005qc-1y
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Nov 2011 17:37:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by zimbra.elbe-net.de (Postfix) with ESMTP id 956FEEC034
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 12:44:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at zimbra.elbe-net.de
Received: from zimbra.elbe-net.de ([127.0.0.1])
	by localhost (zimbra.elbe-net.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pc2YNFW2kVlk
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 12:44:19 +0100 (CET)
Received: from zimbra.elbe-net.de (zimbra.elbe-net.de [78.46.64.122])
	by zimbra.elbe-net.de (Postfix) with ESMTP id C89EEEC031
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 12:44:19 +0100 (CET)
Date: Tue, 22 Nov 2011 12:44:19 +0100 (CET)
From: kakuschky@elbe-net.de
To: openembedded-devel@lists.openembedded.org
Message-ID: <1999711481.10.1321962259696.JavaMail.root@zimbra>
In-Reply-To: <991959095.8.1321962161594.JavaMail.root@zimbra>
MIME-Version: 1.0
X-Originating-IP: [87.139.213.196]
X-Mailer: Zimbra 6.0.10_GA_2692 (ZimbraWebClient - FF3.0
	(Linux)/6.0.10_GA_2692)
Subject: Where to find psplash sources?
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
X-List-Received-Date: Tue, 22 Nov 2011 16:37:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

I'm new with open-embedded and try to change the bitmap shown by psplash. What I understand I have to recompile an image header file.
The script todo this called make-image-header.sh and should be part of the psplash package.

Where can I find the make-image-header.sh and the psplash.c files?

I can't find them in the angstrom source and anywhere else in the web.

The repository (svn.o-hand.com) where the psplash recipe is linked to is not available.

Any ideas how to get psplash sources?
 
Thanks & regards Michael


