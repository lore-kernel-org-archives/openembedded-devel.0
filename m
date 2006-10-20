Received: from [195.70.105.99] (helo=mail.skidata.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <FALE@skidata.com>) id 1Gas5I-00070c-Dy
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Oct 2006 12:58:40 +0200
X-SEF-Processed: 5_0_0_713__2006_10_20_12_51_32
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 20 Oct 2006 12:52:45 +0200
Message-ID: <B89BA7A4AEC51A4B82EAB2DEDCEFCA3F0123D039@sdexsrv.skidata.net>
In-Reply-To: <4538A6E0.2070501@dominion.kabel.utwente.nl>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] cvs proxy
Thread-Index: Acb0M9VS82ivP6cYQgeGmfVVX6kEzwAAK/fA
From: "FALE\(Leopold Faschalek\)" <FALE@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: cvs proxy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Oct 2006 10:58:40 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> Leopold Faschalek schreef:
> > Hi,
> >=20
> > after installing OE I tried with 'bitbake task-bootstrap' and got=20
> > following output after a second run:
> > <snip>=20
> > </snip>
> > any suggestions?
> >=20
>=20
> Yes, as the output says:
>=20
> "Connecting to 172.16.10.104:8080... connected.
> Proxy request sent, awaiting response... 504 Proxy Timeout (=20
> The connection timed out. For more information about this=20
> event, see ISA Server Help.  )"
>=20
> It seems like the proxy on your network is broken.
>=20
> regards,
>=20
> Koen
>=20
Hi,

I tried 'wget' with this file and it has the same timeout
then I would update the OE database via monotone, but this
also choked and didn't use the proxy.

are there any known workarounds for proxy connections?

thanks
Leopold Faschalek
fale at skidata dot com



