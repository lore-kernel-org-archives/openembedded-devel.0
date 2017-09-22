Return-Path: <jefro.net@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED47783C5;
	Fri, 22 Sep 2017 20:51:18 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id z39so1745523wrb.8;
	Fri, 22 Sep 2017 13:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=/P41Q8rFURFvmSXiAqY1ubEmMnsQXImpPHD1asQAkfk=;
	b=NHrYcq25nU08bS1HBZO36Qy6E8ESweCdmQTuEFNFchy0QkYYHuSDSazad6ptfdX7BF
	jweAARAt6SPvno4p0v1S8uFZjBFB6FVI+Qn+MhYJWBenyVtE4/8w2EMUH3jXvhZ+EJS4
	GmeAYWWHVc6cImS8xQEJp33tliyXiydr5xipxPVHmkG1lLNhr/0gqDOzodr3paGkmRGm
	ro3QD+Pqf/KLFvPbyb8hmyzv80ia5SaMke9+tE9pNfarmmvaBb3ukto1WC/P33YSQFbJ
	ybre0N3D0mgRL4tdOMJzxfsaCRpXYZQagjyTJxJwsckIYvMJQGqiMTKoqU0WqPC/9PKE
	CswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=/P41Q8rFURFvmSXiAqY1ubEmMnsQXImpPHD1asQAkfk=;
	b=C4unvb3QD0CxUYPZDS2BNeI7F4uyBeKHncsHWM678DbGsf/654T8wZVCEhRvZI1jdd
	OHB1UX0flyjvqyOECHNRt9ESLAvLn3X/OjpXlUphaL5EzqoiYGV9ey4ngHM+GOfTKWA2
	4HZYiuas6+9D8YqhZHgpqA+H6pqoSpD3TGw8vZy2D3VmJyCvRdKNuafvXUE/lvKFfBog
	BYqwEcdKFW0qNhue8yN6qCZR+6Iyw4+IN7el93ANfKVrNo7SMT6YiuCecr3THM+7PeOD
	oUi8DjJsM1M0mUOOzf5ZTCyRkqc6GM8zQRCeNxB5TubzpqngKO71MlaMeYDfLZeJgP1w
	sOGg==
X-Gm-Message-State: AHPjjUhmFrEdynaSrzL8ymQzY/2sCr8eAEcJxsWzoUHK6msme2qhgOBw
	1c4Chb0NTnbnouhH9JO3nvMgTWSTZs1FswM4quw=
X-Google-Smtp-Source: AOwi7QBOyEvWG03uzZbHD6oThmb0Q3H60NsY3+9iiddCnkMnoelGN/FUTVhY9n7XAtarabGFmlC3s5ryoc22ALeGX2U=
X-Received: by 10.223.145.5 with SMTP id j5mr269803wrj.114.1506113479227; Fri,
	22 Sep 2017 13:51:19 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.223.134.180 with HTTP; Fri, 22 Sep 2017 13:50:58 -0700 (PDT)
In-Reply-To: <8eedf692-5a12-f5a6-b9da-8184849a7a50@gmail.com>
References: <c2ec1aa7-8279-78f1-6523-c345af1ffe8f@mentor.com>
	<CAHUNapQDGe3b4Nmg6OmL0hxkMGyY9e3z=GKdkOW8VuJe9-q2Ew@mail.gmail.com>
	<CAMKF1spb4tz=te84G=JA40HxiF+wX=YSJnJcK8viyx_OwZ87uw@mail.gmail.com>
	<CA+YB3rZv+=nB=7J98XGqemV5GHW3QkmA7siyn-vArqfK8GHKmA@mail.gmail.com>
	<8eedf692-5a12-f5a6-b9da-8184849a7a50@gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Fri, 22 Sep 2017 13:50:58 -0700
X-Google-Sender-Auth: cihyw5iEWrPXJSgS2mZDafz1JJQ
Message-ID: <CA+YB3rZd0P6eVimXD5jN0UZMB=dH2h2mdScmeB8PtjSWLZNMfg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: OE general meeting before OEDEM next month.
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
X-List-Received-Date: Fri, 22 Sep 2017 20:51:19 -0000
Content-Type: text/plain; charset="UTF-8"

Up to 36 now. I am in touch with the venue. The table was originally set
for 30 and could comfortably accommodate 34 in boardroom style. Given
natural attrition of 10% I think we are okay in this regard, with
latecomers seated around the edges. If we grow much larger I will either
have to pay for a larger room or ask them to seat the room theater-style,
where it can probably hold up to 50. I'll see how we do later in the cycle
before deciding.

On Wed, Sep 20, 2017 at 5:57 PM, akuster808 <akuster808@gmail.com> wrote:

> Jefro,
>
> We have 33 folks listed. Do we have room?
>
> regards,
>
> Armin
>
>
> On 09/20/2017 11:24 AM, Jeff Osier-Mixon wrote:
> > Zoom might be easier, as people can dial in or connect online. We'll make
> > it work.
> >
> > On Tue, Sep 19, 2017 at 12:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Tue, Sep 19, 2017 at 9:54 AM, Trevor Woerner <twoerner@gmail.com>
> >> wrote:
> >>> On Tue, Sep 19, 2017 at 11:34 AM, Sean Hudson <sean_hudson@mentor.com>
> >> wrote:
> >>>>   Meeting information, including dial-in numbers, is on the wiki. [2]
> >>> In addition to the above, we could also make use of the little-used
> >>> #oe-meeting channel on freenode (?)
> >> +1
> >>
> >> I can dial in. Or someone can setup a zoom meeting
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >
> >
>
>


-- 
Jeff Osier-Mixon - Open Source Community Manager, Intel Corporation

