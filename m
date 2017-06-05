Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2356D77F76
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 12:48:04 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id 63so40442764ywr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 05:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=++tKKnFcqhc70qMmph0HzU7ubJR75HvS46oQjrVPGu4=;
	b=VjntGQi7aVDyrhRmvZlGp2tHn/liek+p0dcgVpYg/q/4yjBS3mYvx8ee1ZtBxfSVbE
	IzrleWZ+rIgdqEaSGqZcSo6F9P6bquuYzA9g8TeT1fsygiRJAz4t+FuhBd+Y2bBGiGDe
	1BmrCUjIO2/H3YO5SMUKIHuHJXcQp161mdBICDGXPvB/7y7O+S1z+adJyR1+HUpbKAr3
	OsCVxVpAnoPdDc8IV41GSFEyV1OsqRTs8sGWyVLBEvHylhIfdcXMZ0rvUVN2Sv85lR6n
	pFEZMn37m9ADS0md+F0q86NR9wCmEu0jvqAP3hsI2xNjaeMoIhqFKNwHmNPk1yB6j1hA
	hldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=++tKKnFcqhc70qMmph0HzU7ubJR75HvS46oQjrVPGu4=;
	b=HH5VaPW++achD1OQSI4XeS/UVRKAUpt1+AzIefwo593vbcUd/opYu1gr7LC++5CHa7
	CkDfrdJlCI+/2UV407aFxDON1It0bXPQpbIzeBy3B9XnSSkJQp5uPRf1x0k8yZbvY0ZZ
	QHEAupENX5f5DfVdcPCZXqo6uSV3tCIODDg1wNJYlJsc9yxpy8IlUNSdiPocGHnINzu1
	YrBzYuUwRollvZQyNHIH+kQUvXAH9eykz0n7xAwAMLfgFxGPI9qMRowznVGsA6TmGK0F
	hlA9XNPXJEs1Z3fIiLTpdkXY3Qetq6ZeTWw1qzLOkYc3GbOyL8WMVveyeGG7p6dFLyIE
	vUyw==
X-Gm-Message-State: AODbwcBt4rSi4IapE2N5ottuboYG8u1GQGu6zLXOQ9EOrk91frInyFsb
	h85k0xIzL4nmNrnKD4xWeNGHFPMGpg==
X-Received: by 10.129.55.14 with SMTP id e14mr6656913ywa.33.1496666886172;
	Mon, 05 Jun 2017 05:48:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Mon, 5 Jun 2017 05:48:05 -0700 (PDT)
In-Reply-To: <CAL2S=Ku1-Ycwo9FhJhnr=_D9UuQYS6WC=841pu8A20YDR8x+-g@mail.gmail.com>
References: <AM5PR0402MB2769D2B8C27E4DDADE64D7CEC4F00@AM5PR0402MB2769.eurprd04.prod.outlook.com>
	<1496243833.26945.66.camel@linux.intel.com>
	<CAL2S=Ku1-Ycwo9FhJhnr=_D9UuQYS6WC=841pu8A20YDR8x+-g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 5 Jun 2017 14:48:05 +0200
Message-ID: <CA+chaQfSfrAcYyJ_0vh52E8gzAgGzDs8yEhwrg7hPgtExOiZbA@mail.gmail.com>
To: Greg Hwang <greghwang@gmail.com>, akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: URL of devmem2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Jun 2017 12:48:07 -0000
Content-Type: text/plain; charset="UTF-8"

I've moved requested backports to morty bundle in patchwork (and added
armin to improve the chance he will notice them and include them in next
pull request).

I have restored the old version of devmem2.c on sources.openembedded.org
(there was still copy of it under the name
devmem2.c_bad-checksum_be12c0132a1ae118cbf5e79d98427c1d)

The sources.openembedded.org is updated automatically from my "bitbake
world" builds, the only reason why this "old/new" devmem2.c appeared again
recently is that sources.openembedded.org syncing was broken for some time
as explained in:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-May/112917.html

So the first change changed the devmem2.c content, was built in my "bitbake
world" builds and updated on the sources.openembedded.org, but in wrong
directory so nobody noticed the issue, then Denys sent the fix and
devmem2-new.c was added to the same folder, but the old filename was
already updated. Now when I've fixed rsyncing both versions of this file
became the same and older releases got broken.

> What is the recommendation for developers who need to stay on older
branches such as Jethro for development cycle reasons?

I would recommend to maintain local source mirror as PREMIRROR, so that
most of the network traffic is contained within the company and the builds
continue to build correctly independently on outside world.

>   Is it as easy as
contacting the maintainer of the open embedded source mirror to check if
devmem2.c has been modified lately?

It was modified long time ago, when the first change was tested on my
"bitbake world" and merged to master (before the 2nd change was tested and
merged as well). But it wasn't visible to other people because the rsyncing
issue which got fixed only recently.


On Wed, May 31, 2017 at 6:15 PM, Greg Hwang <greghwang@gmail.com> wrote:

> Martin,
>
> I noticed this issue with devmem2 as well.  I did some digging and I found
> this post on the mailing list from Dec 2106
>
> http://lists.openembedded.org/pipermail/openembedded-devel/2
> 016-December/110568.html.
>
> Its possible that lartmarker domain has been down for some time.
>
> It looks like the version of devmem2 on sources.openembedded.org has
> changed and is now identical to the the updated devmem2.c on free-electrons
> mirror, AND it is the same as the updated version in
> http://sources.openembedded.org/devmem2-new.c.  This means the checksum on
> the open embedded mirror doesn't match the checksum called out in the
> devmem2 recipes older than pyro.
>
>  What is the recommendation for developers who need to stay on older
> branches such as Jethro for development cycle reasons?  Is it as easy as
> contacting the maintainer of the open embedded source mirror to check if
> devmem2.c has been modified lately?
>
> Greg
>
>
>
> On Wed, May 31, 2017 at 11:17 AM, Leonardo Sandoval <
> leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>
> > On Tue, 2017-05-30 at 20:10 +0000, Martin Siegumfeldt wrote:
> > > Hi,
> > >
> > >
> > > Is there any chance that http://git.openembedded.org/
> > meta-openembedded/commit/?id=fc801961457fe2fbb24973bb43b302ad46044cb8
> and
> > http://git.openembedded.org/meta-openembedded/commit/?id=
> > 6c584374a599f6f8d3607f20ecfc13a67ccf1da1 will be backported to release
> > branches? lartmaker domain seems no longer available - AFAICS all
> branches
> > older than pyro is affected.
> > >
> >
> > without much contexts on these two patches, send the backported patches
> > with proper stable releases names as prefixes to the mailing list.
> >
> > >
> > > Thanks,
> > >
> > > Martin
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

