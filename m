Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1KxH0Z-0001Fy-2z
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Nov 2008 09:11:27 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 6527516DEFE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Nov 2008 09:18:12 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id D39FA2A423D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Nov 2008 09:19:24 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 4 Nov 2008 09:10:05 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF4D9@hiob.intern.dresearch.de>
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF4C4@hiob.intern.dresearch.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] package structure for some boot tools?
Thread-Index: Ack7T2wcbe46WxklR3if/VrvMWf3PwDBSj6A
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF4C4@hiob.intern.dresearch.de>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: package structure for some boot tools?
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
X-List-Received-Date: Tue, 04 Nov 2008 08:11:27 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> ...
> What is the favored package structure to build such thing in=20
> OE and which dependencies need to be defined? One package for=20
> each part (u-boot, stage1 loader, header and patch-utility)?=20
> Or should the last tree reside in the same package? Or something else?
>=20
> Are there some naming conventions or suggestions for the packages?

No suggestions here? :(



