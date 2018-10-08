Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail.openembedded.org (Postfix) with ESMTP id 36E6078F5C
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 17:15:26 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id x8-v6so12514341qka.4
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2018 10:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=c9Of6Gup7qcPXUsjxmjd7CH1t+sdVWjCx/jY6NtSK+M=;
	b=AMlalVUsunKSpQFzCHo74TmopsLO4a6U2Q1XBuDmoS6GJ/qLtSrrglyP/ZusTElr5E
	OWEtNshW55E6j6wSLz3te6WD/kO6J7gy5WPY1hS1+aBjZ8+6bsL7Te4TrncyAgwaT+lz
	6/Qqwv6sEsYoyLpYXfLdENqwSAMqD+L7driqLHRsimI07ngP8508CaAhGGmK1JEZL3XL
	upC3lrvtvsN9PAnMvf2J0Y5LOjE/nzO6AuS1Si2ll2E4U9MSjl2oxDiC9g1jh2cvB1Ho
	ozEiFHPEq3wOqPhFlXtWvATj0UWcvXJ4iX7w3Q58iNIZLCJiADA9/2Bw3zZZdBRSmvfX
	iRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c9Of6Gup7qcPXUsjxmjd7CH1t+sdVWjCx/jY6NtSK+M=;
	b=DpGTRf9XAchO6/YKWDZzN3ODQAkfZUjm7RitN4s7Q/+dihK84zIITsP0t5q3l3U2Zd
	sHAbaSQ+6iUbgEUdLkjtAr9hc3U6pS77Tcy+FsE5qP+kUCjlsEbZgBInZw/N9dT4prsX
	LgPZ/MdOP6IW/jkC0p8piMxDvD7vJ14qmjMGIT1N5S4tOVMOhIoG2v3rHfoT4iWftT4C
	KE3WualPJqI19dIQL2q7J4IgiPcsf3o5HgvdgYOyY9pXTBWvfGAzNlGix32+LufBDuM9
	YsttYoDiZu1J9kt9qU1w6hE5+Onjnxu33DDrcG8Hbs+aH2leosYZdT3bKVtYL+OADjX/
	Z5lg==
X-Gm-Message-State: ABuFfoj/77Uv2jz+GXzXXmr3albuenhB/mun4B6YCJxX3EAKOGv7ajnr
	JH1syDEsLsdKvLUF0q4NXw9i7joHLVYOUXc7BSY=
X-Google-Smtp-Source: ACcGV63FbyTTOf/GkuaRG7ONtmSclqG9ldC5MpJpIoIUmY0StWGVuDEKExmzcnM+2Enz0BzpZTKfLRAgyIfT+Jbs1aY=
X-Received: by 2002:a37:5003:: with SMTP id
	e3-v6mr8379402qkb.102.1539018926920; 
	Mon, 08 Oct 2018 10:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sr8XFvPcu-jU=hssJCEyBkP0GeZGYLT+F71ZMPD=Ve7Uw@mail.gmail.com>
	<4c77c609-54ad-fb02-84c4-fd118a107d9f@gmail.com>
In-Reply-To: <4c77c609-54ad-fb02-84c4-fd118a107d9f@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Oct 2018 10:14:59 -0700
Message-ID: <CAMKF1sqVPsdWP1H3D7N+Y=xRLBMLrvjHQHjWdxft_JFpqxOzFg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: meta-openembedded thud release branching
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
X-List-Received-Date: Mon, 08 Oct 2018 17:15:26 -0000
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks! Armin
On Mon, Oct 8, 2018 at 9:51 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 10/07/2018 09:55 PM, Khem Raj wrote:
> > Hi All,
> >
> > I plan to branch out for thud really soon, and it will happen in sync
> > with OE-Core, once branched
> > I will maintain thud and master in sync until final GA release for
> > thud and then release for more
> > invasive changes.
> >
> > At this time I am also looking for release branch maintainer for thud,
> > so if you have interest and time, please sign up.
> More than happy to maintain thud. I will post a patch once you branch
>
> - armin
> >
> > If you have changes that you plan to include in thud, please send them
> > as soon as you can, if the changes are invasive then we might have to
> > wait until 2.7 development opens.
> >
> > All feedback is appreciated.
> >
> > Thanks
> > -Khem
>

