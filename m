Return-Path: <maryan.pricak@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id A724078170
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 14:55:22 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id w1so134796005qtg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jun 2017 07:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=w00pRCOnUstk2j72Q5/Y9hne2AnXqbMkKUKns/cuj4s=;
	b=ce8uaG0WYZTX5oLQ+vB42jJiBtt/YBRFlRVoT8on0OCNRHEMulPrAZ+sQ+YB07fYWA
	xqCaOWCDcITs6h+RqN0FnE/T98IBgcDuDyD3MWMDeja09Pnw+qzfGCgQay1fbzW3JqR+
	Vj4VCqSnIEpzohKLdpR1OT0xIWFFPpm+qIN85GKfl43sln1Ww2v/T8UGCaNZELh7AdDn
	81E8mEiIx13VsZreB+osH+hW1rDpuutM3PpkmSaiMXYSGYIxwJhekT1dZHBM/w/dL2G4
	7F+aMK/URYOcabEkf17dUGd5q2ExorLnMV+Z7GvXQ9k9IHnkQIJ3iCgbt6uq8Eol10zw
	4xGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=w00pRCOnUstk2j72Q5/Y9hne2AnXqbMkKUKns/cuj4s=;
	b=JisuTHcQ4iMWdo649t/FsBgBsIWft5ufyvSpcN6iO1L0wHdi2Jw+yk42PDY9ukjJ8V
	WYAVBaNKSv/4XTmR1HZTDElTrl1fSjspEx2My32I3UAyq9FtNLkzEAAWQyAKHzlCRvDO
	pz6aSlsPVGOooW5KiVOheTac+JaiJUMQ5Ig6kShbquP/eAkBokNgIuCb6/V/b49HfP45
	O/UvvQKJAFyP9guJ1MLpaA9/X1TsfYQg6fZwNdHo0BvYaDeISlU3+RrqfB8g27Gj2W3g
	v7+nHz+zK0JMk0n+ndj3IZcImUMYyrwQJYJeMzlKUXFNZ4aW5OdS+nU4misqikKXrIoO
	VJCQ==
X-Gm-Message-State: AKS2vOzXjrzIaj0iMUTRf2hyOrQx7aGRMKpj5zSIPYKlzgU66z93kLgy
	kP4gCa0vbEbq2n7m8Khc7V1B50QicEd3
X-Received: by 10.237.56.4 with SMTP id j4mr34793157qte.78.1497970523467; Tue,
	20 Jun 2017 07:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAGyDALnwxEvX3AFfbB5thjQy91+9BNmzgyR5RPQetLseZD7hJw@mail.gmail.com>
	<e23728ee-eece-c3d1-da75-defd91e094ad@rsi-elektrotechnik.de>
	<0D74DA672F03634EA90EB18A61E36D27263B0EC1@MCHP04MSX.global-ad.net>
	<baf1ac86-c92d-1907-0cb5-25e94b495818@rsi-elektrotechnik.de>
	<0D74DA672F03634EA90EB18A61E36D27263B1095@MCHP04MSX.global-ad.net>
In-Reply-To: <0D74DA672F03634EA90EB18A61E36D27263B1095@MCHP04MSX.global-ad.net>
From: =?UTF-8?B?0JzQsNGAJ9GP0L0g0J/RgNGW0YbQsNC6?= <maryan.pricak@gmail.com>
Date: Tue, 20 Jun 2017 14:55:13 +0000
Message-ID: <CAGyDALnwFx0e_YNtMkruWj2-FbXQLZdpC2gHWzO-aJWqs_oGDA@mail.gmail.com>
To: "Tamtamis, Panagiotis" <panagiotis.tamtamis@unify.com>, 
	Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: (No subject)
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
X-List-Received-Date: Tue, 20 Jun 2017 14:55:22 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks guys, linux-dummy worked for me.

BR,
Marian

On Tue, Jun 20, 2017 at 5:32 PM Tamtamis, Panagiotis <
panagiotis.tamtamis@unify.com> wrote:

> Hello Josef,
>
> > Hi Tamis,
> >
> > On 20.06.2017 10:07, Tamtamis, Panagiotis wrote:
> > > I use the following in my image recipe:
> > >
> > > FORCE_RO_REMOVE = "1"
> > > ROOTFS_RO_UNNEEDED += " kernel-${LINUX_VERSION} kernel-image-
> > ${LINUX_VERSION} kernel-image-uimage-${LINUX_VERSION}"
> >
> > While that might work, it actually builds all the stuff and then only
> > excludes it
> > from the rootfs generation. But if we actually never ever want a kernel,
> why
> > spend the compile time? :)
>
> I agree with you. Even if cross compiling in production server does not
> take
> that much time, it is not the optimal solution.
> I will also see your layer at GitHub  :-).
>
> Br,
> Tamis
>
>

