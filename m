Return-Path: <chmorgan@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id A0A956ABDA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Jun 2014 17:25:44 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id to1so3609473ieb.30
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Jun 2014 10:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=pONs8PchSav1GN2gOc4TbBIXt4PRd4bqtDAUos2TwVc=;
	b=pSKQ9Do+Tj8Ysr0ohI/lgvIg7VrMXt8aKVb0zCzwAahNY/K7x3AKzSXUA37whXU8iu
	REe2qdvcBO5sVFFHt436TgIMvwddCdMA/51GtJtYk/ZiH4Y7j9+RXRdse7Ta1y4lTGlW
	pLUgAnFvORWl00+bm68Ic+Fipv9g7DpbjHF4qBLyCRsbAiJXuBKZtT9ji0zbGx0gmfJr
	9MeSlCWaSl/vLwARlxAee1SIRU/JDXlQM2aAGtnQFmOgm0oX6wa/EhbNecligfDoOLrR
	eZhnETxVO6/BsA3c0Ny/2QGBn2ouhKjEZr1TxeFCcIs2HFZGIWT+d3Xbyt609nknRS5g
	rq5w==
MIME-Version: 1.0
X-Received: by 10.42.127.199 with SMTP id j7mr28282782ics.27.1401643545045;
	Sun, 01 Jun 2014 10:25:45 -0700 (PDT)
Received: by 10.64.228.141 with HTTP; Sun, 1 Jun 2014 10:25:44 -0700 (PDT)
Received: by 10.64.228.141 with HTTP; Sun, 1 Jun 2014 10:25:44 -0700 (PDT)
In-Reply-To: <CAMKF1srL9BJ1nTKqJdjrj+ZxaU=k=BNONuLhExwoitzDJMvc1Q@mail.gmail.com>
References: <CAAPegz1HGg34=2kp7DUj8hOR3dmc1QtVe+hFvQPVoNhz5ptTeg@mail.gmail.com>
	<CAP9ODKppar=6rRFF0Vb+TQL3e+XZgirCfdMWXSN7cviQVBAFSg@mail.gmail.com>
	<5388EB65.5000305@mlbassoc.com>
	<CAMKF1sq00_iLbSEhsYbGh39VZbJQ7hdHoDN=hcQj7EYGUjTDhQ@mail.gmail.com>
	<CAAPegz0Bvz4xiUBfpQ_R5CTrSUMBnpbNjfqW6GAhj_3rQCpJvA@mail.gmail.com>
	<CAMKF1srL9BJ1nTKqJdjrj+ZxaU=k=BNONuLhExwoitzDJMvc1Q@mail.gmail.com>
Date: Sun, 1 Jun 2014 13:25:44 -0400
Message-ID: <CAAPegz2CF3mQiaohtz6K3W-1BC=WYxwtnM2cA4xetJoRYPv1Cw@mail.gmail.com>
From: Chris Morgan <chmorgan@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 0/2] dfu-util cleanup
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
X-List-Received-Date: Sun, 01 Jun 2014 17:25:52 -0000
Content-Type: text/plain; charset=UTF-8

On Jun 1, 2014 1:03 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>
> On Sun, Jun 1, 2014 at 3:57 AM, Chris Morgan <chmorgan@gmail.com> wrote:
> > I can send a patch to remove 0.4 as well. Wanted to wait until the two
> > easier patches were in before stacking another one up behind them.
>
> this all could be just 1 patch
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

Let me resubmit in a few minutes.

Chris

