Return-Path: <uvv.mail@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 68626797CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 13:41:45 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id d21-v6so9049933qtq.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2018 06:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fjcgdXQItAxwcF3ntEkGXBcZlnnNL0BxEVQQjTecPMc=;
	b=NlVotzFVrykTghDnDNYgWu6P3JBNoJOgrTJ3pbaE5DPTLVzVhOi6FyJPl9Su4kOMYi
	Rv1oKPHvnDAs/heag7Lxm4DEP08f/mMfDhRnOStoEOtiBNvmQyXcjpfs5/na23pzm7il
	I3F8w5DWP43kL50ItDot6NDQmlO+DDLgTb2Xrk3j15ujeup67FPFAtqP2eevq5aeUzRi
	89YcyMejh1mcO+wZMkBaPX3G9ZdJwtwUj9S29xXdvNuyvNA8k035roMqN0VibASg0HBK
	BDMrE8Y9CmFWEjodJd77phg6Xf3Vc+h8ne5VkR39Qz30y4EubtdbvSQfOTf5EaIVVDie
	3MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fjcgdXQItAxwcF3ntEkGXBcZlnnNL0BxEVQQjTecPMc=;
	b=TmQf8GNjBv4rIHlWIi2imU8dFEIOfUPD47+FGPA++5fYNwggMVYxKr6GERucpHUylu
	+jzwYp9jXTssL1XMh9ixz232ifSnYK7ZX3qosQRpSyHtFGcXHqzPAeZwJ2YVRG3zS8KO
	9N2lY9nis+D0uCHx4NCZehbVY1sLcrnxPexHf5NWU6JAoDgzSX8/TlE5u7wsYu+Xh+t4
	0wC8ibHkEBA3Ms2mclJb9j7KFEo+slKm4owKyAu49pXj6r/saFjs1f9IzcgKLDPKjaQd
	Isew/9xNXhYCBjIRbQyCC8youvuONsHMNxo5rMf8fohsnfNDNUORZR095ZC03e49RKLu
	SyAw==
X-Gm-Message-State: ABuFfojomq1qNlC9FMW58TUQuITcD4lW4xe98UijKQ/OdAxzDbO9cXmv
	lK+Gtm+pHvk77I3NKuq3msHwVXtNdN87oUigSM4=
X-Google-Smtp-Source: ACcGV609iaUbjpHVkptZi98tMHNXfEsGEHkPGDv9xt7r2Sy3mLpcT+OG6n0nSGAex8PfW21OmIJD3F+4bmS7RhroIJE=
X-Received: by 2002:aed:3882:: with SMTP id
	k2-v6mr15554936qte.345.1539610906272; 
	Mon, 15 Oct 2018 06:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20181008091749.45975-1-uvv.mail@gmail.com>
	<CAMKF1sp-q=SJ+R=bGNeCpSL_=ufUuqDJAnCPVMmVEZ2H7zYcjg@mail.gmail.com>
	<CAKHfEah9WnNyh-wzdibsALB648po7RC4sKdNy5dWKYWpMDfL9g@mail.gmail.com>
	<20181015111112.GA1342@jama>
In-Reply-To: <20181015111112.GA1342@jama>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
Date: Mon, 15 Oct 2018 15:41:34 +0200
Message-ID: <CAKHfEai-K5xnLG5qf889G5VzzjR146SreZ0FzowqFF2Yfih22w@mail.gmail.com>
To: martin.jansa@gmail.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] glog: upgrade 0.3.4 -> 0.3.5
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
X-List-Received-Date: Mon, 15 Oct 2018 13:41:45 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Martin,
Thanks for the comment.

Thanks for comments. I will add this patch and I also what to append
RDEPENDS_${PN} += "libunwind".
I plan to send the updates this week.

Vyacheslav

On Mon, Oct 15, 2018 at 1:11 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Oct 09, 2018 at 11:52:36AM +0200, Vyacheslav Yurkov wrote:
> > Well, two obvious reasons:
> > - glog fixes between 0.3.4 and 0.3.5
> > - cmake support, which simplifies dependency handling when SDK generation
> > is involved (for example for libraries like ceres-solver)
> >
> > I need to update my patch for finding libunwind, so I will send another
> > version soon. The question I have now is that glog builds static library
> by
> > default. What is the policy in that regard? Should a shared library be
> > preferred by default?
>
> I know I'm a bit late, but I have some questions about shared library.
>
> The preferred default should IMHO be the same as with 0.3.4 version
> which was shared library, but that's easy to add with small bbappend
> having:
> EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
>
> but unfortunately the SONAME in the library changed from:
> objdump -x usr/lib/libglog.so.0.0.0 | grep SONAME
>   SONAME               libglog.so.0
> in 0.3.4 to:
> objdump -x usr/lib/libglog.so.0.3.5  | grep SONAME
>   SONAME               libglog.so.0.3.5
>
> Which breaks all our prebuilt binaries which now correctly complain that
> there isn't libglog.so.0 provider in dependencies:
> QA Issue: /usr/lib/libfoo.so.1.2.3 contained in package libfoo requires
> libglog.so.0, but no providers found in RDEPENDS_libfoo
>
> Which is quite unfortunate for minor upgrade. Did they really change the
> ABI (and expect to change it in all future minor upgrades) or is this
> change just unexpected side-effect of using cmake instead of autotools?
>
> It looks the later, because if I build 0.3.5 version with autotools I
> get:
> objdump -x usr/lib/libglog.so.0.0.0 | grep SONAME
>   SONAME               libglog.so.0
>
> and there is patch for SOVERSION here as well:
> https://github.com/google/or-tools/blob/master/patches/glog.patch
>
> applied in master:
> https://github.com/google/glog/blob/master/CMakeLists.txt#L493
>
> https://github.com/google/glog/commit/6b6e38a7d53fe01f42ce34384cf4ba4c50e8cb65#diff-af3b638bc2a3e6c650974192a53c7291
>
> patch coming with this change backported to make it possible again to
> use the shared library.

