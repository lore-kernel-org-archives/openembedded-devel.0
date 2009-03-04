Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Lel77-00018n-QE
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 08:01:57 +0100
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id B1BF916E002
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2009 08:11:23 +0100 (CET)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id DCB4E2A420C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2009 07:57:48 +0100 (CET)
MIME-Version: 1.0
X-MimeOLE: Produced By Microsoft Exchange V6.5
Date: Wed, 4 Mar 2009 07:57:25 +0100
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF6E6@hiob.intern.dresearch.de>
In-Reply-To: <f96d234e0903030840k69edc48cy7f946274616a3c24@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Documentation/User Manual questions
Thread-Index: AcmcHvxZBbVtVBnnQzS0lWCbMK4GRgAdweMQ
References: <f46da1cf0902201818r3fcf3432oc14929b5f455bbe7@mail.gmail.com><f96d234e0902240651r7ad36677h8e828964308e2b50@mail.gmail.com><49A55A59.5080409@balister.org><f96d234e0902250828x6e72a8b6kc0a4285125f27b0e@mail.gmail.com><49A8626B.8020209@balister.org><69E6C70090A0A14498CC98FAE5E06B6E3CF6D4@hiob.intern.dresearch.de>
	<f96d234e0903030840k69edc48cy7f946274616a3c24@mail.gmail.com>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Documentation/User Manual questions
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
X-List-Received-Date: Wed, 04 Mar 2009 07:01:58 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > There's a little configuration problem according to the=20
> > encoding. The document seems to be in Latin1 and contains
> >
> > <meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3DISO-8859-1">
> >
> > but the HTTP header say UTF-8.
> >
> > HTTP/1.1 200 OK
> > Date: Mon, 02 Mar 2009 06:45:20 GMT
> > Server: Apache/2.2.3 (Debian) mod_python/3.2.10 Python/2.4.4 =
PHP/5.2.0-8+etch13 mod_perl/2.0.2 Perl/v5.8.8
> > Last-Modified: Tue, 06 May 2008 12:30:38 GMT
> > ETag: "184311-84-44c8f04003780"
> > Accept-Ranges: bytes
> > Content-Length: 132
> > Connection: close
> > Content-Type: text/html; charset=3DUTF-8
> >
> > This results in wrong presentation e.g. of the copyright symbol. :(
>=20
> I'm unable to reproduce the problem -- can you supply:
>=20
> - browser and version that displays this problem
> - screen shot of problem

Theodore sent one some minutes before.

> Patches are also welcome if you know what needs changed in=20
> the docs source.

I don't believe it's a problem in the sources but in the apache =
configuration. It seems that apache does not respect the meta tag inside =
the document.

Steffen


