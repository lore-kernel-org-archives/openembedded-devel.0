Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1E67E1D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 17:33:09 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id f10so202576wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 10:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UL3Nl1WLOO2def5/JVfIgNjhVx29/tOG0nEBOP5PNs8=;
	b=UJKrS7IoYX4pK0+4q50o+LpMJf+x5NQvl0IyJQyOSQuQUsGRUb5pjwVx/NEwYvgLw9
	78o35LTb720HNj8Hzj9WS7Qq5IPKmOERUJqovPbUz1HNSMSklpBJOz+r7dPznPP0k9eJ
	QiYKbL4aTlt9m7yM4SixDznVYD/KdhUtfqXTCmDW7kgfeteLA1a/N5lKeB7I6xyhSovk
	ExbowCvOTUrNVEP/+VwOUG0RQyZJnDZvJbRGoOtVhj3Umw0/2CuKc9GdGhjEZS4NZdOJ
	pvn1guTyHxxIhckRiw5LXOtxWFUYJCR/b5w2RvlUauma4Hys9h1ISbiHvggJlhepHK0L
	v15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UL3Nl1WLOO2def5/JVfIgNjhVx29/tOG0nEBOP5PNs8=;
	b=QjWzd1rRtE+H09CW2RE56R6Rs4XDBxf3ZPuS3F3djy9ioNe+mYk2rnN/ZkqtcX3mxR
	sbalvQIlbTrh5UiJyauscMCmD5FtxRGhvbkPftHD3HCvamkQj83bZzB2w5B+kkSdeMBg
	YiQQJzlMZwP/9W7AOEFRI7+U5tKcnJWttT60V94aGnbmfAxXFBeXAkIYkyuuiosqDig6
	k/kHJpA3mdGK3nySiDhjvim2cMqoWdMQIunn4PAVeQv+aZoa6ac+9hRXILzw7/1q/sGP
	rfr17RLixRWt30xKWcJu3C++rtU2Pfwqc4+hEVH0d2uwMBvV4nhs979uJ2CMBv+TraQx
	zw/A==
X-Gm-Message-State: APjAAAWcFi3G8/oMWc6r/1+5E3oh4S8sSB7t5gqjNP5CtPrhnIy3/THM
	4OLc38cHkJ3OTW8qS4Em0o+1w4QLQUTAgKnfXkE=
X-Google-Smtp-Source: APXvYqwwos/OpRkpcEL6y3QxgSOWFK7zE5m3rp0ExC0n8yw/20aG7xIeqprkCAN3qJCiwoKoaWd8uDnIkth9tHi4svg=
X-Received: by 2002:a1c:be12:: with SMTP id o18mr133923wmf.124.1558978389845; 
	Mon, 27 May 2019 10:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv34HAOaAaO1cyiQbR8P6mQPp8p3gCT2jM=UyQDGfvV-fYw@mail.gmail.com>
	<CA+2YH7ud9TX=ohQSk8XY=GzpewzFsXo6Z2eBJ=bXacyAsojV9A@mail.gmail.com>
In-Reply-To: <CA+2YH7ud9TX=ohQSk8XY=GzpewzFsXo6Z2eBJ=bXacyAsojV9A@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 27 May 2019 19:32:57 +0200
Message-ID: <CAAfyv34jJ362tu3x_8J1+FuV3zFpchkB8Ft9w-WERrxCNPxbvg@mail.gmail.com>
To: Enrico <ebutera@users.sourceforge.net>
Cc: yocto <yocto@yoctoproject.org>, Sergey Lapin <slapin@ossfans.org>,
	Nicolas Aguirre <aguirre.nicolas@gmail.com>,
	OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: meta-sunxi maintained?
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
X-List-Received-Date: Mon, 27 May 2019 17:33:09 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Enrico,

On Mon, May 27, 2019 at 5:44 PM Enrico <ebutera@users.sourceforge.net> wrote:
>
> Hi,
>
> i try to keep it maintained, but now i just have a lime2 for testing
> on real hardware, and i don't have the resources to do test builds for
> all the supported boards.
> Your help would be welcome, i can't check right now if i have the
> rights to add you as co-maintainer, anyway i will add you.
Thanks I have few sunxi based boards so can do tests also on my setup.
Pls ping me when you will add me. Thanks.
>
> Thanks for the help!
>
> Enrico

Marek
>
> On Mon, May 27, 2019 at 4:50 PM Belisko Marek <marek.belisko@gmail.com> wrote:
> >
> > Hello,
> >
> > I'm just curious if meta-sunxi is still maintained? I was contributed
> > to layer back while and when look now thud branch is un-compilable
> > (dri2proto not replaced) and warrior branch not created yet. There is
> > 14 issues + 6 pending pull requests. Added maintainers also in CC. I
> > think it would be good to have sunxi properly maintained as boards
> > with sunxi processors are popular. I can give a hand as co-maintainer
> > if necessary. Thanks a lot.
> >
> > BR,
> >
> > marek
> >
> > --
> > as simple and primitive as possible
> > -------------------------------------------------
> > Marek Belisko - OPEN-NANDRA
> > Freelance Developer
> >
> > Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> > Tel: +421 915 052 184
> > skype: marekwhite
> > twitter: #opennandra
> > web: http://open-nandra.com

