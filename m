Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4BE277FE2E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Sep 2019 06:36:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46ZP9w0yFjz4S;
	Fri, 20 Sep 2019 08:36:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568961364;
	bh=oIJ2gyY0Na62yQFSXCQnguB7onQqD3Z8//aUyLDF+o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=II2LSAnBBcP5a2hZgw7uXAWGIUlX/1MA701qqLN1mfc3d1FxqDiqleUPBvGnWuceh
	B7sbVHaHFnFnpy/lHMVgXBnLfqjZ16WeP+htEbgBW+Wa0JCQ0FWsiTvJ9D5NOUlNte
	4NjFYpJkOvwUitq5yfcnztscKJMBBiMpCpf/NjJXblyjrVB5ZrMU9WL96IkFlmyXcO
	ct5/tSbAqigCuQQMFZavZ6ykr8TSCUau3L77WLx2Nk/WL3kxZCOGNlpl6bCCWOLOid
	im25KUm4EklbTYvL7wjhOeIciibZ9y9KCqdVioBKB30NKH2tgEAi8lgQWdczi8v1z6
	0OkIutFY5BnE9fQRjpZbwpq0YiGoBIJhUVZaQPhgBNITnGyGilKNmC9Hw9INoWl8ep
	54R9e6IlhTp89mThVQHkABD0YQ1pRNu4XeSXSsVor6SCpe+W0DWJKyLtbj4aasjcol
	ppf6qGy6KefD8yk4eBaTBPURoni6sBw8xN38L+NY7LcUN7ZTysnikwaO2XpnNYJiT/
	lyyLTvGiUNLND+Sw1K3ieTBQbBjvi7L0H3Np/qj8ex7xjnjoNxAyCfz1UhOmt8tXAn
	A07rsnNwjXpKYRjZRw/UHY2+2f4MytDEmUJ0/D8VqUNxbetoomSerVFddKkC/ysWDl
	hgqno5TbDVT6xhoNzWkJQuKQ=
Date: Fri, 20 Sep 2019 09:36:01 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Andreas =?utf-8?Q?M=C3=BCller?= <schnitzeltony@gmail.com>
Message-ID: <20190920063600.GA8562@localhost>
References: <20190817081339.22253-1-schnitzeltony@gmail.com>
	<20190817111825.GA2828@localhost>
	<CALbNGRSBQv22cpj+T+KBS-1oOhpUomXBN78FHhFw52=pGEOp9A@mail.gmail.com>
	<efd5c05c-1275-8077-84e1-f17fff05f8f6@gmail.com>
	<CALbNGRQnxLXFXoSkPxWnFZJHWWdDvVP_=i9-ybYOVGzirty6Uw@mail.gmail.com>
	<CALbNGRSp+UH2gaBe5QdUTU4R4kui4ny8TbVnqEt442-0pA8onQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSp+UH2gaBe5QdUTU4R4kui4ny8TbVnqEt442-0pA8onQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior][PATCH 0/4] vlc adjustments
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
X-List-Received-Date: Fri, 20 Sep 2019 06:36:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Sep 20, 2019 at 03:14:04AM +0200, Andreas Müller wrote:
> On Fri, Aug 30, 2019 at 10:51 AM Andreas Müller <schnitzeltony@gmail.com> wrote:
> >
> > On Thu, Aug 29, 2019 at 4:16 PM akuster808 <akuster808@gmail.com> wrote:
> > > > Ping
> > >
> > > in stable/warrior-nmut for testing.
> > >
> > Thanks
> >
> Patch 3 was applied / 1,2,4 not. Shall I resend or is there a reason
> not to apply them in warrior?

2 and 4 (written by me) were not applied since I recommended against.

Patch 1 I don't have an opinion about here, but Armin might have 
misunderstood my comment as disapproval also for this one.

> Andreas

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


