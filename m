Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id BCE40719DE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Oct 2016 21:10:44 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id u68so20652032uau.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2016 14:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ma7xpV6LIpzsg2BXgglA97g8Ak45vvthWSJp7zlaq/A=;
	b=oekEjn2Ynp1V3vdVmcUGUBEDD3HGHs66avnQujDyR1jAPR/NS37pvJ26Bs8EzVNxf0
	hHEV8Dwja6saJl2SsE3/U7jbdzLba2Z9C2enTCoPxsIIkkTTMvZYX9pHKBhjStHdAx6F
	cUQO4EtJtU2MLRC6qvfElWiLfng/V4Y9VEUG6ZnDe8ZalWgfLXbu9I59EybIyrV3nHIh
	DStNYXvVMe5jU3Y/JFcwXhxJhN1ucaB63AhSbsT8mpq3G40Y8sRJOZFAM6gA2LMhdeXx
	yysAbB4IZhbQTy9l4XeC/4rOH58K9C0m4JOgsQtVWys1gQOPvPRhx9hm0ocjyb9s+Pfn
	zcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ma7xpV6LIpzsg2BXgglA97g8Ak45vvthWSJp7zlaq/A=;
	b=SaVdoQ8f9qX8dHZIZ7hybB3OOl1Oqbph67zBvRxhMAZ0N6vorDAbDRzxG/O6s6cdof
	xNAuuZflAiNK6Q8JQq6P13d6vFWcPs8Kny/wGKaOAevaGi3GnGn97SxBhjmF0bupxZZM
	2IEk3qpdjgJx/yVbqHPFSLwbOrwKczL2RaSOpZEztmQN61Xuh4ffeWH8rcr8N/kFpPLi
	In2DOZkKHeVlsXdwh9nDz2b0ZfHw4UU9/B4V6K1uqdSV0XnDxSDKOx5mX+ji7VpJzvuU
	Ucgrtn3T/R52lUfmppkCn7z79fKwMYJds7yx14zNBaLe+kTgTym9sTokKHmHzUaYqxa3
	wo7g==
X-Gm-Message-State: AA6/9RkXBLVPjubvUJV+mOTpqp6UgiMvZo5TpjkokbmEy+vy2BioEIuWFLPuIunzys1yBSTQbiPplvTM0DJk1A==
X-Received: by 10.176.3.135 with SMTP id 7mr75626uau.78.1475529045824; Mon, 03
	Oct 2016 14:10:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.114.9 with HTTP; Mon, 3 Oct 2016 14:10:42 -0700 (PDT)
In-Reply-To: <CAP9ODKrB3rdsRuoxqYrO3vPsMDuYC7g=ZHNeAjqFW18JJ5Cvww@mail.gmail.com>
References: <20160929133054.20096-1-ruben.de.smet@rubdos.be>
	<CAAPZna1EHTEKernEX88FO5gv=1m5VrEhf-S3LB6EDF91j8vd2w@mail.gmail.com>
	<CAP9ODKrB3rdsRuoxqYrO3vPsMDuYC7g=ZHNeAjqFW18JJ5Cvww@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 3 Oct 2016 14:10:42 -0700
Message-ID: <CANx9H-AwOJbZ_VXfJ5B8RXzQhs+M4dBZVOzJvM+PDcSwzq7QDg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-scales: add recipe for version 1.0.9
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
X-List-Received-Date: Mon, 03 Oct 2016 21:10:45 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 3, 2016 at 12:58 PM, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Thu, Sep 29, 2016 at 10:54 AM, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> > On Thu, Sep 29, 2016 at 10:30 AM, Ruben De Smet <ruben.de.smet@rubdos.be
> >
> > wrote:
> > +"
> >> +
> >> +DEPENDS_${PN} += "\
> >> +    python3-setuptools \
> >> +"
> >>
> >
> >
> > Is this not provided by setuptools3
> > class?
>
> The DEPENDS being PN specific is pointless also Fabio raised a point
> which seems ignored.
>
> Martin, please drop this from master-next until it is fixed.
>
>
Agreed. Thank you for the review.


> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

