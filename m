Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Ln6rT-0001Qe-BA
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Mar 2009 08:52:19 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 89DE316E002
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2009 09:05:08 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id D78D22A4217
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2009 08:50:33 +0100 (CET)
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Fri, 27 Mar 2009 08:50:07 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF74B@hiob.intern.dresearch.de>
In-Reply-To: <20090326175845.GA6756@denix.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] u-boot update question
Thread-Index: AcmuPaLZkhrJvx30RsOg1rYynQVC8AActzHw
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF746@hiob.intern.dresearch.de>
	<20090326175845.GA6756@denix.org>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: u-boot update question
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
X-List-Received-Date: Fri, 27 Mar 2009 07:52:19 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > And there is another question. How do i persuade bitbake to=20
> > use u-boot_git.bb instead of u-boot_1.1.2.bb? I couldn't find=20
> > DEFAULT_PREFERENCE items for the other machines in both=20
> > recipes so i assumed that the git recipe is preferred to the=20
> > other. But a "bitbake u-boot" still builds from 1.1.2 .  :(
>
> conf/machine/oxnas.conf

Yes, of course. I'm really mortified. ;-)


