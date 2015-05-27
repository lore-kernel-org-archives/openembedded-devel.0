Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2E34C65D6E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2015 06:28:07 +0000 (UTC)
Received: by pdfh10 with SMTP id h10so551380pdf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 23:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Rs1e1Joalr2jRlFfClWJsBX+cZS3vNere0BGrNFiUIk=;
	b=frYECOQOCNubzgZe/jYrQL9aBiKk7cDhSlXUQ+bJZm6mxdvLnerCdc72oVTVBc1PY6
	cRlf1ZOcrjmqLzXMyra+VC7R8hQ0Le/FByMB0uK8f528++YlO/nbvBoL00hX//gUQuJM
	PKffs+NRx/sJdHNHWiNNfJcZFyZAyyBcbVy2Emg9GiCi2ucQ4CJxbGIH5HQkYeboPz29
	Eyd1p2EzxS0VVxKcax5ZizPZR1vmYmM6I1xnR2/+K71wD2+yQaveTim3J60Hk25W7lrW
	iPusOIw7PtO0xYcD8i4Vf1jdGUmJgxwColDS6c2ixtFvDg0XTrgrWLOERzkWPXBFXJr3
	cuFg==
MIME-Version: 1.0
X-Received: by 10.68.57.170 with SMTP id j10mr56340788pbq.150.1432708089302;
	Tue, 26 May 2015 23:28:09 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Tue, 26 May 2015 23:28:09 -0700 (PDT)
In-Reply-To: <CAMKF1sq9oF9RbBXamXURZ7aJiVS_kgB6ys9Ef6GYt9m5uYENCw@mail.gmail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
	<1432588449-31413-13-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1sq9oF9RbBXamXURZ7aJiVS_kgB6ys9Ef6GYt9m5uYENCw@mail.gmail.com>
Date: Wed, 27 May 2015 08:28:09 +0200
Message-ID: <CALbNGRQo0Cada3UbkFmAwYTXrHRaX1wd4++Uh77SgWTmkgM0dg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 12/12] imagemagick: update to 6.9.1.3 / add packageconfig for openjpeg
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 May 2015 06:28:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2015 at 6:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, May 25, 2015 at 2:14 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> * openjpeg is new and auto detected by configure
>
> I wonder how many more recipes will auto detect it. Probably a world
> build will tell us more.
>
Haven't go the resources for a world build but I thought Martin does a
world build before applying.

Andreas

