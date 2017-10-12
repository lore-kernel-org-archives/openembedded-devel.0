Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id B077071A92
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 12:50:18 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id t203so1349567vke.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 05:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ni2NNQAY5vjNWZQCId7NNEV1nlarHZLzSbKgEUPBiF4=;
	b=dbZFq7Rht9uuBzWVcZJO0E0MOaB74rZaXoYEDYeXroVvawddAd+fHQaB2snpIY/NzA
	F4OWsuGJYZ4tmzQhaOSyaCDeFC2iVvE0M/KnVZjXSNKXu0udOMdpwZkHNKQJBH+tsHOS
	P95YCs2q+4++rG8rTqeQMJtgBYFjYbuDUV/6OJo52jyO2m69/IOYVNJvKTWi6Wtl3SEp
	TIrruK99TgUvHs6jGO8B8c2evJJnAQp6I0Qp+H8M7QacrdE0naIOnu7MAB6GbWSKsLv/
	fQEDqkR9yQYCbuTrZddBgvUfQuWLHTSnhEBt8Ov91XxC3L1Kwf2HkeZVHubvsSkzEt89
	XoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ni2NNQAY5vjNWZQCId7NNEV1nlarHZLzSbKgEUPBiF4=;
	b=FAX+60CdZrE8cVym72jQUvsNxiYPMD2FDBUsG8Q4zGJjq6HoFlN8rJlvgq90Gb0LTd
	7uGp62k40wMA1xUJR1jVRHZjjKYgMurqsWPIeaYzBjHZNVQ+Qsr0FdFaIv5EFRrIplYf
	3EVxng7K0p114R6AE8NodvjI/wjAmSvMp/tZXqRm71mLzbBXo4s6XPMnYgDQ1Tb5Cb1T
	HWO3bivxrzfGpzVg1KTNQQdovOhr7HPwiBsr1mPpVqT/o+x/0w2FVD8R/nD+q0GPh6Ub
	SSd7j3hiz1UcmXFeS6vWgjGKQBcMfQxmHea8VC00AXm/dLOA6tlFgC7h8d3Y+2Vlawew
	Eshw==
X-Gm-Message-State: AMCzsaVRNMZFANOCJ06h8v0sm2MmJSGf+Gfh1x1ZoQ08Pm6CWBZaP6cF
	10QNBomJ2Ditz7OIqNxGdQPNHVkUZ1XLhk/rc9Y=
X-Google-Smtp-Source: AOwi7QB5eUvvKeAb3xJdbN6qeDGREB4WpwZrHguIT4Wn4tAIVLSzra6s/QNPZknvpvDgDkTCr4nvnNgGAVBnbbfFVgo=
X-Received: by 10.31.65.135 with SMTP id o129mr2324043vka.185.1507812619410;
	Thu, 12 Oct 2017 05:50:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.76.69 with HTTP; Thu, 12 Oct 2017 05:50:18 -0700 (PDT)
In-Reply-To: <20171012070321.i6ajfn5bcgmjnwx5@hiutale>
References: <CACrLJgCiTiQyCjtfzSkhHzMtBTtxF6j2=cdjxQ2byb0Cihg1uQ@mail.gmail.com>
	<20171012070321.i6ajfn5bcgmjnwx5@hiutale>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Thu, 12 Oct 2017 21:50:18 +0900
Message-ID: <CACrLJgAmNZNh9PkASZdW2Y+qD-zeoc5OpN9NbFz_=YL7bx0qTA@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Stephen Lawrence <stephen.lawrence@renesas.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Keep Qt 5.6.x
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
X-List-Received-Date: Thu, 12 Oct 2017 12:50:18 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Mikko

> I'll check if we could share our branch to bring Qt 5.6.2 base to jethro
which is mostly just cherry-picked patches from krogoth branch.
That's great and qt company is also managed qt 5.6.x in 5.6 branch of their
repository (http://code.qt.io/cgit/yocto/meta-qt5.git/)

Thanks
Changhyeok

2017-10-12 16:03 GMT+09:00 <Mikko.Rapeli@bmw.de>:

> On Thu, Oct 12, 2017 at 10:03:01AM +0900, Changhyeok Bae wrote:
> > Hi maintainers
> >
> > Qt 5.6 is LTS version and not GPL3 license.
> > So why don't you keep v5.6.x in master branch?
> > Many companies, opensource projects and developers would like to use Qt
> > v5.6 in master branch to use it with latest yocto release.
>
> Hear, hear. Another complication is that users like us might be stuck with
> an
> older Yocto release.
>
> Even if v5.6.x were not maintained in master branch, it would make sense
> for users of Qt v5.6.x in yocto world to share patches in meta-qt.
>
> I'll check if we could share our branch to bring Qt 5.6.2 base to jethro
> which
> is mostly just cherry-picked patches from krogoth branch.
>
> -Mikko




-- 
Thanks
Changhyeok

