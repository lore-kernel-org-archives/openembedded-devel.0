Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <openembedded@haerwu.biz>) id 1JJOKo-0003t9-Fm
	for openembedded-devel@openembedded.org; Mon, 28 Jan 2008 08:23:14 +0100
Received: (qmail 31081 invoked by uid 813007); 28 Jan 2008 07:23:19 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO home.lan)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 28 Jan 2008 07:23:19 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jan 2008 08:22:31 +0100
User-Agent: KMail/1.9.7
References: <fnj683$oaa$5@ger.gmane.org>
	<1201480667.4670.16.camel@localhost.localdomain>
In-Reply-To: <1201480667.4670.16.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200801280823.04049.openembedded@haerwu.biz>
Subject: Re: [RFC] Tosa patches for 2.6.24
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
X-List-Received-Date: Mon, 28 Jan 2008 07:23:15 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia Monday, 28 of January 2008, Richard Purdie napisa=B3:
> Hi,
>
> On Mon, 2008-01-28 at 00:05 +0000, Dmitry Baryshkov wrote:
> > As some of you know, currently I work on improving the Sharp SL-6000
> > (tosa) kernel support.=20

Do you want second tosa for testing your work? It sits here unused and is=20
property of OpenEmbedded project. I can send it to you on my cost.

> > 1) Add all my patches on the top of linux-rp-2.6.24 as the=20
> > tosa-specific part. This can be hard, as I touch various bits of
> > kernel, this can require major efforts.
> > 2) Just start linux-tosa recipe branch, importing few patches from
> > linux-rp, and merge them later.
> >    No major pros et contras.

[..]

> So I have a slight preference for 1 but don't object to 2 if you feel
> thats the best way to go.

Same here.

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

             Nonsense. Space is blue and birds fly through it.
             		-- Heisenberg




