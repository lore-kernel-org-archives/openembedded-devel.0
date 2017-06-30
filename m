Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9123578280
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:13:13 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id g40so8630312uaa.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kTnuXdW8HG51+nv+YkjjRTx0I7aeEvHqruRKMzt0MGk=;
	b=TyvhmLI6W/Y/LN5S+6ojqpu15JH0KVWhQal0v12DopC48Q78/PtfeOaWRbRGWeInOB
	CNC1gxQENX70u7gmE+KTXLzdSveDwy4AsKUOqGHjhVvFVNrCWKPH8r6hd9r4pMDz5eCc
	q+xQD0PxdVK5W7dWQk2VQk/y56xq3QicqhcYbsyhdtiI2SLsAj20yqXdYJ1BTtdlI+Fl
	h9UbKj5PFaZGAitlMJUPB9wk6AcVKXJ9fx2o8lXlUqaB4OWn2+ASKv4WjHiB2SXQOjm2
	geY4wX2n4JV0ZnMy1o3SJyk1uwJWcgj1uckC6WzS7nsEOwjNjTgkMHtxIeXP39FtHkX9
	JgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kTnuXdW8HG51+nv+YkjjRTx0I7aeEvHqruRKMzt0MGk=;
	b=PuPY64zNxibArxYxOw5leQeUrPCkNnQ6iZfOuMWoB5fjo9XdPQsaoHtZsXvqv16utQ
	H8Dt2zthL4DmQAJt+Cgf+b60Zp6yexU4ffhQOnD0BTKgO6H2lymtRvXUCiOkoSWuCtR5
	pforXQiH08C8g6yO2sp8MdGwtJxftPg9CZtRq9380amCz/Kr+b0oNLHW0mAmncXtomhv
	IsDxpFX52dfNwuv7GIu7iY1HKDHBTkjEsrCkMV75KEPAYKe/NvdCu1dk89hpmDzCfT1P
	WZymWuPbFqabD0PINYKlCpzli1EHnl2fpu0lztUCIpFLZbXOe424/kSL2i1pI06pKfp9
	IHBw==
X-Gm-Message-State: AKS2vOyASOvNkksTre9ggaJIYjOdfBgC0h9J6Q+wBZ0z5jOxmg2YFSKw
	fxhmloBzcOhibW6wdljRFRnX7iy5oA==
X-Received: by 10.159.48.69 with SMTP id i5mr11750938uab.106.1498828394687;
	Fri, 30 Jun 2017 06:13:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.77.72 with HTTP; Fri, 30 Jun 2017 06:13:14 -0700 (PDT)
In-Reply-To: <CAMKF1srGbEGw+S9072yFMammJ5_8kxzti6QTzJ7RpCBH6hSMTg@mail.gmail.com>
References: <20170630120731.3745-1-schnitzeltony@googlemail.com>
	<CALbNGRRU67B0TZXShLBxdsMWZnjhYQvGm-PmVcN196vFByoonw@mail.gmail.com>
	<CAMKF1srGbEGw+S9072yFMammJ5_8kxzti6QTzJ7RpCBH6hSMTg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 30 Jun 2017 15:13:14 +0200
Message-ID: <CALbNGRT_jgzvDDuos-sbrncZqHF_dDVU1Ez2xHOtH9K3-1g4XA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/3] gimp related updates
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
X-List-Received-Date: Fri, 30 Jun 2017 13:13:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2017 at 3:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Jun 30, 2017 at 5:10 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Fri, Jun 30, 2017 at 2:07 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>> It started with gegl failing with gcc 7.1...
>>>
>>> Andreas M=C3=BCller (3):
>>>   babl: update 0.1.16 -> 0.1.26
>>>   gegl: update 0.3.4 -> 0.3.16
>>>   gimp: update 2.8.20 to 2.8.22
>>>
>>>  meta-oe/recipes-graphics/babl/{babl_0.1.16.bb =3D> babl_0.1.26.bb} | 4=
 ++--
>>>  meta-oe/recipes-graphics/gegl/{gegl_0.3.4.bb =3D> gegl_0.3.16.bb}  | 4=
 ++--
>>>  meta-oe/recipes-graphics/gimp/{gimp_2.8.20.bb =3D> gimp_2.8.22.bb} | 4=
 ++--
>>>  3 files changed, 6 insertions(+), 6 deletions(-)
>>>  rename meta-oe/recipes-graphics/babl/{babl_0.1.16.bb =3D> babl_0.1.26.=
bb} (72%)
>>>  rename meta-oe/recipes-graphics/gegl/{gegl_0.3.4.bb =3D> gegl_0.3.16.b=
b} (91%)
>>>  rename meta-oe/recipes-graphics/gimp/{gimp_2.8.20.bb =3D> gimp_2.8.22.=
bb} (89%)
>>>
>>> --
>>> 2.9.4
>>>
>> Please ignore this series - it went out a bit over enthusiastic...
>>
>
> I have these three updated too a bit differently in the series I just
> sent today.
>
Let's take yours :)

Andreas

