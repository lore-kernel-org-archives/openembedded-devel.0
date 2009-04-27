Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LyR6i-0003lv-R3
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Apr 2009 15:42:52 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 8AE1716E237
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2009 15:38:22 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 5FA6E2A41FB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2009 15:37:50 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 27 Apr 2009 15:37:25 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF793@hiob.intern.dresearch.de>
In-Reply-To: <49F59B68.1010208@balister.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf binary
Thread-Index: AcnHLqui9d8RXSMbSaS1N3lO8VESqgAACL2Q
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF77C@hiob.intern.dresearch.de><69E6C70090A0A14498CC98FAE5E06B6E3CF78E@hiob.intern.dresearch.de>
	<49F59B68.1010208@balister.org>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf binary
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
X-List-Received-Date: Mon, 27 Apr 2009 13:42:53 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > At the moment we are not able to make a build out of the=20
> > .dev tree. :(
>=20
> For what machine and distro?

hipox and angstrom

But does this problem really depends on them? I thought it's a problem =
in the gcc-4.2.4 recipe.

Steffen


