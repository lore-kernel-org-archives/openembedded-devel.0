Return-Path: <andre.draszik@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id B3C7778D34
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Aug 2018 10:50:08 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id d10-v6so11620898itj.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2018 03:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=prk9UDh9nwsvZrs1VPXUrQeUIoKwHYashOOO9hXGR88=;
	b=MiIdsWwnuOYIQCcv+1mL7ZttfWovlzqg85uGfZ802O4AxfW8i7/7vGBtP7YoI3Cxau
	Q3qaVR69ij0mnTDh4SW/osdeR7XfWp5MvW+XdejgWH3JYg8JWHkQ2TWNyjoR2SLFSeiP
	I5+kolX+YsFxZp2xvviYAbSiNOkqhLRxDzuOO7jUn6r+ZmRwC18ZoAWgHwt4LtXAZuSt
	o5PcdYQVvywpFx3Lwo4uP0Wew0yZjkSGR47RF8cekP4D8ZmHg3PeSzRHMlaOwK0ojeIz
	hR0Iwdnla84FE7qQIkMUBrmx1VdC3RZ82V+o/8cmVG8GJQgDWQ9yTy9PszP8fWCSKhYe
	og0w==
X-Gm-Message-State: AOUpUlEr8hGX/LcVfs/niqk30L1PtGqwut4cnMaVTE8r28oc5RJfkRfN
	2cEOPTgAE3plVRY6W38DgNV/+m6fBLA=
X-Google-Smtp-Source: AAOMgpeT5kisJXUnmYMIGIMxYSLJEsYhBa9JTFW5Q2+yjwWWQ0VEqvcXI4gfI+jjNGs/uBXX9TKj5Q==
X-Received: by 2002:a24:a13:: with SMTP id 19-v6mr9923150itw.41.1533379809661; 
	Sat, 04 Aug 2018 03:50:09 -0700 (PDT)
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com.
	[209.85.214.41]) by smtp.gmail.com with ESMTPSA id
	i20-v6sm2158088ioj.57.2018.08.04.03.50.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 Aug 2018 03:50:09 -0700 (PDT)
Received: by mail-it0-f41.google.com with SMTP id p81-v6so11998043itp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2018 03:50:09 -0700 (PDT)
X-Received: by 2002:a02:2505:: with SMTP id
	g5-v6mr6528223jag.112.1533379809300; 
	Sat, 04 Aug 2018 03:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20180727131616.13881-1-git@andred.net>
	<390065ca-13d0-7dcd-8528-575b25187e2e@skidata.com>
	<872b2392cfb7793f514cf8b806262e8d37bb9fd4.camel@andred.net>
	<2e3d0628-932b-0466-2832-82741e7cd699@skidata.com>
	<e3cd5b4ebde785d03e79564e0243006287f12a47.camel@andred.net>
In-Reply-To: <e3cd5b4ebde785d03e79564e0243006287f12a47.camel@andred.net>
From: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Date: Sat, 4 Aug 2018 11:50:03 +0100
X-Gmail-Original-Message-ID: <CAKUP++vtmLkigt6jwvxEpA=5P8_VOJK8UdWfegzH3DbG=QLGiw@mail.gmail.com>
Message-ID: <CAKUP++vtmLkigt6jwvxEpA=5P8_VOJK8UdWfegzH3DbG=QLGiw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-java][master-next][PATCH 1/2] openjdk-8: update to 8u172b11
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
X-List-Received-Date: Sat, 04 Aug 2018 10:50:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 4 Aug 2018, 11:41 Andr=C3=A9 Draszik, <git@andred.net> wrote:

> On Tue, 2018-07-31 at 13:33 +0200, Richard Leitner wrote:
> > On 07/31/2018 01:19 PM, Andr=C3=A9 Draszik wrote:
> > > On Tue, 2018-07-31 at 11:00 +0200, Richard Leitner wrote:
> > > > Hi Andr=C3=A9,
> > > > thank you for your patches.
> > > >
> > > > Unfortunately I have checksum issues for aarch64's jdk, corba, jaxp=
,
> > > > jaxws, langtools & nashorn:
> > >
> > > Hm, is that another instance of
> > >
> http://lists.openembedded.org/pipermail/openembedded-devel/2018-May/1183
> > > 58.html
> > > ?
> > >
> > > I'll check...
> >
> > Thanks!
>
> I'll get back to that next week, see below.
>
> [...]
>
> > > > For qemuarm java runs (correctly) in interpreted mode.
> > The errors occur only on qemuarm64.
> > I've attached the testimage logs. Hope that helps.
> >
> > If you need anything else from me please just drop me a line!
>
> I am generally using real hardware for aarch64, but I've executed the
> aarch64 qemu openjdk-8-test-image, and it also works for me (again, with
> the
> versions I had posted originally).
>
> RESULTS:
> RESULTS - ping.PingTest.test_ping - Testcase 964: PASSED
> RESULTS - ssh.SSHTest.test_ssh - Testcase 224: PASSED
> RESULTS - java.JavaTest.test_java_exists - Testcase -1: PASSED
> RESULTS - java.JavaTest.test_java_jar_comp_mode - Testcase -1: PASSED
> RESULTS - java.JavaTest.test_java_jar_int_mode - Testcase -1: PASSED
> RESULTS - java.JavaTest.test_java_jar_works - Testcase -1: PASSED
> RESULTS - java.JavaTest.test_java_version - Testcase -1: PASSED
> RESULTS - javac.JavacTest.test_javac_exists - Testcase -1: PASSED
> RESULTS - javac.JavacTest.test_javac_works - Testcase -1: PASSED
> SUMMARY:
> openjdk-8-test-image () - Ran 9 tests in 56.859s
> openjdk-8-test-image - OK - All required tests passed
>
>
> And:
>
> root@qemuarm64:~# java -version
> openjdk version "1.8.0_172-internal"
> OpenJDK Runtime Environment (build 1.8.0_172-internal-b11)
> OpenJDK 64-Bit Server VM (build 25.172-b11, mixed mode)
>
>
> That said, I also notice your -version output has 'linux-aarch64 compress=
ed
> oops' here:
> | # Java VM: OpenJDK 64-Bit Server VM (25.172-b11 mixed mode linux-aarch6=
4
> compressed oops)
>
> I wonder why I don't have 'linux-aarch64', and what is 'compressed oops'?
> Thumb?
>
>
>
> I'll try a few things:
> * my poky is not current master, but maybe two months old
> * re-download and compare the openjdk archives.
>

I'm actually also using musl, not glibc, will look into that, too


A.

