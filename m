Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id B98F774E53
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jul 2018 18:50:40 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id w7-v6so809198uan.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Jul 2018 11:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4CLO3fZg3RGzpUA6HejJ0tYu61ZloVJXr/yJHh8Cmmw=;
	b=oEvpY0hB0YYmH+yqTnHMgtMwfn+3jx/pMWC3wp7Gr3SjT57ER2Ms70ZpZ1k/9qbJKU
	sfb2Qu+MxYlKwGYPB8dPechHnvno52lhy8Hmu8DXDxvLlqLpoCG1h7Qf4Jeww+PD+5N6
	D/ppCWvbkorT4AOv6A59/fSzuEvWXGHqefYxVRCw5iYjQ/nA/x2Vg4W2VqQAhYMsxssh
	SHOMkvVVIqT1a74Vq3DoYj2khl0f2r+LimfDUqFP9BuFfQ1JHpJLJLCmv4a7TaB3MkrC
	Rg7idxpm9xwvjF1/gSIc18lIAe+xd2n0tCzU0JUsxLO8L4o9siEOogLlvR6jNY5GgOZJ
	3VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4CLO3fZg3RGzpUA6HejJ0tYu61ZloVJXr/yJHh8Cmmw=;
	b=C2o5R29xcO/ThaaOYBrVfwiSG3ts41RtjTfRn1NP+vsjNKIa4bJ2Dw0RzM46TmsBvk
	RrxJMaTmo9gv2vrh2Wf6mBeJaoA74LrmFqzaKL8k3r5bKZw4Dd7d8j+Fjbkt+Y9mYWiT
	CHZVUkfeufQA9U6ecyiCxoaCSgcet1uDHnsPRNOSbeVhMSb1Z/yGnQ0xLQ5SxolzFhbq
	bsAyFoumVSuc1X5L9zBPcONToWniBUu9dPiuluzuQmlnlatfU39gMrDxYzk4IXKBNa/U
	PqNu7ipkSURTYuNkXPYe4emQvi6DxT++gJW7eNKqoeCmhYto5+qPLYJ3Cpuoftk7XIG+
	Ddew==
X-Gm-Message-State: AOUpUlHAX//OUSaP1D03DgcxXDqsMu5LpD4NyKc6CM0QcG5tHYNl7E81
	R4ChWKlhQxyIO9b3w7/C7sjk6YRLrSQ8RFZsF3A=
X-Google-Smtp-Source: AAOMgpe9NfGcXcvDnlnMY1/0pK965E4KTYqobMyGbDqFA3cV6G3oPlczCaGUw7QS5YK8DnDtWV1eR3l1nEULuYXCiWs=
X-Received: by 2002:ab0:11dd:: with SMTP id
	q29-v6mr9263400uac.191.1531680640171; 
	Sun, 15 Jul 2018 11:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <1531497317-26576-1-git-send-email-hongxu.jia@windriver.com>
	<f831e0e9-60e6-7a54-d051-c21604c0bb6a@gmail.com>
	<04bb8026-4d28-2a40-7dd0-4b8ff34e9222@windriver.com>
In-Reply-To: <04bb8026-4d28-2a40-7dd0-4b8ff34e9222@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Jul 2018 11:50:13 -0700
Message-ID: <CAMKF1somytP21aUEymwYZJjXLruaS8RzZ-_tjmQ_Lp7Tn3G_OA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mozjs: 17.0.0 -> 52.8.1
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
X-List-Received-Date: Sun, 15 Jul 2018 18:50:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 15, 2018 at 6:41 AM Hongxu Jia <hongxu.jia@windriver.com> wrote=
:
>
> On 2018=E5=B9=B407=E6=9C=8814=E6=97=A5 01:31, Khem Raj wrote:
>
> fails for configure
> | checking for the Android toolchain directory... not found
> | Traceback (most recent call last):
> |   File
> "/mnt/a/oe/build/tmp/work/cortexa7hf-neon-vfpv4-bec-linux-gnueabi/mozjs/5=
2.8.1-r0/mozjs-52.8.1/js/src/../../configure.py",
> line 115, in <module>
> |     sys.exit(main(sys.argv))
> |   File
> "/mnt/a/oe/build/tmp/work/cortexa7hf-neon-vfpv4-bec-linux-gnueabi/mozjs/5=
2.8.1-r0/mozjs-52.8.1/js/src/../../configure.py",
> line 34, in main
> |     sandbox.run(os.path.join(os.path.dirname(__file__), 'moz.configure'=
))
> |   File
> "/mnt/a/oe/build/tmp/work/cortexa7hf-neon-vfpv4-bec-linux-gnueabi/mozjs/5=
2.8.1-r0/mozjs-52.8.1/python/mozbuild/mozbuild/configure/__init__.py",
> line 359, in run
> |     raise InvalidOptionError('Unknown option: %s' % without_value)
> | mozbuild.configure.options.InvalidOptionError: Unknown option:
> --disable-static
>
> Hi Khem,
>
> The `--disable-static' option has already been explicitly removed by me
>
> in mozjs 52.8.1, I could not reproduce the failure in my build, would you
>
> please paste the reproduce steps, or result of `bitbake -e mozjs' to trac=
e
>
> where the option come from
>

If you add

require conf/distro/include/no-static-libs.inc

in your local.conf you will see it. Basically you need to set

DISABLE_STATIC =3D "" in the recipe and that should take care of it.

Second look at recipe, I see that it has

ARM_INSTRUCTION_SET =3D "arm"

the failure you see is thumb1 specific, so lets make this thumb1
specific as well
e.g.

ARM_INSTRUCTION_SET_armv5 =3D "arm"
ARM_INSTRUCTION_SET_armv4 =3D "arm"


> //Hongxu

