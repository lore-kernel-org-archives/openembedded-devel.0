Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1QebX7-0000uj-L7
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 01:29:30 +0200
Received: (qmail 21790 invoked by uid 501); 6 Jul 2011 16:25:37 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.1/13285. avast: v3.2.0/110705-1. sophie:
	3.06/3.21.0/4.67. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.012643 secs); 06 Jul 2011 23:25:37 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 6 Jul 2011 16:25:37 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 7 Jul 2011 11:25:35 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04A78E50@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Debugging u-boot
Thread-Index: Acw8NAIxfaQ3zLffTFqj7EcndEQjmQ==
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Debugging u-boot
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
X-List-Received-Date: Wed, 06 Jul 2011 23:29:30 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

Can some one please tell me how to debug u-boot  on my target. I have
built u-boot for similar hardware and I want to debug with gdb, but
cannot even find the cross-compile version of gdb,
It does not exist in the directory
"build/tmp/sysroots/i686-linux/usr/armv6/bin/" where the other
cross-compile tools live ..

I want to execute "${CROSS_COMPILE}gdb u-boot"
 .. and breakpoint at some very early symbol ..... Some steps to
achieving this would be much appreciated ..

Many Thanks,
Bernie





