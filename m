Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OUIzv-0002zp-Hb for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 14:36:08 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet2.eads.net with ESMTP; 01 Jul 2010 14:21:30 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Thu, 1 Jul 2010 14:30:20 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 1 Jul 2010 14:30:20 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 1 Jul 2010 14:30:19 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018198FA@deimsg40.de.net.world>
In-Reply-To: <4C2C5912.80308@jak.nl>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] meta-toolchain-qte produces toolchain with missing Qt
	includedirs
Thread-Index: AcsY/AFIT4/AvMv7TBiWuJ54+zxk5QAHM0KQ
References: <4C2C5912.80308@jak.nl>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 01 Jul 2010 12:30:20.0703 (UTC)
	FILETIME=[2BA0DAF0:01CB1919]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: meta-toolchain-qte produces toolchain with missing Qt includedirs
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
X-List-Received-Date: Thu, 01 Jul 2010 12:36:08 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have the same behavior with an derived qt4 toolchain, but some other =
referenced packages are missing too.
=20
-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Arjan
Gesendet: Donnerstag, 1. Juli 2010 11:00
An: openembedded-devel@lists.openembedded.org
Betreff: [oe] meta-toolchain-qte produces toolchain with missing Qt =
includedirs

I'm trying to build the sdk as described in de OE manual.=20
[http://docs.openembedded.org/usermanual/usermanual.html#id501110]
I did not modify the qt4-embedded.inc or qt4.inc.
The final sdk archive misses almost all the includes from de Qt=20
framework (it only has qtopia/QtCore and qtopia/phonon) . But it does=20
include the libs and binaries.

Is this expected behaviour or am I doing something wrong?

Thanks,
Arjan



_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


