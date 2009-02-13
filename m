Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1LXzba-0001gG-EY
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 16:05:26 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 3DA3816DFBD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 16:16:44 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id 17EF92A41DF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 16:04:00 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 13 Feb 2009 16:04:02 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF66B@hiob.intern.dresearch.de>
In-Reply-To: <200902131525.34787.openembedded@haerwu.biz>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Machine config generator (FOSDEM idea)
Thread-Index: AcmN6wgaUzeiNRvfSKe2RNZpMsKJPgAAOA/g
References: <200902131525.34787.openembedded@haerwu.biz>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Machine config generator (FOSDEM idea)
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
X-List-Received-Date: Fri, 13 Feb 2009 15:05:26 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> I was talking during FOSDEM with some developers and one of=20
> things which=20
> I was asked about was 'how to create machine config' (usually=20
> question=20
> was other but had this sense).
>=20
> OE developers usually know that machine config is simple but=20
> tell that=20
> to Joe Random who only knows that his board use s3c2443 etc.=20
> So idea was=20
> to create simple few steps wizard which will ask few questions and=20
> produce machine config as result. More work would be required on=20
> creating kernel recipe because kernel can be from svn/cvs/git=20
> or tarball=20
> + quilt patchset etc...

A good start could be =
<http://wiki.openembedded.net/index.php/Adding_a_new_Machine>.

This is also the place where i would like to see the results of this =
discussion. :)

Steffen


