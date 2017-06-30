Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB23601F1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:02:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y5so7862497wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MLAz/0bGdLOcEmtZaW3H4Wa3YQWjW4eqMvhQzbMBrC0=;
	b=Y4lyi83WkUU7wYX0zCzY5ntVlEDDM1QIaFx0Ck1lDkFzn0Q3vdH//4xZzxxhdFN4C9
	CXmNZOD0qetd1/4FqOy2j92kG8yc4F2Vp8VEh3BYFcYf9weInmwvhDNFRaGF3ifNzB1E
	8HFnoNnKrx2gulNfQsJIaLD60e8RQEcESFoMadvIS9tG07NqXB+LHf1EX3SQzHaRSd4t
	ssdXPTA6la5e6DF4KKg77aC1qNOGPYa7by1rs8FGNg+fWrd/qRoVBAa0cNkVbmjyNIFW
	6uZshD03AiCuB9bbOhaQvLHR4jsbs849fghU4y55oT+fEGRVRA70cDgZSL29RMk59bSi
	Mk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MLAz/0bGdLOcEmtZaW3H4Wa3YQWjW4eqMvhQzbMBrC0=;
	b=esOqpx/9mWC4MHgRIEU5jzkRTpAX910l6d12aofwjTLmha0nFe5ejPLFz1vYTiBOtb
	vUYQ7Drr/Wigj359omsjGlkNcInso5uSrQGZbSc8OBIFekWhQKkVjxWKTEMwnXeEMhFP
	9x0EX37Wef1xY7niJZsOdw9RsJImkHdLscZLQkXcgQjgdcEPJ7rpIR/ypbyz23zqC9j7
	e0L1nAeX4FhzudQVOjsCIMtMVePIgZt2p3IaB687N5TX/Rn+Y+vMw3a04vmjBFyp5nge
	0y7WZWKckJPUjcspn500rQPMieCj/ZXxL0pLtZBG6nkSvjx/2qkwJaLXUA6lCQ3gsV2l
	zGAg==
X-Gm-Message-State: AKS2vOwR//Uv8eS871AH+SH2l9E3gEn/1qMOhIBf+D0gZkfqt5mU53RR
	yz5uYNBj232NnQvGWYvXo9He3iX+dA==
X-Received: by 10.80.144.68 with SMTP id z4mr5233465edz.143.1498827762992;
	Fri, 30 Jun 2017 06:02:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Fri, 30 Jun 2017 06:02:12 -0700 (PDT)
In-Reply-To: <CALbNGRRU67B0TZXShLBxdsMWZnjhYQvGm-PmVcN196vFByoonw@mail.gmail.com>
References: <20170630120731.3745-1-schnitzeltony@googlemail.com>
	<CALbNGRRU67B0TZXShLBxdsMWZnjhYQvGm-PmVcN196vFByoonw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Jun 2017 06:02:12 -0700
Message-ID: <CAMKF1srGbEGw+S9072yFMammJ5_8kxzti6QTzJ7RpCBH6hSMTg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
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
X-List-Received-Date: Fri, 30 Jun 2017 13:02:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2017 at 5:10 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Fri, Jun 30, 2017 at 2:07 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> It started with gegl failing with gcc 7.1...
>>
>> Andreas M=C3=BCller (3):
>>   babl: update 0.1.16 -> 0.1.26
>>   gegl: update 0.3.4 -> 0.3.16
>>   gimp: update 2.8.20 to 2.8.22
>>
>>  meta-oe/recipes-graphics/babl/{babl_0.1.16.bb =3D> babl_0.1.26.bb} | 4 =
++--
>>  meta-oe/recipes-graphics/gegl/{gegl_0.3.4.bb =3D> gegl_0.3.16.bb}  | 4 =
++--
>>  meta-oe/recipes-graphics/gimp/{gimp_2.8.20.bb =3D> gimp_2.8.22.bb} | 4 =
++--
>>  3 files changed, 6 insertions(+), 6 deletions(-)
>>  rename meta-oe/recipes-graphics/babl/{babl_0.1.16.bb =3D> babl_0.1.26.b=
b} (72%)
>>  rename meta-oe/recipes-graphics/gegl/{gegl_0.3.4.bb =3D> gegl_0.3.16.bb=
} (91%)
>>  rename meta-oe/recipes-graphics/gimp/{gimp_2.8.20.bb =3D> gimp_2.8.22.b=
b} (89%)
>>
>> --
>> 2.9.4
>>
> Please ignore this series - it went out a bit over enthusiastic...
>

I have these three updated too a bit differently in the series I just
sent today.


> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

