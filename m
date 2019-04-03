Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 791057D245
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 12:31:24 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id y204so10729875itf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 05:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2Z6WWzX+l33st7dlDm7BHB4x7vqI02ljgYN23/2V1UY=;
	b=uuqDMbwWoCkoKpFE2fW0I7S/46BxnXuzW9jh3qdw4kdyTNcTcNwfkhBGpd39kCIfSo
	F4xx7ppUCeC7CI8eLOvdAjiFsGY3X4X2W+7TXoEmIuPa3RDoOHq4CIfP65x6qX2n8vQq
	dbVUfTth9qBYDeAKXmdDFkjGuSKKZ/2flS+QO/KUIFiFUaJf4BZSwrz4OynqGFq9D0ll
	qEUhbR7v40A6Ab1um7SEtyCeyxb49hJA7wRsBVypRYuSZS6Llz6WSK5RKmCimFbhwr2z
	Xei+YCup60aWqtzSTeSToG7Rd4zhmSEgN3t2hdA7Ky23TqGU1PQGWGsiQvmS6xIGpJEW
	EVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2Z6WWzX+l33st7dlDm7BHB4x7vqI02ljgYN23/2V1UY=;
	b=Yhvco58sPLg7kdVqHbHVfcOrHQRGMVl/1zXpGdOL+wMl52fDISV5dbIqXVf+OQH64C
	ehE6qlR3wQfSFhcFz4F5I5m/3UKaGKpZrqHXOlHUYOpbcnCAafScHLIC0jlX2TMrDH/N
	5gJnLNe/6U1kQuOg2jYmkG7pWGZBgh3dcZy0X+UYrgPf8PYmlh2sGHR1sSL3SjQDqRvC
	9UbkFClJFf5dsN1ZBjO7o/jqyrkd+NI5eyQqoJbbutgBDjI+BSVIRl3nRwvOt8L+0EWk
	6DebWG9rIMeWf4CazuGoVVkkEsTMtksiBLA7UoNtZiTp2a3PDZxD2wMApjLhBiTSDVAZ
	R/xA==
X-Gm-Message-State: APjAAAUZTGyEOCo4MS3Jup3w1sD91mwT7cAcWoSX/smnqlYYiD9o7QLa
	2kuIuz3vjMp+wXNQRRKztYw/CwXgBCZuSVcOo8I=
X-Google-Smtp-Source: APXvYqyXn4aYJZrC8MfV9ZHTmU+ETuM2w0EYl914zIHtruhpMmY4hukHc5aZ1Nyox0R68KSQyq+UflQFN18evfjZkG0=
X-Received: by 2002:a02:3342:: with SMTP id k2mr401740jak.15.1554294685278;
	Wed, 03 Apr 2019 05:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
	<1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
	<20190403085651.GA6467@localhost>
	<CAB2nKc9hnDrOTtKjNfk1cupK0yv8xXksEuvURJtS6ve_baOpJQ@mail.gmail.com>
	<20190403111514.GA20836@localhost>
	<CAB2nKc-nz+YhZ9voQOSo=46gLhLoip5_GT2arkmT6jOGiyEo8w@mail.gmail.com>
	<20190403120314.GA2025@jama>
In-Reply-To: <20190403120314.GA2025@jama>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 3 Apr 2019 14:31:13 +0200
Message-ID: <CAB2nKc9qLz=4hERKOORTSyb74=PsuuEJnA+GezrY0v1u=6Sfhw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][PATCH 2/3] cppzmq: bump version 4.2.3 => 4.3.1
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
X-List-Received-Date: Wed, 03 Apr 2019 12:31:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Martin,

Thanks for precisions, I will update PV to 4.3.1 in V2
By the way, it's first time I submit a patch series, should  changelog be
in each patch for should I use --cover option to put them all in 0/3?

Best regards

Le mer. 3 avr. 2019 =C3=A0 14:03, Martin Jansa <martin.jansa@gmail.com> a =
=C3=A9crit :

> On Wed, Apr 03, 2019 at 01:36:24PM +0200, Vincent Prince wrote:
> > Adrien,
> >
> > What I'm not sure to understand is in which case we use "_git.bb"
> instead
> > of having PV in filename.
>
> The PV in filename is just another way for setting PV variable (instead
> of setting it inside the recipe). This isn't relevant to what Adrian
> requested and I would keep the filename as is.
>
> > If we use a release version, shouldn't we point to
> > https://github.com/zeromq/cppzmq/archive/v4.3.0.tar.gz?
>
> Definitely don't use github archives, they are regenerated from time to
> time with different checksums, either you can use developer uploaded
> tarballs (some projects on github provides them as well) or use git
> fetcher with the SRCREV pointing the the tag.
>
> > And if we use git version, shouldn't we specify git commit hash to remo=
ve
> > any ambiguity between PV and SRCREV?
>
> With git bitbake fetcher (git:// in SRC_URI) you always need to specify
> SRCREV, because that's the only thing which defines what "version" of
> the source will be fetched.
>
> PV in this case is only to give this SRCREV some human readable (and
> sortable) versioning scheme. And that's what users will see when
> installing/upgrading the built packages, so it's important to set it
> correctly.
>
> +git${SRCPV} in PV is usually used to signify that the SRCREV points to
> commit a bit newer than the "base version" in this case 4.3.1 and in
> this case this +git${SRCPV} is unnecessary if the SRCREV matches exactly
> with 4.3.1 tag.
>
> > Do you know any convention is specified somewhere?
>
> I don't think it's spelled anywhere in wiki.
>

