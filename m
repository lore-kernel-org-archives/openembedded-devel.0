Received: from mail-dotnet1.eads.net ([80.156.45.103])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OUJS0-0005eR-P8 for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 15:05:09 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet1.eads.net with ESMTP; 01 Jul 2010 14:52:34 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Thu, 1 Jul 2010 15:00:21 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 1 Jul 2010 15:00:20 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 1 Jul 2010 15:00:19 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819905@deimsg40.de.net.world>
In-Reply-To: <4C2C8F31.2050107@freyther.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Creating a Own Tool chain,
	some referenced packages are not included into the SDK archive
Thread-Index: AcsZHC+E0DTGfCoYQUmetzsd3F6ypwAABalg
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819743@deimsg40.de.net.world>	<4C2A07C5.9060909@freyther.de><0B51A1E7C61D114DAE6FC10B0FD0ABA50181975A@deimsg40.de.net.world>
	<4C2C8F31.2050107@freyther.de>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 01 Jul 2010 13:00:21.0192 (UTC)
	FILETIME=[5CCDAC80:01CB191D]
X-SA-Exim-Connect-IP: 80.156.45.103
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Creating a Own Tool chain, some referenced packages are not included into the SDK archive
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
X-List-Received-Date: Thu, 01 Jul 2010 13:05:10 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Holger Freyther,

I have built a working qte toolchain at 2010/06/09. It is based on =
org.openembedded.dev at this time.

Regards
Wolfgang Hauser

-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Holger Freyther
Gesendet: Donnerstag, 1. Juli 2010 14:51
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] Creating a Own Tool chain, some referenced packages =
are not included into the SDK archive

On 06/29/2010 11:20 PM, Hauser, Wolfgang (external) wrote:
> Hello Holger Freyther,
>=20
> here are the diffs for my changes:
>=20
> diff of meta-toolchain-qte.bb <> meta-toolchain-xxx.bb

sorry, this diff is not readable, please use a unified diff for the =
changes.

>=20
> The qte toolchain has created properly, my own do not.

So you say bitbake meta-toolchain-qte is working?

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


