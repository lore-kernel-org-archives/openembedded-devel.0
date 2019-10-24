Return-Path: <daniel.diaz@linaro.org>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 04E097F9A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 18:34:21 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id q64so26102144ljb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lFbJxFIb+iRlKulggdBV536BynJ172AQOKffhSxZddM=;
	b=bGS2bHzWokNLCu1FnenkEGJsbAmZXKF9jAO66jgzGzYbDT3q2JUPL56h9kimRSGgwG
	NIzq61wAEFIdKA/p7adqZRznW/E1gcE4Ik5V6AZkfHlVEtbGed96sw4wf+zg5gcpTAuO
	c9sMPjfrP8Rcm4ySwt3xWMn3IrKtXbFv/T7mEQhpxaZSVBpahK0DCqzo48PGgnl9Ujv8
	tcRM9jkPVAGrU2uVMQJrSMzs3580Qs4oA9/flFKSvq8vqqlyRU0QW47myvPxdUQYm00K
	JS11dqYKkUP2xy+jEsZnFr2un/EgMaX0MHg9ryG+6ku5g5+FK6hrOs5xJYbW2kOHcRN3
	xsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lFbJxFIb+iRlKulggdBV536BynJ172AQOKffhSxZddM=;
	b=bWVbIlyMM5ZGPgdon+2budbuSFZxD0Vv9ySVIY641a9hzqYNMsPysZ4hxVdJEEMWmq
	J52TzPPcWX+zMK6da65pN/c1xS9JBG34m7UrXunt2Zn9MSiFkApR0gXdw/QUpLD1WQbl
	Y5rLU6zICrxz+jTzIgYzpqfEPoZJ4X1CX+HyTSn9r74+NOQ7hU9Yhn7Ti5lo4mOebLnW
	AJh8NPqZhc4+nRoDjMJ1JVhbYmY9+f3SeKHwa2nS+k7ehZXbcJaSlXEl8NVAu6z7pAI6
	H/OhXW6XI12ZsNP6iZJ2df/ApoqyWFi2EFIDa7n8gbN40nFpTBFBJTJvxXRibOWtw0tS
	IzFA==
X-Gm-Message-State: APjAAAXI76YXfAbYymkJsoKpB+/rFufb+Cz3UF72bPA1gRsM//e82frY
	12m8FhIe06vYg60kNWeJPcOrBvm9TjGE/IhioEWWhQ==
X-Google-Smtp-Source: APXvYqwYTXoZ9aL0CvFlGY1EY+eY9gJ3ZDT+srHu37J0AdDlhHeYEaw8ikGVJMHpk2hnlFap2muJg/D9inDRLNycR1Y=
X-Received: by 2002:a2e:6c0e:: with SMTP id h14mr11844579ljc.92.1571942062564; 
	Thu, 24 Oct 2019 11:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20191024175208.19746-1-daniel.diaz@linaro.org>
	<f4dec827-0d24-50a5-dda0-761713e573b8@gmail.com>
In-Reply-To: <f4dec827-0d24-50a5-dda0-761713e573b8@gmail.com>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Thu, 24 Oct 2019 13:34:11 -0500
Message-ID: <CAEUSe7_FmNYQxJxJQX5hTt1JG9RqXQ8RYzFaAfszXftQ2rudgg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] perf: Add /scripts to sources
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
X-List-Received-Date: Thu, 24 Oct 2019 18:34:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Thu, 24 Oct 2019 at 13:24, akuster808 <akuster808@gmail.com> wrote:
> wrong ml
> I think you want openembedded-core@lists.openembedded.org

Indeed. Thanks for the heads-up!

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org



> On 10/24/19 10:52 AM, Daniel D=C3=ADaz wrote:
> > As of linux-next-20191022, we need bpf_helpers_doc.py in order to
> > build libbpf, which lives in /scripts. Otherwise, do_compile fails
> > with:
> > | /bin/sh: 1: /oe/build/tmp/work/machine-triplet/perf/1.0-r9/perf-1.0/s=
cripts/bpf_helpers_doc.py: not found
> > | Makefile:184: recipe for target 'bpf_helper_defs.h' failed
> >
> > See commit e01a75c159691 ("libbpf: Move bpf_{helpers, helper_defs,
> > endian, tracing}.h into libbpf") from linux-next.
> >
> > Signed-off-by: Daniel D=C3=ADaz <daniel.diaz@linaro.org>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/per=
f/perf.bb
> > index 8201c0cb60..a463eebc52 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -113,6 +113,7 @@ PERF_SRC ?=3D "Makefile \
> >               tools/Makefile \
> >               tools/perf \
> >               tools/scripts \
> > +             scripts \
> >  "
> >
> >  PERF_EXTRA_LDFLAGS =3D ""
>

