Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1H40IH-0006PB-6e
	for openembedded-devel@openembedded.org; Mon, 08 Jan 2007 20:36:29 +0100
Received: (qmail 13665 invoked by uid 813007); 8 Jan 2007 19:34:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 8 Jan 2007 19:34:47 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 8 Jan 2007 20:34:42 +0100
User-Agent: KMail/1.9.5
References: <200701081618.46665.openembedded@hrw.one.pl>
	<f96d234e0701080819q7a8017d3q922b055670163c54@mail.gmail.com>
In-Reply-To: <f96d234e0701080819q7a8017d3q922b055670163c54@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200701082034.43447.openembedded@hrw.one.pl>
Subject: Re: Status of ARM machines in OE
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
X-List-Received-Date: Mon, 08 Jan 2007 19:36:29 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 8 stycznia 2007 17:19, Cliff Brake napisa=B3:
> > compulab-pxa270 - use binary driver for flash so only hardfloat
> > distributions can use this machine:

> Thanks for doing the builds -- very interesting.
>
> The issue with this drive is it uses the old abi, so non-eabi builds
> should work. =A0I recently added a note in the kernel bb. =A0Softfloat is
> working fine. =A0Is there any easy way in angstrom to specify oabi?

Yes - DISTRO=3D"angstrom-2007.1-oabi" makes it. I will do such build soon=20
for armv4 and compulab-pxa270 machines.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

              A person who aims at nothing is sure to hit it.




