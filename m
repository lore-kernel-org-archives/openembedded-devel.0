Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.799.1589820547802493490
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=klLXU8qH;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=l5hx=7a=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49QlMz1n5vz43;
	Mon, 18 May 2020 18:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589820544;
	bh=bmVK/RniZKEkwRM25czMegwqs+FunmdscNdquuNXpks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=klLXU8qH8wx+Y1eJ143jUQbLHBtZ1aVUwix1Nua4ybFxzNInwztHwg5bFvMyY43L9
	 6woygU013/78pJuxcae1cVApdOCwmg7A/wf3ATbnkLQIf5Lz/8/Ephp8NGrQZSwIA6
	 04esig3CT2UX2bBqwxywehphrvBuefWq0iqZAZDuJgjGM73q9BSaOyaGAVEPAP5Su5
	 rrbDxReivNVE4iKx/73NRekHR4xFscXdcrMouAJKmPBE8Gyesf07EkAFufmH7QB99Z
	 ehNzYEnY5QMwywQ95Uw8EBrwunQzGOCdCwAFYGfoiBHrYMzA4q1STzvhDgpLg3QXHg
	 pz0P4E5fqLbIlC5SzyRvUN46MhaovpJGEYtPR6MxHyrycg6HHBG0rYHBgmtkWuYN5J
	 Xa73NWyl1RHkeZGlexUcxdedxh4iVLKDWNblQ3MFtc9rLX52QJt1Kolu/18w51mduf
	 zaZVhibgZSrdH26O0dIC1SsswILetjXc55ZQLSF1c08q56+Xb1vNzo8NKdgTqtcYn1
	 ToSue8fl3BkQxAqTJeT5bEWDuCKOWY2K6Q/dbH34YBIf9XImQUisZ0B7LFCvdaFmuf
	 8/+fS4egl50gTLRAtSqLffuOgHM7WTta9rQ2YAw4Q7YZ2yqGLmiTfoG1ZFqvXAxRAL
	 qq2sQQtwZADhx39yXIuKbTLg=
Date: Mon, 18 May 2020 19:49:01 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Paul Barker <pbarker@konsulko.com>
Cc: akuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [dunfell 00/57] Patch review
Message-ID: <20200518164901.GA32483@localhost>
References: <161026DF21C4386A.31912@lists.openembedded.org>
 <b838142d-d955-add1-5bf5-a0f192d1e606@gmail.com>
 <CAM9ZRVuXMmD-1Xm6vwFmKw0P6sXyezXJmVvUBnBAiEhw9EYHjQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVuXMmD-1Xm6vwFmKw0P6sXyezXJmVvUBnBAiEhw9EYHjQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 18, 2020 at 05:38:21PM +0100, Paul Barker wrote:
> On Mon, 18 May 2020 at 17:12, akuster <akuster808@gmail.com> wrote:
> >
> > Groups.io has a limit on the number of emails in a given time.
> >
> > this patch set exceeded that limit  so patches 39-57 got dropped.
> >
> >
> > "500 We have received more than 40 messages in 30 minutes from you. To
> > guard against autoresponder mail loops, we must reject additional
> > messages from you temporarily. Please try again later. "
> 
> May be better just sending the pull request emails in the future if
> groups.io chokes on large patch serieses.

I do actually appreciate the patch sending since this makes it easier to 
review the patches.

> Thanks,
> Paul

cu
Adrian
