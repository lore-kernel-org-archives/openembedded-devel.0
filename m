Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <g.eismann@gmx.net>) id 1M5RtI-0002iD-Vl
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 23:58:01 +0200
Received: (qmail invoked by alias); 16 May 2009 21:50:53 -0000
Received: from 247.70.222.87.dynamic.jazztel.es (EHLO inferno.localnet)
	[87.222.70.247]
	by mail.gmx.net (mp008) with SMTP; 16 May 2009 23:50:53 +0200
X-Authenticated: #21729387
X-Provags-ID: V01U2FsdGVkX1+m5QJOAJimrRpy81R69prbx1g3EB5tk7mbkMkdHs
	eSRvqT6HBKqBlL
From: "G. Eismann" <g.eismann@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 May 2009 23:50:50 +0200
User-Agent: KMail/1.11.3 (Linux/2.6.28-11-generic; KDE/4.2.3; i686; ; )
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>
	<200905161121.55689.g.eismann@gmx.net>
	<f96d234e0905161438u2bd28611lb3041e4dc5d0afe8@mail.gmail.com>
In-Reply-To: <f96d234e0905161438u2bd28611lb3041e4dc5d0afe8@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200905162350.51366.g.eismann@gmx.net>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.64,0.63
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Kernel modules
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
X-List-Received-Date: Sat, 16 May 2009 21:58:01 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On S=E1bado 16 Mayo 2009 23:38:20 Cliff Brake escribi=F3:
> On Sat, May 16, 2009 at 5:21 AM, G. Eismann <g.eismann@gmx.net> wrote:
> > BTW, is there any way to install the modules but not the kernel image?
> > I have the kernel in a separate partition, so I don't need it into the
> > rootfs.
>
> One way is to put the following in the kernel recipe:
>
> FILES_kernel-image_<machine_name> =3D ""

Thanks for the response. I'll try it.
=2D-=20
  - Eismann -

