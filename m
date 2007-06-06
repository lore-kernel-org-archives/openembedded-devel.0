Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@hrw.one.pl>) id 1HvtlB-0003oe-33
	for openembedded-devel@openembedded.org; Wed, 06 Jun 2007 13:33:05 +0200
Received: (qmail 22112 invoked by uid 813007); 6 Jun 2007 11:30:42 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 6 Jun 2007 11:30:42 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 6 Jun 2007 13:30:36 +0200
User-Agent: KMail/1.9.7
References: <E1HvlNq-0004pN-I1@linuxtogo.org>
	<1709000488.20070606140338@gmail.com>
	<466697F2.6020303@dominion.kabel.utwente.nl>
In-Reply-To: <466697F2.6020303@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200706061330.37489.openembedded@hrw.one.pl>
Subject: Re: [oe-commits] org.oe.dev usb-gadget-mode: Add usb-gadget mode: An initscript to load the configured USB gadget module on boot
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jun 2007 11:33:06 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 6 czerwca 2007, Koen Kooi napisa=B3:
> > Hello coredump2,

> >> usb-gadget-mode: Add usb-gadget mode: An initscript to load the
> >> configured USB gadget module on boot

> What about using o-hands usbinit[1]?

I had same idea when saw that commit. OpenedHand usbinit is in use on few=20
machines and do that work done properly. But it supports only 2.6=20
machines which use g-ether kernel module.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

           Q:      What's a light-year?
           A:      One-third less calories than a regular year.




