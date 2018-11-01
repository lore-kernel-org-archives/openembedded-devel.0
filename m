Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF78605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 12:56:14 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id u68so8199452qkg.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Nov 2018 05:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g3nf1dJO3vq723Nn486ZvPFv+FOqWbHwOtTJ7YIlUx4=;
	b=OlVZLNd2Uo3ijrP03i8mXUwuzQ47WLRhilLsTOSTGlzdVtI6v8j9g8uwGS4pWygRtt
	cs7o6dq3NfGOm9QVXZDoWVBHSQgxHPBZX9HvJyBxUXTL75SUujeumvV+LNlk1l5AmwU8
	clrQ7XRKSXzZnoUZssWq6n/D6u/lyx0jD/QCUQgtIpvPSneTh5t5OeABjf5DizCQxXLc
	PRjx67uX7ObNPiDAuVvOXRhpN6uqASRJ12eDwaVlRIsaTh5y6J835PwtMgpP4FATS8PP
	Z/NOZfBNsb9reH41fqhjIKZoPvOJswsT4nCJTizfVgZCO9YcweTpOFCh37GVCCKBv2sM
	xCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g3nf1dJO3vq723Nn486ZvPFv+FOqWbHwOtTJ7YIlUx4=;
	b=gRXYXgUkemAdMJ4Ifm4M+u3MQuhMiVoFDrBz6lCQ/q0udtah0Ly3HiaTwhYafnR9wW
	j7/i3gGfkhCQjWlUhFAQurJSwQsU2UGmnYMW7uRPJOInqswu1dIc4L06XIhDYU0gGful
	EXec6Uhn1usHu8aGG4zwShBbwAg2uA2sWqc8IJ1eKyLUpDkns0jD700hitjjh9ATRKT1
	juCHpiGFtGHSGAyMY2car+rIOkd9mkRTsP1YG64h9Hf709afmMwXffyI6tsFbG6HJh9S
	AevC9/HDf2H3uiuz/Gp0IzkTbYQBcac/2KF5chTvR8d0da8aLX+VrkNFYNx3E0p8Vfg+
	E1zg==
X-Gm-Message-State: AGRZ1gJDtWXr4fobRaagJAmpqn0FhufelldG5U8WyIvZcfXMmsIJgN8w
	f4EXY7MP7uGLnmve26qJCFJgxzy6dkq5YvDnoEo=
X-Google-Smtp-Source: AJdET5c2oJz5LU7esxXzq9Zyi5GFnzldamCu+4v8smmslM75e7W2yQBPR7LKe7IVWfLV8bVnvaggH/s1rqbg82iGDXY=
X-Received: by 2002:a37:a84b:: with SMTP id r72mr6597464qke.2.1541076974764;
	Thu, 01 Nov 2018 05:56:14 -0700 (PDT)
MIME-Version: 1.0
References: <1541041968-19942-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1soAH7v7WxRqn=Rao0HAJGpe=PzRdXo7uMjzSXkXMFWc7A@mail.gmail.com>
	<356700bd-461f-ebd9-699a-5c0f26808a8b@windriver.com>
In-Reply-To: <356700bd-461f-ebd9-699a-5c0f26808a8b@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Nov 2018 05:55:48 -0700
Message-ID: <CAMKF1srSAgEYKUmRKSFncefa54c96+CpLTz49idJWjEAka1CYw@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] geoip: update md5sum and sha256sum
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
X-List-Received-Date: Thu, 01 Nov 2018 12:56:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 31, 2018 at 10:28 PM Changqing Li
<changqing.li@windriver.com> wrote:
>
>
> On 11/1/18 11:38 AM, Khem Raj wrote:
> > On Wed, Oct 31, 2018 at 8:13 PM <changqing.li@windriver.com> wrote:
> >> From: Changqing Li <changqing.li@windriver.com>
> >>
> >> Geolite database update periodically, md5sum and sha256sum
> >> have changed, update them
> >>
> > whats the change ?
> > its worrysome if it changes underneath without bumping version
>
> As say in https://dev.maxmind.com/geoip/legacy/geolite/
>
> This GeoLite database is  free IP geplocation database, and will be updated
>
> on first Tuesday of each month.  and not bumping any version.
>
>
> Unfortunately,  I don't find proper mirror of this database. and
> besides,  this
>
> database also will be deleted in 2019.02,  then maybe we need to upgrade
>
> to geoip2, and GeoLite2 database, this database also bumping any version,
>
> and will updated periodically.
>

thanks for info I think we need to stash these tarballs and find a way
to do managed updates
>
> //Changqing
>
> >
> >> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >> ---
> >>   meta-networking/recipes-support/geoip/geoip_1.6.12.bb | 16 ++++++++--------
> >>   1 file changed, 8 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> >> index 4e717e4..e851c44 100644
> >> --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> >> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> >> @@ -17,17 +17,17 @@ SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
> >>   "
> >>   SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
> >>
> >> -SRC_URI[GeoIP-dat.md5sum] = "37c84ead332dda0362a5ac7b049b72d4"
> >> -SRC_URI[GeoIP-dat.sha256sum] = "79ff1099e96c2dc1c2539c9a18aaa13a9afd085cae477df60d95f1644d42bc07"
> >> +SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
> >> +SRC_URI[GeoIP-dat.sha256sum] = "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
> >>
> >> -SRC_URI[GeoIPv6-dat.md5sum] = "e75b84a4044e81d6d4484e33816bc762"
> >> -SRC_URI[GeoIPv6-dat.sha256sum] = "a009b0f21968d2868e6dd19d14f3c3b8cd60ae84a4bfc2970df34d771a04811e"
> >> +SRC_URI[GeoIPv6-dat.md5sum] = "84c5f225f371463d790270ea83a25765"
> >> +SRC_URI[GeoIPv6-dat.sha256sum] = "5767eebd655f0c06ac8066d0d4611b399ab623af42d71bac7f9478b193e77809"
> >>
> >> -SRC_URI[GeoLiteCity-dat.md5sum] = "4b6588d0bfe1af22e267ac90aa97f769"
> >> -SRC_URI[GeoLiteCity-dat.sha256sum] = "8a6467033a528f68b1a97de24d9d0ce86c8e8e83683820e16e433ddbd3f712f7"
> >> +SRC_URI[GeoLiteCity-dat.md5sum] = "d700c137232f8e077ac8db8577f699d9"
> >> +SRC_URI[GeoLiteCity-dat.sha256sum] = "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
> >>
> >> -SRC_URI[GeoLiteCityv6-dat.md5sum] = "ad0cb42518af7f752499425dca0952bb"
> >> -SRC_URI[GeoLiteCityv6-dat.sha256sum] = "eda67f4204ba9fa5204a53cdb629167cca9394c712f5378bc723a8c29c0b440f"
> >> +SRC_URI[GeoLiteCityv6-dat.md5sum] = "c195d5295f0e2f0391f1155ff31b6d09"
> >> +SRC_URI[GeoLiteCityv6-dat.sha256sum] = "b221bb34179dfd104fb5f0340c00a2b5ff751cc294640767170aa7b71215ae18"
> >>
> >>   LICENSE = "LGPL-2.1"
> >>
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> BRs
>
> Sandy(Li Changqing)
> Wind River Linux
>

