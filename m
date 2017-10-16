Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id CD5E971A50
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 19:44:22 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id e46so10484172uaa.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 12:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1tvmsjzXiNyhqkFXGeemJ+XQv6BVbluyeAL1M+rlbH8=;
	b=QuBBd+uAedZaOdyTkOIq3uJnRcjqMCXx2WIGehLOXNlD/YQypa90cMwC1fcfr14QGS
	k2X1nrcsZLe7yZ+VxmgBDyOSHYXdinQeuchLqgPaOOjeAyi8R8BovuQfV7zp6ak7WXc1
	xHckr6kZCTFU4WqhNv4YfL0fMxSqLPju6xGbaJPszcxsEKGLgRiJae7ab4ceLc/ToPzv
	4USCLImOaSA/zc+HXUHo9E5EUItWUskIqXfIwEQSdBxNStGAMZ3DTGc5NpqGqvrsDTSN
	FU8s7Y2O2KPsVCzCkgaloLXZJwA+LZFxYvVDYgc3ty2WKtnyhQ7DYlA8nzWHL7wUzMLM
	sOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1tvmsjzXiNyhqkFXGeemJ+XQv6BVbluyeAL1M+rlbH8=;
	b=Zmjum2j11T8AwmWJ+PNQ++xHtFL8gBPNvf4xFWIM5b9tyGDDam/iat0snu3XGcU0A4
	16U6SAca9UraSSQrwXbxTCGUvm64h3rG6mJYvqWMxjXUU4BOvIt78CxJ5SwAY86kt1gF
	cTeDkbzq1mQmVSHNlztVDJj6rHWv2/CsYTwou7udXuOxusP2bPx1q8CNcldWxOCBwBTe
	pbXoYrgw8eMrcU4r06drbkEPPzL4mUJmNki0Ra/94VEdB0u+2tpe4MBEx6Cef29qCnVX
	L8DAenO7C44ZkCzzTWt9d72mSmDXhajSmE0TIk1ddPlVFA7i4ctNXRG74Fi8XpFSnQ8T
	GEWA==
X-Gm-Message-State: AMCzsaVH2aQANnUYz0GajGlSwGAyOAJUgHl5WWFaWmOoKjbvV+VeDD1V
	V/6L16jnGYVcVMAL8Yn4ed8mquScd4ARn3c0zZmLZQ==
X-Google-Smtp-Source: AOwi7QDnIj9PtfDjgT3cnnWDP+SvpYEGWUGy37K2aoZdz7fOFgKVMMbYzi+UfAos8ISCeQsMat2n2bzFrIUDWkj7TOs=
X-Received: by 10.176.24.74 with SMTP id j10mr8157697uag.18.1508183063718;
	Mon, 16 Oct 2017 12:44:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.72.69 with HTTP; Mon, 16 Oct 2017 12:44:23 -0700 (PDT)
In-Reply-To: <20171016124028.71360b0fba325a145b94bfbf@linux.intel.com>
References: <20171016104228.18892-1-schnitzeltony@googlemail.com>
	<20171016124028.71360b0fba325a145b94bfbf@linux.intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 16 Oct 2017 21:44:23 +0200
Message-ID: <CALbNGRSpy07F+E_Ou1_ieMAb0Y62PKDddxOBb+mvo2Qg-GG+LA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] fluidsynth: update 1.1.6 -> 1.1.8
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
X-List-Received-Date: Mon, 16 Oct 2017 19:44:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2017 at 7:40 PM, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> On Mon, 16 Oct 2017 12:42:28 +0200
> Andreas M=C3=BCller <schnitzeltony@googlemail.com> wrote:
>
> > * project has moved from sourceforge to github
> > * autotools was replaced by cmake [1]
>
> Worth noting that  license changed from LGPL-2.0+ to LPGL-2.1.

Yes I forgot to mention

> In case you send a v2, use a lower -M value for your git-format-patch
> command, this may detect the rename.
>
I have

[diff]
    renames =3D true

in my .gitconfig which does this job fine usually. I think rename due to
changes in almost all lines.

V2 required?

Andreas

