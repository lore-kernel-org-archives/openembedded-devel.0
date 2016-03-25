Return-Path: <ryanelkholy@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id DA1B16FEE0;
	Fri, 25 Mar 2016 20:32:21 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id e3so10230465ioa.1;
	Fri, 25 Mar 2016 13:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=mP9ZmWrK14g7vy9TmiFPol915DmC2gCdpsmzSXOb6/0=;
	b=p7Bxxa3HOGPhska/mBxe1cqGQSDIG45Ho8RC7ArikFXktWCziTnoBuN22NHG1QAKDd
	9wwpVB41yTy/HBiUcUNkMfX4kTEJrFh2ueMo0p/y2HG3YY0UoY28zHHLW+SdDgqJxyxF
	PvnBlkSA41rMNbpe3XVYQsGffkgjOBPpURFJjXPeUNIXcM+Jdy5iEdTzO+ZngAg/1HAC
	TPfOPHax/LYorUlv9XjjwinPiLFdBnEeX6g0Enx1reb9uf5sEM5O4+LiPkNp+nnprULY
	HPjT9fTpipbWYMMxULhMAN8A8VJhTsGYD88MPKvJBk3ojH05u8eV6skgAXtInJIUB2pY
	ebHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=mP9ZmWrK14g7vy9TmiFPol915DmC2gCdpsmzSXOb6/0=;
	b=aLWaDcbePyGMVchTnxUbe3Puu6gujHsNvevXXkNPbzEympS3GhyZ1nmQVgqv/iEFOF
	R7JGDKxDbvYZvPLOcqRVAMCeLhSDLLxI1UWOnxRK+D3d9wo0Hcij8EPzwVRwRmCx271H
	+42iIF7TgXGe+P73loNB8XYL9CYYN5ofZ8r4WNal22G1BSUGgdqaOhPTyA0r7wLMOU1O
	h/M55PCP6WWlFSPnuQk6PFk1hwFXboybc0wEvIfKbD9lplbOZjJ54qgvnNZXQEI+uuRr
	Eoq1tPpo+ZCSoUYOW7JSF3eDGq6E9iDC1zQnZG2GiAEUZGDMWnOHvvUbfe0RlpdLPQI6
	hcQQ==
X-Gm-Message-State: AD7BkJKxIFjSOrgGagZjk3NP5bE4gfXJg0l3ZZQaTsw2zgenF7/Vl5xbx25sLFpKezdPF5+br5SqFq22U8t7yA==
MIME-Version: 1.0
X-Received: by 10.107.6.40 with SMTP id 40mr15666220iog.176.1458937941763;
	Fri, 25 Mar 2016 13:32:21 -0700 (PDT)
Received: by 10.64.69.138 with HTTP; Fri, 25 Mar 2016 13:32:21 -0700 (PDT)
In-Reply-To: <1604312.a7pP1GrPCb@rjs-zotac.streifs.net>
References: <56DEF97F.9070306@balister.org> <1458767514382.89578@seescan.com>
	<56F42DA1.4090902@balister.org>
	<1604312.a7pP1GrPCb@rjs-zotac.streifs.net>
Date: Fri, 25 Mar 2016 16:32:21 -0400
Message-ID: <CAMZfsd43wWQTZGp=FWvHATXyvY2YQASaiSAWdeatS=hviPQ4uA@mail.gmail.com>
From: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembedded-members@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [OE-core] OEDAM, April 8 in San Diego after ELC
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
X-List-Received-Date: Fri, 25 Mar 2016 20:32:25 -0000
Content-Type: text/plain; charset=UTF-8

Is this something beneficial for beginners who are getting their feet wet
in open embedded? Also, where do we register?

On Thu, Mar 24, 2016 at 2:36 PM, Rudolf J Streif <rudolf.streif@gmail.com>
wrote:

> Since I happen to live in San Diego, I have been asking around for a
> potential meeting room (unfortunately, I don't have an office with a
> meeting room myself). I am currently working with the University of San
> Diego and the Catamaran/Bahia Hotel. Can't promise anything yet.
>
> :rjs
>
>
> On Thursday, March 24, 2016 11:10:41 AM Philip Balister wrote:
> > We are up to fifteen now and as noted will have some off site attendees
> > and late sign ups.
> >
> > Philip
> >
> > On 03/23/2016 02:11 PM, Fred Ollinger wrote:
> > > I'm coming and I'm probably brining another person.
> > >
> > > I still have to make the wiki account which failed for some reason
> before.
> > >
> > > Frederick
> > > ________________________________________
> > > From: yocto-bounces@yoctoproject.org <yocto-bounces@yoctoproject.org>
> on behalf of Trevor Woerner <twoerner@gmail.com>
> > > Sent: Wednesday, March 23, 2016 2:08 PM
> > > To: akuster808; openembedded-devel@lists.openembedded.org;
> openembedded-core; Yocto Project;
> openembedded-members@lists.openembedded.org
> > > Subject: Re: [yocto] [OE-core] [oe] OEDAM, April 8 in San Diego after
> ELC
> > >
> > > On Wed 2016-03-23 @ 09:36:40 AM, akuster808 wrote:
> > >> There are only 10 people signed up.
> > >> Is that enough people to justify the expense room or even meet?
> > >
> > > I have no idea what the budget might be or what a room might cost.
> I'll leave
> > > it to those who do know to worry about the costs versus the benefits.
> > >
> > > In any case I certainly think it's still worth meeting. A smaller, more
> > > focused group can sometimes get more done than a larger group.
> Secondly, it's
> > > my experience that more people always show up than sign up.
> > >
> > > With a project like this there will always be things to discuss, and
> sometimes
> > > a discussion goes better in person rather than online.
> > >
> > > Best regards,
> > >         Trevor
> > > --
> > > _______________________________________________
> > > yocto mailing list
> > > yocto@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/yocto
> > >
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

