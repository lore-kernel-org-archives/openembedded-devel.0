Return-Path: <petr.nechaev@cogentembedded.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 346EE7211E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 13:40:58 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id ms9so8611971lab.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Dec 2014 05:40:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=fRjIk2lyU11GwUEMZjikP6DFP4O97zpV573mvMv9SPA=;
	b=hF6bSGhPW1VItns+Qq1Wcs7tKwHPK5n0GJiMnpPxj7c+SqyU2gVu5HknaIDVOoF6tm
	IbHqmOpyN3hyKiru6Xz1QRRrJCc/+sO0NRSONzNplkuOLeoiutaMaf06XVVjMA2zor0G
	JlRuj0l+7npeClTY84EfpLOfYKMjenw5y9s5i5AS3UJO4i+RYUGK/CePBMl4uPHQyHJ5
	1a0x1IAk1RU7s0QnRGj2qTVwjB4aBbtWM6HWaR6udMw9rWRBMw+FXV4tm11To80YA3DA
	qeV9lufk6vR3o/aHFbuASlTqDUueX07gUimZlvuqEkpV+rvv7wkc8gwHi+4Rie66x+9f
	05qg==
X-Gm-Message-State: ALoCoQnJoojWN7XNPcp0WLzv2o81c5/Xje8Z6PvbpQO9Tt8N2RQ936VL2BdiRZV/JqNedm9CGHHT
MIME-Version: 1.0
X-Received: by 10.152.164.232 with SMTP id yt8mr57004178lab.7.1417441258355;
	Mon, 01 Dec 2014 05:40:58 -0800 (PST)
Received: by 10.25.23.86 with HTTP; Mon, 1 Dec 2014 05:40:58 -0800 (PST)
In-Reply-To: <20141201133324.GB2466@jama>
References: <mailman.1269.1417437531.1406.openembedded-devel@lists.openembedded.org>
	<CAHPquwN5-Zy9=9rjZ-ktxibXX8VepN19qqu2JFRbkKMMsP_1fw@mail.gmail.com>
	<20141201133324.GB2466@jama>
Date: Mon, 1 Dec 2014 17:40:58 +0400
Message-ID: <CAHPquwPjK47RrNw+dnUu7pN8u_fUsDo_Yf8usb9ySZU7UMU3GQ@mail.gmail.com>
From: Petr Nechaev <petr.nechaev@cogentembedded.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] Updated comments in qt5-versions.inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Dec 2014 13:41:02 -0000
Content-Type: text/plain; charset=UTF-8

Yes, that's for master-next.

---
Petr

On Mon, Dec 1, 2014 at 4:33 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Dec 01, 2014 at 05:27:15PM +0400, Petr Nechaev wrote:
> > Updated comments to avoid confusion
>
> This was meant only for master-next, right?
>
> I've squashed it there to the update. Thanks
>
> > ---------- Forwarded message ----------
> > From: <openembedded-devel-owner@lists.openembedded.org>
> > Date: Mon, Dec 1, 2014 at 3:38 PM
> > Subject: [meta-qt5][PATCH] Updated comments in qt5-versions.inc
> > To: petr.nechaev@cogentembedded.com
> >
> >
> > Only members may post to the list. Please subscribe and post again.
> >
> >
> >
> > ---------- Forwarded message ----------
> > From: Petr Nechaev <petr.nechaev@cogentembedded.com>
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Petr Nechaev <petr.nechaev@cogentembedded.com>
> > Date: Mon, 1 Dec 2014 16:38:48 +0400
> > Subject: [meta-qt5][PATCH] Updated comments in qt5-versions.inc
> > Updated comments to avoid confusion
> >
> > ---
> > Petr
>
> > From 215b81d31a9f78a6da3ee2ae070d3b82bdb5ea44 Mon Sep 17 00:00:00 2001
> > From: Petr Nechaev <petr.nechaev@cogentembedded.com>
> > Date: Mon, 1 Dec 2014 15:28:34 +0300
> > Subject: [meta-qt5][PATCH] Updated comments in qt5-versions.inc
> >
> > ---
> >  conf/distro/include/qt5-versions.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/conf/distro/include/qt5-versions.inc
> b/conf/distro/include/qt5-versions.inc
> > index 7530a24..71ece94 100644
> > --- a/conf/distro/include/qt5-versions.inc
> > +++ b/conf/distro/include/qt5-versions.inc
> > @@ -1,5 +1,5 @@
> >  # Select which version you prefer by defining QT5_VERSION and including
> this file
> > -# possible values now "5.3.2", "5.3.0+5.4.0-alpha1+git"
> > +# possible values now "5.3.2", "5.3.0+5.4.0-rc1+git"
> >
> >  QT5_VERSION ?= "5.3.2"
> >
> > --
> > 1.9.3
> >
>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

