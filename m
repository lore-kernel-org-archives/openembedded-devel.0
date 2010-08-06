Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1OhMVs-0006hu-5S
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 14:59:05 +0200
Received: from us194mx07.tycoelectronics.net (163.241.185.38) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server (TLS) id 8.1.393.1; Fri, 6 Aug 2010 08:47:53 -0400
Received: from us194mx002.tycoelectronics.net ([163.241.202.108]) by
	us194mx07.tycoelectronics.net ([163.241.185.38]) with mapi;
	Fri, 6 Aug 2010 08:47:53 -0400
From: "Snyder, Jay A" <jay.snyder@tycoelectronics.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Aug 2010 08:45:58 -0400
Thread-Topic: xserver-xorg -- which video driver for Atom Z510-based system
	with integrated graphics
Thread-Index: AQHLNWWVUq9wqRKr1U6EeH1bA8p0/Q==
Message-ID: <B3E33FFB737EB346B7569E8F883B89E320C6F92BBC@us194mx002.tycoelectronics.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: xserver-xorg -- which video driver for Atom Z510-based system with integrated graphics
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
X-List-Received-Date: Fri, 06 Aug 2010 12:59:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

My target system is a COM Express module with a 1.1 GHz Z510 Atom and Intel=
 integrated graphics.

With xserver-xorg 1.6.1, the VESA driver worked fine, but when I try to run=
 1.7.4, I get "no video modes".

Is anyone here running OE w/ xorg 1.7.4 on a Atom system?

Thanks,
Jay


