Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1MiBR8-0006jJ-Jc
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Aug 2009 20:17:02 +0200
Received: from andromeda.vanille.de (e180153210.adsl.alicedsl.de
	[85.180.153.210])
	by drlauer-research.com (Postfix) with ESMTP id 30A8E584B27
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2009 20:38:22 +0200 (CEST)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Aug 2009 19:58:37 +0200
User-Agent: KMail/1.11.2 (Linux/2.6.28-15-generic; KDE/4.2.2; x86_64; ; )
References: <12c2e32e0908310716r696a7dadrdc330ad9d4b1eb65@mail.gmail.com>
	<200908311722.45126.mickey@vanille-media.de>
	<12c2e32e0908311041g71b15fd7j102c162d440a7776@mail.gmail.com>
In-Reply-To: <12c2e32e0908311041g71b15fd7j102c162d440a7776@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200908311958.37597.mickey@vanille-media.de>
Subject: Re: DISTRO minimal.conf for ARM architectures
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
X-List-Received-Date: Mon, 31 Aug 2009 18:17:02 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hmm, bails out somewhere in the toolchain. I'm afraid I can't help you there. 
Anyone else?

(Unfortunately interest in codifying toolchain specifics in a distribution-
independant way has only started recently, so there might still be 
configurations where we are missing sane defaults. I consider this being a bug 
in the OE metadata, so if you find the culprit, please inform us)

:M:



