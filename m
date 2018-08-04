Return-Path: <williamdelacre@gmail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id A68C878BEE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Aug 2018 12:13:02 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id m13-v6so7312790uaq.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Aug 2018 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q+kS4faEcphOdJDBkiAHcgt25u3xaZ6FcXv5sxKnQqY=;
	b=ZN4s8HJCg/9TEWJWDdMs2bX0lbhRDxUvbP9wdsHKrHMYsnscQkBlAW6unKTf/udmrZ
	XznpKmHq30PrUoMSirerPUDibujM3z0fSKMH+uy1k8KRgVDFl47vDMbJOKbCn05cQPxx
	hEbjLlWBxeQGP6Rx2D7p+WW5NnlM+t44GVEmnaCmh6Fj45qb6eO1z98t0fwEnSMyHfK1
	FOashOoCpTVY92txMWZH2gZvA+t87WSk2/NTL0VyKXD/fhvafyc8uINV0Fc63+E5uMay
	XEDTqpg5uFmwGKiG71Psl7iSpky2sXS/I6aXid+yNm5bzGCy+8Kn70FPrruEScCyg2xt
	Gnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q+kS4faEcphOdJDBkiAHcgt25u3xaZ6FcXv5sxKnQqY=;
	b=V1X2Qhg+utVQiHlSj2bGlTdtcXXy8HeYRG7oAqWNyI2qs2t77t9NgkvI1lFpK444Ko
	3gEEPgALZa6ANiJHM6GgeOpdxQhnwezULRRMpLtyudK0mt1CFXPiz27D3r252APuAzNf
	Wy3WSeJ2yhp/FH0QYInKzQY3MXTCXqlSHNXq3kslIl3kJcj8R4lXsUzux6fKMJmML3tG
	ktwj3M7gHk047fq/qJi99aEj97Nr0aeCmVg4sr7UFpHqzw9vxi84RRQ0vxK0n5s0GFLH
	fx2U6qYTU6RtvLjuYJ+mGyLFFFpN2zJBQqukUgFRDThjZ9lIL7MpjT7MqY/mjFVPClwQ
	V3PQ==
X-Gm-Message-State: AOUpUlG2n1J+Pj+salJng0b4MgH1lZzJuA1Gsk7Z6BcQr4aQqANBKzBi
	1UWr5qJc/danziDQXSY37GQuk9NZPekrkg6JUSI=
X-Google-Smtp-Source: AAOMgpfgT8kPk8vh1jra6bjb+vTKA5PPRv0OovkpVk+OlpQlWV6cGjDPqdXE0fB7BCIHnN34WVrAj4Hk1rphEvOKKCc=
X-Received: by 2002:a1f:3b43:: with SMTP id
	i64-v6mr4695810vka.152.1533384783529; 
	Sat, 04 Aug 2018 05:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnRZEJX6vtCikSJK4py2y3r3J-N3fT_tA5FLFYFyPF6vrczjw@mail.gmail.com>
	<1533334371.30932.14.camel@gmail.com>
In-Reply-To: <1533334371.30932.14.camel@gmail.com>
From: William Delacre <williamdelacre@gmail.com>
Date: Sat, 4 Aug 2018 14:12:52 +0200
Message-ID: <CAOnRZELTAgoQ4yMaB8L4vmo8JV6Lx-HWfGCAORk=Rm3Djn0aaw@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Actually installed packages
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
X-List-Received-Date: Sat, 04 Aug 2018 12:13:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 4 ao=C3=BBt 2018 =C3=A0 00:12, Max Krummenacher <max.oss.09@gmail.c=
om> a
=C3=A9crit :

> Hi
>
> > What=E2=80=99s the difference between the build/buildhistory/packages c=
ontent
> (all
> > the packages found here) and the installed-packages.txt file in
> > /buildhistory/images/...... ?
> >
> > I can see packages in first one which are not included in
> > installed-packages.txt
>
> A recipe can provide several packages, usually one with the same
> name as the recipe name, then the -dev, -dbg, -doc ... packages,
> but a lot of recipes provide additional packages.
>
> An image recipe defines what packages need to be installed in an
> image.
>
> Even if your image requires only a part of the packages that a
> recipe provides, all packages will be built and will be visible
> in build/buildhistory/packages leading to what you describe above.
>
> On top of that, if you built an image which contains different
> packages before or bitbaked single recipes then those would also
> be seen in the build/buildhistory/packages tree.
>
> Max


That=E2=80=99s really clear ! All I needed ! Thanks a lot :-)

>
>
>

