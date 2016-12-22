Return-Path: <ka6sox@gmail.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id B56EF776A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 17:19:24 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id t125so118279326ywc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 09:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=EG1SB2cfezOAXiYRIdZYjYKETyRKMZuSOchl7LQh6N8=;
	b=crRcGB9QzkAhoyRgeoyqya71hc04T2UswHw7OjsdHCg/ylvAne0/vtVOEleutUsiXu
	MFVNTmkIF8srOofsfAw9QJOdDeZTdDcMVki9da3svIt5fVl5oFpZ9M6uT+Oaoj1+xXan
	MYmungxQd7evV3RYTbLOzOXMv6BLVkXtCXO2FvrXQhK29d2gAM5f3tAJU3tAJib/V46/
	7ToCovvvg7ztj76rwv4KiJUD8UQUmgfa+scrSQ5qwXWzcEHe7ykmDYT382VVfeJZ8/Th
	HOVgv2eIBXAgQkMyYERWFRU0jGQ3cXPbJLZQTUA3R2N9o5WtiwNr2ym06mqOYvrp+KqO
	RReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=EG1SB2cfezOAXiYRIdZYjYKETyRKMZuSOchl7LQh6N8=;
	b=O8iMOcEfrLBtWBpDpsF3OquqdBs8pXhda2iAqZUfsC0heM+t0+HCVfm76OKaHGyRAN
	Vw5kMPvE3qSPE7JJEOClJaA8jCuaLVopwaBdJ9zA1f2euOpOfCBOR/0pQWGmpXy1nigM
	2IrEOTpGdAZBUYs6FjYfjMEyaxHJ4G2Df4GTCsj0ZvkTRBwuHQQGkrlp8wDCYHUalyex
	F6cnqALdILB8CgIkxn/oTQcQx4QhEbzVJgPE+D1Fz7T+NolV6OdZ6JxeT2UQFS9rtvf6
	0vo1cwOddyZJvpS6gjgom5NHaFnUhvcfkebPOwQ+3+FDQyr/zpo5iowjV1yhm38p9oC8
	WDjg==
X-Gm-Message-State: AIkVDXJgb3YByaL+kmZ0EyFEF3cw1vLizCK89CGgpcVdKK8FkPMNssF3cYSfVvJuNHYsQ+FQ2Gz+sFFugsDXFA==
X-Received: by 10.129.169.132 with SMTP id g126mr8472115ywh.92.1482427165749; 
	Thu, 22 Dec 2016 09:19:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.170.43 with HTTP; Thu, 22 Dec 2016 09:19:25 -0800 (PST)
In-Reply-To: <E628426E-84F8-4EA4-A296-D32C3339DF1C@gmail.com>
References: <CAHQecY48gVbt4S+88MHivSbv-Xdn29WRq5RPL6+QDVGYUPCwYw@mail.gmail.com>
	<E628426E-84F8-4EA4-A296-D32C3339DF1C@gmail.com>
From: Tom King <ka6sox@gmail.com>
Date: Thu, 22 Dec 2016 09:19:25 -0800
Message-ID: <CAHQecY4oXXwGeLsdXrgjFmouTiwvsJXa6K1Qbp--9WZ0=3O5CQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Infra Full Stop 12/26-12/29
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
X-List-Received-Date: Thu, 22 Dec 2016 17:19:25 -0000
Content-Type: text/plain; charset=UTF-8

Schedule is  06:00UTC 27DEC16 for the full stop.  Things will start coming
back (estimated) about 48hrs later.

Tom

On Tue, Dec 20, 2016 at 11:16 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Dec 20, 2016, at 10:50 AM, Tom King <ka6sox@gmail.com> wrote:
> >
> > Hi All,
> >
> > We have been looking for a time when we could do a full stop of the infra
> > to upgrade some bits and clear out some faults.
> >
> > This will involve shutting down the main machine that we use for *most*
> of
> > the OE infra.
> >
> > Our goal is to put up a backup git master but other services such as:
> wiki,
> > patches, etc will be offline for some or all of that period.
> >
> > We have delayed doing this much needed maintenance to try to work around
> > Yocto and OE release schedules and it is necessary that we take this time
> > to do the work.
> >
>
> I guess, you need to come up with a tentative down-time schedule.
>
> > Tom
> > (for the OE Infra Team)
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

