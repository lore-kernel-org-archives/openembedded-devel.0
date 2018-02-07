Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC3978062
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Feb 2018 11:43:16 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f3so2746498wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Feb 2018 03:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mfgdaL7m12+0bGLjMDkCJ97JEboDPXWJH/7Y+TS0twA=;
	b=jqWgCNt7jXhyGDia7j2bxhHnAVuIcqzwjJO17CXRGHndNscOVzHXDgnHRqdnYsZ0Ue
	YJ1kmVv1VQcGfmlZQQ2i4bK6fudoFGZkOWIHdff+yX2N1HCnjKaNhSTUVMZWSeVF6WEx
	cSrF2pCNBTQFc8tss8+FkyFD95Gvi45hLJmjvEIYo6SVEL/Ia8qumlzKBB8/56/KDHAn
	A2b4NJyXvE9mjDgwwOic973JFsNXUkNibMwS1uc6SKcscrqIBbPcNGelc7wEHTbnLFoy
	p9VXKbYy67csTwvm4DNzVD2W8+zw1AzA6cP1RsljpvodP4NDA4oiS4lrO+NBZdu+bdLW
	PblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mfgdaL7m12+0bGLjMDkCJ97JEboDPXWJH/7Y+TS0twA=;
	b=OsZxAeqnHLBfSlD0KdqReJQQ8uijcr1wSzQWLLbdfrTqBAqUUnNVietvM5gSq8ufYB
	sYXwfCU84Fk7mUoMVjiYWw7NunyUUl0dVJUQbbOdV1HBniGdLXUgjxvLsNY4QMud45SR
	4/r867iktsGZZ/HuYgKSEVzLhmoC3/9Yky3ymWpRosfamRQXq2G69Zf9OHxiQxa5waDK
	2L374fLSyFEhuMTE6v0SpW3ULeAfu7u+gL93UJ/d9xI3yny32gMbBi/BXxHesC1tyAXS
	AQa3S/jgJ7UBxlqIqjmzyeP9IHQ9uIihIzSgDpYL2+wwRpojUwMi3cPdPPbF4ZGkywmu
	xdlQ==
X-Gm-Message-State: APf1xPC2ZAL9Ylr8LjTJjn21LLwuGTDCZjmn6emG0jswCV41MHr6ZR38
	zvJjcUF5LwNnD0gtmK4ivx44u3PfsLV1bKDJPKg=
X-Google-Smtp-Source: AH8x225TUk/JCBzXejx9E0CBaPwmNKVqo+wefIPuu3Sz7zDinarn6AakFme3cetEyFCdZemGNtfF0NPnsSBHywZi28w=
X-Received: by 10.28.131.210 with SMTP id f201mr4742963wmd.117.1518003797275; 
	Wed, 07 Feb 2018 03:43:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Wed, 7 Feb 2018 03:43:16 -0800 (PST)
In-Reply-To: <14d170b5-9a44-4d23-9b88-10e356fcff13@comarch.com>
References: <14d170b5-9a44-4d23-9b88-10e356fcff13@comarch.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 7 Feb 2018 12:43:16 +0100
Message-ID: <CA+chaQdgTjn40CEEMGf+db4VRJvHfg3tmFJ49iiViZcMNkVL5g@mail.gmail.com>
To: =?UTF-8?Q?Tomasz_Meresi=C5=84ski?= <tomasz.meresinski@comarch.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [rocko][meta-python] python-twisted: Missing dependency
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
X-List-Received-Date: Wed, 07 Feb 2018 11:43:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

See
http://lists.openembedded.org/pipermail/openembedded-devel/2018-February/11=
6622.html

On Wed, Feb 7, 2018 at 12:16 PM, Tomasz Meresi=C5=84ski <
tomasz.meresinski@comarch.com> wrote:

> Hello
> python-twisted-core has runtime dependency to python-hyperlink (as alread=
y
> stated in python-twisted recipe).
> That means, that commit 567131a9bfd8733f68a7fef6345de6d4453b9a98 from
> master which adds python-hyperlink should be cherry-picked to rocko branc=
h.
>
> Thanks
> Tomasz Meresi=C5=84ski
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

