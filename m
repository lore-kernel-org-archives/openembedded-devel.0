Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id AC32F61AD0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 13:42:04 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id md12so1694990pbc.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2013 06:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=0LOnLhxtcRk8NX12IimGUf6+ojp0DmlDY9EgNyC3RLg=;
	b=GBOuJYFnxSN/wy/IGn4ztuVvBFMijfy6NpeJ8LlTXGZkTl+sYXpiFzz15ZUQHeO4WF
	EIIfVQzTnV3PPJK5l0+cWPioEkbmfpOOJKB2FqR2RhegeQkYn3S58c+ihJj2+ayI4Hai
	34MJfp6SpwcnZ2b1zktoNsZQ3BKiIR0TZlVBhGiz4Ek/c45SiS/TLNiJ0UTCw/RKJ2/t
	KM5JG0czi1cR9Dar8tXhh7Auzoy7Z4CKzwFlyd0HuKw7R98gQjZ4+tk5RuiI88Sk2AAG
	j6BGxszCI3Qtj7A0SCZg+le2NnVTkD5K1RNPQlAN9k8hRQie/meBcX0WquHtnxa/FHxR
	vr1Q==
X-Received: by 10.66.197.136 with SMTP id iu8mr8617293pac.0.1369230125833;
	Wed, 22 May 2013 06:42:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.100.104 with HTTP; Wed, 22 May 2013 06:41:45 -0700 (PDT)
In-Reply-To: <CALbNGRQPq9X0JiooyTz11i+-v8zpUHCVWO3R4qzPr3tyJgmKnQ@mail.gmail.com>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
	<CALbNGRSV7KK5hPddSiVTRborW6_PZfYstDFfu4M2oRJ5QwtV_Q@mail.gmail.com>
	<CAJTo0Lb-d-ZOYc+WxaONDXy+vwbsEJKG8SsnQ0LDP7og5Sm9SQ@mail.gmail.com>
	<CALbNGRQPq9X0JiooyTz11i+-v8zpUHCVWO3R4qzPr3tyJgmKnQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 May 2013 14:41:45 +0100
Message-ID: <CAJTo0Lbt=0TpSzLRDXRH=_ndnGKN0k17cwQnpnv=fBwbB-N-jw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQmLbGoBki2YfFkMqioqJ49qv6wVK3xbtLkB502XuKiSHGT2NgAT9gSG+inr5+f0NejahvyY
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Wed, 22 May 2013 13:42:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22 May 2013 12:01, Andreas M=C3=BCller <schnitzeltony@googlemail.com> wr=
ote:
> Haven't found at-spi2-gtk. Do you mean at-spi2-atk?

Yes, typo, sorry.

Ross

