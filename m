Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8A6D870905
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 17:02:11 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rp18so1907000iec.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=TNMGtL7ElD4MruRgdBuB+ZDKf+oU38Ji/Emp5wNCRZw=;
	b=qP/15gfkkty7GRORsBuq630vuii8dk/GIfTZ4mE75ajB6x0SG+cgbpqMVoIYI6k5Ev
	nI3O24HpDVv+X4prd8jGPjxodgZkbnjojWj4Y4UmY2xbLY40sfhiPqOD0FySTD7sxAZA
	xURGPnT4CkZkO8U9ymLXtAyu1StenT3M7H0cZKMZut72ck0MhpqcCiRm7LJZnykI1dzS
	QRO+uNQ2hxY92zacu70W3EGUu92gE6dVBywKcaae8NQ/+9rU+iw2Nm5rdpDI9+5xu1+v
	xHoQ/iWhie5odf6Gl8lcZ5pIlhYqQJVoSWxJoTR+5ZClRKU9JN5DnqO7G3GisYQycKQV
	Kmbw==
X-Received: by 10.50.13.102 with SMTP id g6mr9747256igc.20.1406739732155; Wed,
	30 Jul 2014 10:02:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Wed, 30 Jul 2014 10:01:42 -0700 (PDT)
In-Reply-To: <CAP9ODKo8o-bidnDgAUQZD5Yek_9fHg2FWR=m8+xE=-pLS4ttMA@mail.gmail.com>
References: <1406629327-29169-1-git-send-email-dv@pseudoterminal.org>
	<CAMKF1sqknbM=rXZCRLjPtcHG_1-D1wV+XtBDtao2kOTG9F81+g@mail.gmail.com>
	<CAP9ODKq=mNeFOf_DMTNiiT4Lj0H=zujFyad97=E1K+KGTrr5OQ@mail.gmail.com>
	<CAMKF1srBNaC9hA8Sq_-jV3qmwn+SM4-nXpmvSBfU3+VftCUEZg@mail.gmail.com>
	<CAP9ODKo8o-bidnDgAUQZD5Yek_9fHg2FWR=m8+xE=-pLS4ttMA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jul 2014 10:01:42 -0700
Message-ID: <CAMKF1soqe5woG5DcO9FP0tPVpprtgnHKMY4W8HcThZWTdncioA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 1/2] chromium: Add PACKAGECONFIG for disabling API keys info bar
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
X-List-Received-Date: Wed, 30 Jul 2014 17:02:11 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 30, 2014 at 6:02 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> As I explained, this is the requirement for some projects we've been
> involved with. The idea here is to share it in a 'reusable' way and
> avoid this patch to be kept private for no good reason.
>

than have it in bbappends would solve it.

> I think it is fine as is.

For you yes I understand, do you have say of other folks who use this layer ?

