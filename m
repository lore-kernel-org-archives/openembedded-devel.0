Received: from snvl-smtp1.trimble.com ([155.63.64.31])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bernard_Mentink@trimble.com>) id 1QrJKN-0003VZ-6Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Aug 2011 02:40:51 +0200
Received: (qmail 10184 invoked by uid 501); 10 Aug 2011 17:36:18 -0700
Received: from 10.3.0.166 by snvl-smtp1.trimble.com (envelope-from
	<Bernard_Mentink@trimble.com>, uid 108) with qmail-scanner-2.08 
	(clamdscan: 0.97.2/13423. avast: v3.2.0/110809-1. sophie:
	3.06/3.22.0/4.68. spamassassin: 3.3.1. Clear:RC:1(10.3.0.166):. 
	Processed in 0.011694 secs); 11 Aug 2011 00:36:18 -0000
Received: from unknown (HELO nzc-ap-xch-02.ap.trimblecorp.net) (10.3.0.166)
	by snvl-smtp1.trimble.com with SMTP; 10 Aug 2011 17:36:18 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 11 Aug 2011 12:36:16 +1200
Message-ID: <F7C0AA5DD1508F4789E10B6CC9BB75DB04BCA0FE@nzc-ap-xch-02.ap.trimblecorp.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Startx? Where is it?
Thread-Index: AcxXvq4Ya6Q/8mRCQTiWD2tubW4eTg==
From: "Bernard Mentink" <Bernard_Mentink@trimble.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Startx? Where is it?
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
X-List-Received-Date: Thu, 11 Aug 2011 00:40:51 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I have finally got a booting console image (Angstrom) logged in via SSH
and now want to try and get X working.

I have built the Angstom-x11-image and have unpacked it into my NFS root
... but the problem is I see no startx command. How do you start X in
this distro?

I have also built frame-buffer support into my kernel, can someone tell
me how to test that ..

Cheers,
Bernie






