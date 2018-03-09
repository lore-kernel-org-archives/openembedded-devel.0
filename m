Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id EC0A378801
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2018 02:23:43 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id t6so1260125wmt.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Mar 2018 18:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dd8YO91/4yFYNNGu01dsfcOjMSvbrn15+MsFRHZXuTg=;
	b=FdAklSklJR72FI3tmSEVsncwIiOSmgyIe3wwV7p6fAYzHhVl0cz+nKRkmGRDjdxBBE
	6UpsZLbc1vHlxzuL0EygKWFaoeFR4GPtxkR5dDTfwlILBW4zhSrbTTHyUqmKHxVgjeEH
	fGTOR6a7A0ks1GDxN5KD5p1zf9cCNZYQsWV0g4+UjH2OEl6kLBlLrJ8ozoB1pb6+UvBS
	x0i9vRKhae4Ta+r2tSQgWBow104DwLGn9Y4O3xEoh2LTiDdpWDnB1YufYGCs0Z89PbvD
	sTsje2HsPnxojBtsVSaoaYcte1fTYZ5B6RTyLofsjrx/PlFmNzqe9UD7s64VQOlFDsIH
	muIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dd8YO91/4yFYNNGu01dsfcOjMSvbrn15+MsFRHZXuTg=;
	b=F2PXbT5UpBQLgrtGpLnyzCfI+/43Pk/Ut+tadKyVPS9RgtMHR1qTQhXrKburvwIo+X
	v+0HYwpX0VUTp93Tj7MAZqL2I0MAh6gpHqogtMK1zry9oEij5ON9i3DuWKVqgQlMkMv/
	gb1CrvEeqH/8FX2FiaQUl/YvXyZo5ilWgwVWkiieluTzyP4LKQSoNyatybDWxR1BzrAz
	1HU6M66fGA4vu6xJovtFDkDM444EsdAFg/qD7I2gVQp3AJLGrFM9oK1mfQQ05QIyPHYo
	BkiOpog7b/ASOBUKmOBFbTeC3RbG1IzDol6Jx2NLwBig6mokGQrHXfr0g0h4ULmOAkTA
	2I/g==
X-Gm-Message-State: AElRT7HxbdyNWHTrlj11I1kzMIDy3T5ddT5pLO85T01/lwIS+UQkp08o
	H6W3k1tJd2PWA7XcgaVwpx9NKeqGb1qD8LnJI8c=
X-Google-Smtp-Source: AG47ELt0fb5iLCgM9nD/VOnl8ZAS1lxqLpeDAjPIwUViBuom6j0idsjzJKH9qbwRsVBx8URdiBJ62LAPTqc9HoUmOys=
X-Received: by 10.28.21.67 with SMTP id 64mr611810wmv.151.1520562224783; Thu,
	08 Mar 2018 18:23:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.193 with HTTP; Thu, 8 Mar 2018 18:23:44 -0800 (PST)
In-Reply-To: <b7d094dae2b84636912a257ba07f0e9e@aptaiexm02b.ap.qualcomm.com>
References: <b7d094dae2b84636912a257ba07f0e9e@aptaiexm02b.ap.qualcomm.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 8 Mar 2018 18:23:44 -0800
Message-ID: <CAJ86T=V72v+PmGadiTJTe8PVtbQmmfYjHu+ot_aaTUBjS3bR8g@mail.gmail.com>
To: "Yong Zhang (AUTO-BI)" <zyong@qti.qualcomm.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: The license of hostapd v2.6
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
X-List-Received-Date: Fri, 09 Mar 2018 02:23:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 8, 2018 at 6:00 PM, Yong Zhang (AUTO-BI)
<zyong@qti.qualcomm.com> wrote:
>
> I am doing Yocto2.3 upgrade which also update meta-openembedded layer. I =
find that the version of package hostapd is updated from 2.5 to 2.6. And th=
e license is updated from "BSD" to "GPLv2 | BSD" in hostapd recipe. As I kn=
ow, There is no change in the hostapd licensing terms between 2.5 and 2.6 r=
eleases or anything that has happened since 2.6; nor are there plans of cha=
nging the license in the future. Why do you put dual license in hostapd rec=
ipe?

The LICENSE value in the meta-oe hostapd recipe has been set to "GPLv2
| BSD" since the original recipe was first added in 2012:

  http://git.openembedded.org/meta-openembedded/commit/?id=3D7839b417739620=
11696ed02924136b00447cb382

Which recipe are you looking at when you see the LICENSE value has
changed during the update from hostapd 2.5 to 2.6 ?

