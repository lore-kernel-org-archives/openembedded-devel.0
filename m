Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6B49E65CE8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 15:12:40 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id d4-v6so5041869qtn.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 08:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=s+UkimmS7i2YnR/uPDrx2tfIXB3GTWsYVD/7tWxjSeg=;
	b=DirSESQgXTq+c4BmyurXllfD14AOvxTVlg1ZdOVUaZ0vgbxGWzXqmp5JHZJOnE26eE
	g8quettAY8tMvkaM28mR66dtzgs14utwmCwfQQM8DceJb4KGupV50BxQlD73hxlEeacB
	V1dtZ1MhiL2wroeaYRQFQseflX0aiIkLlbrCtV80khiahqT0/IprvkXCJ+l1DRJdB+dj
	FruCr4yY9Vvf72LNkAS7SbhIXL4WZ2cjENYPKQKHNRumTi1RHjE3/eqP2tjDF7fydSYg
	PBe2GUCXPPHD0Heaf7o6zdDuJniU1rtL2fsrzyGEFHsk/qm1sYE0cA9rc2VxdkldkW+Q
	o4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=s+UkimmS7i2YnR/uPDrx2tfIXB3GTWsYVD/7tWxjSeg=;
	b=TODrdSNzUbwW8LlO8tzXjS9jxJyvayw5YKtlQb9K9KQDeXCCbPX16yeY4iOrVwZd5t
	6BnGwysQwOfrfkvfABTbWvf230uWicD7k0CBBfYIO0OMWUF05gEzCgpEt8q8tFknwXH1
	Ci1mqa6/gr66TBub1lEJgiPqZ0ew8dDnvcPMRdtD3YdXOjUkrhxXWjMyfNS90WKtk6Rs
	kBsqlaMPiNOn0fwgehz6adHxl1qp0RAbw00m8Tu7tYKRN68xBQyjazTImcxVUm9R4uEm
	4t44jLgpOgPqhXycjfFIhg36Zw+4JH7ATGPFNgHXDgVBekGmyDQZxbeo6wkMHTFt5WDs
	8GDA==
X-Gm-Message-State: AOUpUlGmGPUgBAlq3jyBI1a1JVZ5VG0iz0P0v9h1uhB12AJbgd3fww0H
	cWxO3CFpuge5zm8NuAcz65Du1vk7fziLDvZqR/0=
X-Google-Smtp-Source: AA+uWPyDAOIZuN2u2+v/jE5e/AK0kbRJQGwVqyU2H8whTAyumxPb0dZRX6q6DKh9xZAAlvNxpXNVYQdCiator4XmJLk=
X-Received: by 2002:aed:2aa1:: with SMTP id
	t30-v6mr30975485qtd.28.1534432361374; 
	Thu, 16 Aug 2018 08:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAGCTLNRr7118-2whFfsWw-KbaT23bCKmp4J-HmyBZMFWw750Bw@mail.gmail.com>
	<CAMKF1sr2se=QBu8UjieWGXUPT=Jyj3PesogniqK-F6BnzsrWZA@mail.gmail.com>
	<CAGCTLNTSwV=ozB7gCX+G4QqTyiR8aVC=kPHvLL0J2VZGPDwJuQ@mail.gmail.com>
	<CAMKF1sonVk1mM3990_ZcHTsVfeZc+ZNaL+8TMu-doGX4q0BALA@mail.gmail.com>
In-Reply-To: <CAMKF1sonVk1mM3990_ZcHTsVfeZc+ZNaL+8TMu-doGX4q0BALA@mail.gmail.com>
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Thu, 16 Aug 2018 17:12:29 +0200
Message-ID: <CAGCTLNRO5scyT+T3c3Qnu+=hPtRAmvvc6wRcum1A+JmieWWjJA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [qt5]: qt5 support
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
X-List-Received-Date: Thu, 16 Aug 2018 15:12:40 -0000
Content-Type: text/plain; charset="UTF-8"

It works,
thank you very much

On Thu, Aug 16, 2018 at 5:04 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Aug 16, 2018 at 7:37 AM Mohamed Dawod <mhm.dawod@gmail.com> wrote:
> >
> > where i should use -platform wayland ?
> > did you mean when i run the application, i need to add this suffix to
> the app name ?
> >
>
> yes
> application -platform wayland
>
> > On Thu, Aug 16, 2018 at 4:24 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Thu, Aug 16, 2018 at 6:26 AM Mohamed Dawod <mhm.dawod@gmail.com>
> wrote:
> >> >
> >> > can i run qt5 apps on image that support wayland weston without x11 ?
> >> > and how ?
> >> >
> >>
> >> add qtwayland to IMAGE_INSTALL and use '-platform wayland'
> >>
> >> >
> >> > --
> >> >
> >> > Mohamed Dawod
> >> > Computer Engineering Department
> >> > Faculty of Engineering
> >> > Cairo University
> >> > --
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
> > --
> >
> > Mohamed Dawod
> > Computer Engineering Department
> > Faculty of Engineering
> > Cairo University
>


-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

