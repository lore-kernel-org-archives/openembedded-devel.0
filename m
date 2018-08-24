Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8D19B79597
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 22:00:08 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id r69-v6so17217614oie.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jQPknD9ULXfWajT8qlNtWAeK9B78ylysQwVlbYvVREw=;
	b=sV6HkI2s2dqMIFSKA4bHA97xv1tgVYGTQMoGOTbz0iSD4XWGqjtpKNGWva0zhJIuT9
	Q4hkAFc8dfE2VzURhFENM32w+AU1mz5sAPzfzu9IU9S6H061Lv6RLmtmR7Q9dr3EPoWr
	Rg9nwtX1+m8HYthx4h60XhxjqbucZWyeAnTHyqEcwqDN+dHSmLxKSpUib9+FmqqRkX7l
	AMwhda7j3ZfAFsw1ouFsr3FZ4p+5h8jXen3YEdQ+4zDn8lgLucCnlbRaDkIKG2cu5OQN
	TOzy3MbYqmhkxU+Qshy1fFwNezZ4HSWU0WiquIG84ibsfkS1HdyJG8QHSZqOcyJsBrIr
	VCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jQPknD9ULXfWajT8qlNtWAeK9B78ylysQwVlbYvVREw=;
	b=OiBCdbkTjvNhgK6b1OXdT5VuNTRWri3VJM5+qIhGE6qlm16EPYxY79oG7Ml6yl2QPZ
	vmfcswq2KWO84Hsf9GCJhtq4/vt7+0th05Qeufy8xTE5vfAGjkaPHaKGjGGY/QFSwvIY
	bvwsWHsjy13cK+Ui4l0n0lEwociAmv7RsCwzQAkktFIGSvZWkVVCKx5H9drTMePXVkvQ
	lCC80AKMwlLWdsZuOFPKyKzFls5+lfPw8/5Msw6n+UwT2HxVvh6xiXHMPjJG/SYJkdk7
	lukRDFfAYQpqgEZy4dembAT8rakmO4EfAhXup9verT83a6ghF9piJqeoL4mNLSPLcSQz
	G9Pw==
X-Gm-Message-State: APzg51CyIBHBCOIiztsQ8umuE5JquTUPLY6TYNHhr/KrjAZoJuFniZM0
	Tkew2IGP899S4hv8nLaPkQC7P8TLPiO5s22kvPc=
X-Google-Smtp-Source: ANB0VdYs+vWl7DHhud6HPbtRYbM/a373joMK5xl+W2KbNe9WwW7wDPFpJURn2wruETl6u0oSUr/6scWA3ltCb2KYLgY=
X-Received: by 2002:aca:f488:: with SMTP id
	s130-v6mr3265873oih.269.1535148009412; 
	Fri, 24 Aug 2018 15:00:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:454b:0:0:0:0:0 with HTTP; Fri, 24 Aug 2018 15:00:08
	-0700 (PDT)
In-Reply-To: <CA+chaQcW5D+NbEPNU9CLmEp5nWctpCsHGKyRMNX_bO9C+d8iWw@mail.gmail.com>
References: <20180824203504.699-1-raj.khem@gmail.com>
	<CA+chaQcW5D+NbEPNU9CLmEp5nWctpCsHGKyRMNX_bO9C+d8iWw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 25 Aug 2018 00:00:08 +0200
Message-ID: <CALbNGRTQFhUwTzUiBXwc0bbzLbbuchQDzCZxQikqrKFmOj57sQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] Update maintainers
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
X-List-Received-Date: Fri, 24 Aug 2018 22:00:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2018 at 10:38 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
>
Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>

