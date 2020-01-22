Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6534F7EC95
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 19:17:32 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id y8so299261qvk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 11:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u53o8Cv/eQd56AAa0erjFbOtW/HJOKoh15w8j1geS/Q=;
	b=ewFQwv5M7Sx8slGolsMFJ9/UDgCx5yIldq495/Mqi7p7ujoilk9YrC409UL7fmieIp
	mk35X4TJKrh3zOnUqqjtgiabeSZCZquNL1PrcXqPJmjdWTtWQPRj6Q+Cq/rf2tO/3A4T
	XZgp98harV/snq7ao4eBTG/1vqU0Jy376nV0nW4j1O4lQqocTwNbUus0HZNTn30OSuE0
	uWWq9eVfSmLNmUt9t1FWtcgJFpPeLZuVnNFw7xsY0YmgE5apY9zvgEQO/McIIY7F5icG
	TsQZs3niQpnZPpHV74GQGD6Hx6oxqmE+qIbSNMPYtpW+c3eH6mLMGm3rlrINhGVEUT96
	wJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u53o8Cv/eQd56AAa0erjFbOtW/HJOKoh15w8j1geS/Q=;
	b=NS5wnKcL7ppGX1CTcPp0WTFimA41jz9SVhsCvOmOJKpdJkAnvX+9eskCTpIJUDWLnF
	Y6E9uq1i+a7PgtQrMgxLHlXO2ZyNFuxrKUN2wIyfnABjgeo7xp0t3wGi7XYQLgs6LCG1
	yDIp5Afvhbu7/UITIZKRiuH9THMNKT6u+DRHXPR0oiWLd/m/H1qtSFtVoVTQbw79mx6V
	ZJp/5PxCEpEg/Y90fayZQhWL7WHMKNGGoGl4o7Mr4vfdHZLKnC6LXrw5G+xN8RWvTvLR
	SKfwZqpLUqN2CHgU7cRv7XCUdM/w/NX9Vt2nqQZa4nmZK6hw8sb/CpQkIfVpL+v/gZKI
	bdoQ==
X-Gm-Message-State: APjAAAX5MBxjv1P0f5ZKZyTBbgnPXiXPdVmUHv9Y4EHUx63zK8w+DWnt
	9AJBzEqeBF4UBByfngZt5bqr2g9w8+u9ARrPRrw=
X-Google-Smtp-Source: APXvYqyjTtTHJ3p35yhG1Q9DerqsFr+MEkIJDVVdqgzdW0u+xMW8tCiIxuZ0dnFPWKQ1Q7MVP/lzI0dpQgu1C3zW68s=
X-Received: by 2002:ad4:478b:: with SMTP id z11mr12409495qvy.185.1579720653213;
	Wed, 22 Jan 2020 11:17:33 -0800 (PST)
MIME-Version: 1.0
References: <1579301025-29499-1-git-send-email-pjtexier@koncepto.io>
	<CAB2nKc_JoM6ASEBQAe1gs74W29VAMLExr4rJJut8knKLFkAMUg@mail.gmail.com>
	<b0a03674-9188-dc12-9499-45e908420a4b@koncepto.io>
In-Reply-To: <b0a03674-9188-dc12-9499-45e908420a4b@koncepto.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Jan 2020 11:17:22 -0800
Message-ID: <CAMKF1sq_Wa_qdHE=qeTytuLOTv1-AaMo+qLXYv57nknQzJK+OQ@mail.gmail.com>
To: Pierre-Jean Texier <pjtexier@koncepto.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] cppzmq: bump to version 4.6.0
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
X-List-Received-Date: Wed, 22 Jan 2020 19:17:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2020 at 9:36 AM Pierre-Jean Texier <pjtexier@koncepto.io>
wrote:

> Hi Vincent,
>
> Le 22/01/2020 =C3=A0 13:17, Vincent Prince a =C3=A9crit :
> > Hi Team,
> >
> > v4.6.0 breaks some namespaces from v4.4.1, maybe we can keep both
> > versions until people migrates?
>
> In fact, before the bump the version was v4.5.0, not v4.4.1.
> But I think master should contains only the latest version.


Right I think this change Looks ok for master unless 4.4 is long term
release then we can discuss that fact

>
>
> Thanks
>
> Regards
> --
> Pierre-Jean Texier
> Embedded Linux Engineer
> https://koncepto.io
>

