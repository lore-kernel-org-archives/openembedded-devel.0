Received: from [66.249.82.237] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Ivj4X-0007hC-Vl
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Nov 2007 01:40:38 +0100
Received: by wx-out-0506.google.com with SMTP id h27so1650877wxd
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2007 16:38:08 -0800 (PST)
Received: by 10.70.42.6 with SMTP id p6mr8770159wxp.1195854687522;
	Fri, 23 Nov 2007 13:51:27 -0800 (PST)
Received: by 10.90.29.19 with HTTP; Fri, 23 Nov 2007 13:51:27 -0800 (PST)
Message-ID: <c384c5ea0711231351u1b91c5b6o437ecc5d512991e8@mail.gmail.com>
Date: Fri, 23 Nov 2007 22:51:27 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <05db01c82dfe$1401e230$6e01a8c0@twilight>
MIME-Version: 1.0
References: <E1Iv6U0-0003D9-3S@linuxtogo.org>
	<4746C4A5.6040501@student.utwente.nl>
	<05db01c82dfe$1401e230$6e01a8c0@twilight>
Subject: Re: [oe-commits] org.oe.dev SlugOS: ixp4xx-kernel - added 2.6.23.8 recipe and supporting files. (Note that
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
X-List-Received-Date: Sat, 24 Nov 2007 00:40:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

On Nov 23, 2007 7:24 PM, Mike (mwester) <mwester@dls.net> wrote:
> Koen Kooi writes:
> > mwester commit schreef:
> > > SlugOS: ixp4xx-kernel - added 2.6.23.8 recipe and supporting files.
> (Note that
> > > SlugOS still selects 2.6.21 as the preferred version for now.)
> >
> > Why am I forced to download a 40MB 2.6.23.8 tarball instead of the small
> > 2.6.23.8 patch? I already have 2.6.23 in DL_DIR.
>
> The set of developers that will actually be using that recipe is
> extraordinarily small (two at present), so the relative benefit of such
>
Sorry, this seems to be some misconception amongst the nslu2
developers. The use base
for the mainline bleeding edge kernels is much larger*. I assume that
every active board
developer want to try and verify the new kernels against his hardware
*and* is using OpenEmbedded
to do so ;-)

Regards, Leon.

*ok, so more than two, maybe three :-)


