Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
	[209.85.222.174])
	by mail.openembedded.org (Postfix) with ESMTP id EEFB27E1F8
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 19:02:17 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id m18so19166502qki.8
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 12:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2U0cdVKCeNI4GL4J0aQTx4wGZ3C/a+teguXGu09TgYU=;
	b=YsxQM5M5hqtKEM/2a1X9j8Gd0zodGvhF8ghRVWpdgnS05kMn83AzEm5gEkogxf9E2n
	CrKULjc8ymVD8hHS+/DNx14gal3uqnEdkixgvoLwYBH/9yM/3X9pGHiZIcIiQxUVGD3u
	632S1dWINMF3jhiAhL9kyc/rVXxIJguGSiRBeiq/yUnRWQdeRsBQ33pzvHfYWX5Lqx3b
	XppI7A8mQ7561gFlKbBmQwSHibeIBvseyJGnGnaJVgU3N5hX4JKw1ProH5LeMn1lD3k/
	pW2GqiaTNiSuPGhzbAUqgFMnK6ORadLkt6DYn6MA5ShJVHVShy8iMvWvhZwArQVwzskf
	DrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2U0cdVKCeNI4GL4J0aQTx4wGZ3C/a+teguXGu09TgYU=;
	b=DmuQWl0xRNjc7JVnEuv23Th8AZJNYN3ws32kJKFtoCgePvu9kd4Ax+jxQAu9VjVESc
	VKHMwaBj18ubWgwL3D82qiZtzpUFFXpsg39Hgu9vrrco/N7FrKe5pAnjSUljUrVNKcPG
	hTbFW+pHhWqyqSCozxAtPZ2E/ni4bZg5+20pr6uqMSrHp76GBDqOghPsa9xMOtuQgmCL
	HnhdAfYZjvw79KQyggh0EzT1jJ5MuMQm+U9wCbqS6tUM0nOzm66vfSpYqmDE2vY23+TN
	CmaISOCQErRTjPIGK1mJdh0YrLTBDAwqEQvs8Xn7Ir3CM5hsd7wVIVVJAGVDJxhaM7ms
	tk8A==
X-Gm-Message-State: APjAAAUNor+llzMNt6lwbo75OplELqhtBLLb2ch+qA4fEdHPSL5VKqcq
	/hK1TOXKa+yU6Dws1GK8KMFK0ukuKMKRAZuEyLA=
X-Google-Smtp-Source: APXvYqzybM1jDR1JizmByskbSkmkQtkfLd/WHN10/h9+X3Feh3ByJsQNoegk/oXLex4/Ch/tO6m6O6oq/IZQE0fCYj8=
X-Received: by 2002:a0c:96e7:: with SMTP id b36mr59399045qvd.51.1558983738595; 
	Mon, 27 May 2019 12:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sr9T0K71M5K4Qh+K-PrFv1dn5L0aNpn2hkN4usLY5hDpg@mail.gmail.com>
	<f69d8e4b-1603-e599-a56e-2b65a0eeb27e@gmail.com>
In-Reply-To: <f69d8e4b-1603-e599-a56e-2b65a0eeb27e@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 May 2019 12:02:05 -0700
Message-ID: <CAMKF1sqWjwdsArsPO1D3Ky3dFa8pkAO092hqdKLsPzbKBJd3JA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: Delays in patch merges
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
X-List-Received-Date: Mon, 27 May 2019 19:02:18 -0000
Content-Type: text/plain; charset="UTF-8"

Primarily master if we have stable merges I still have one day

On Mon, May 27, 2019 at 10:49 AM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 5/27/19 9:51 AM, Khem Raj wrote:
> > Hi All
> >
> > I will be on vacation and traveling for next two weeks in places where
> > I might not have internet, therefore upstream patch integration for
> > meta-openembedded layers upstream will be a bit slow.
>
> including stable?
>
> - armin
> >
> > Thanks
> > -Khem
>
>

