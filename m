Received: from zimbra.elbe-net.de ([78.46.64.122])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kakuschky@elbe-net.de>) id 1RSseK-0004la-SS
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Nov 2011 16:52:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by zimbra.elbe-net.de (Postfix) with ESMTP id 33CD2EC035
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 14:16:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at zimbra.elbe-net.de
Received: from zimbra.elbe-net.de ([127.0.0.1])
	by localhost (zimbra.elbe-net.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fVkaofnmPIpp
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 14:16:47 +0100 (CET)
Received: from zimbra.elbe-net.de (zimbra.elbe-net.de [78.46.64.122])
	by zimbra.elbe-net.de (Postfix) with ESMTP id 89E51EC031
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 14:16:47 +0100 (CET)
Date: Tue, 22 Nov 2011 14:16:47 +0100 (CET)
From: kakuschky@elbe-net.de
To: "." <openembedded-devel@lists.openembedded.org>
Message-ID: <2074563683.12.1321967807362.JavaMail.root@zimbra>
MIME-Version: 1.0
X-Originating-IP: [87.139.213.196]
X-Mailer: Zimbra 6.0.10_GA_2692 (ZimbraWebClient - FF3.0
	(Linux)/6.0.10_GA_2692)
Subject: Where are the psplash sources?
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
X-List-Received-Date: Tue, 22 Nov 2011 15:52:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

I'm new with open embedded and try to change the bitmap shown by psplash at startup. What I understand I have to recompile an image header file.
The script to prepare the header file called make-image-header.sh and should be part of the psplash.

Where can I find the make-image-header.sh and the psplash.c files?

I can't find them in the angstrom source and anywhere else in the web.
 
Thanks & regards Michael


