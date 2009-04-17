Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LuiE4-0007dD-9C
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2009 09:13:24 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 3873516DFDC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 09:07:12 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 95C0E2A421E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 09:07:06 +0200 (CEST)
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Fri, 17 Apr 2009 09:06:36 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF760@hiob.intern.dresearch.de>
In-Reply-To: <1239887399.21612.182.camel@hammer.suse.cz>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] wrong shebang in mc-extfs files
Thread-Index: Acm+lWiZIy/jrZeVQbax9Wq8rnKR2QAlXIpg
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF75C@hiob.intern.dresearch.de>
	<1239887399.21612.182.camel@hammer.suse.cz>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 87.193.137.78
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: wrong shebang in mc-extfs files
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
X-List-Received-Date: Fri, 17 Apr 2009 07:13:36 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > I'm not that familiar with this python/bitbake path magic.=20
> > Can someone please help?
>=20
> configure magic:
> http://cgit.openembedded.net/cgit.cgi?url=3Dopenembedded/commit/
> &id=3Da873d2ce9842923b8d0abae7e4cdfca606b3dd90

Thx for the fast fix.


