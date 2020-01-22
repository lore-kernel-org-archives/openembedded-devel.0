Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id CC9657FD7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 20:13:49 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m24so66529wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 12:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JDJUcTYSJo4q6h07Hsgsr3fDjQ/kMuy9bmNI0QZn3fQ=;
	b=BN/MeS4ZmL09XF4SKSb3W7oF1YFPTN8tQwiu5eKdIfIHA+tVcTwMAXU+j8Rj66Ow5d
	eITL2yrtRni1p/dj/MUBgu0wx0/UQmIxUEowRX/43+425f+Z4rJBaxItbBOo3XhKbXSY
	6om/0lgct9ifcPTN51tw4sAKo7NJJguIFElE4aFl4F/Z9L8WeqJVa01wfH20xgzfzgm0
	DBvQ93E0Lg5Jnl9yzcVguya2q6GU74H/bmg180bGGX220iqFQl5JP6fkdDFFUSB89H6w
	Upynk1w8QqHh+bbm0hO3qnua/sRLtDGIYYsNsLQw2pg+LhjhgKEAHsZTMtBJlDik9dLO
	fkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JDJUcTYSJo4q6h07Hsgsr3fDjQ/kMuy9bmNI0QZn3fQ=;
	b=JC4ObaIIhWfkbJ1CeL0rT9fDlzG4SflnwPHkRC8/MYPBSRb0wlAJ3l8vdjLRyXmA9d
	lfc3KzIvLnkdT+N2oeGWGGxRsKrMtxoU6+gqEldG0SAaKnhxR4p3WxAZoL7YGXnfzYlr
	IPeLUjHvwKmOVO3Xhca8bxCxeZN2J9BZJzMeXfQXPny87kmpycXSugYCcTcVSxSYwfJH
	YlGwWpCEOV1d3GWrJeZmEomp/ppFh175APRMkv5JWzxBqIWqSb0XdEyFZAysOI9XwuXb
	UgakGHBnW9Lix4nziZ6N+HxnvlG+5/Zsw+pAgqQjIHQ8xdLjzqj0S0Pf+RUfZgwqMOWH
	umjw==
X-Gm-Message-State: APjAAAUAGVcNA+4S/dmBusnnaiGER0d0/YNp3nvnK2hSo5hyLfoZGvhI
	2ZuKAeVSPm+42QXfgW/XzqX6WxQtXZ9zJ3T3H8A=
X-Google-Smtp-Source: APXvYqyJPT3LpaUSnj8Fg8IMX6vy4WIjAZRCUUdh9NKAxue3RMyabpfzoBivdjvjAfqto/TWREQR5nIg8nvWAigcMs0=
X-Received: by 2002:a05:600c:2059:: with SMTP id
	p25mr4822411wmg.161.1579724030327; 
	Wed, 22 Jan 2020 12:13:50 -0800 (PST)
MIME-Version: 1.0
References: <1579301025-29499-1-git-send-email-pjtexier@koncepto.io>
	<CAB2nKc_JoM6ASEBQAe1gs74W29VAMLExr4rJJut8knKLFkAMUg@mail.gmail.com>
	<b0a03674-9188-dc12-9499-45e908420a4b@koncepto.io>
	<CAMKF1sq_Wa_qdHE=qeTytuLOTv1-AaMo+qLXYv57nknQzJK+OQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq_Wa_qdHE=qeTytuLOTv1-AaMo+qLXYv57nknQzJK+OQ@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 22 Jan 2020 21:13:37 +0100
Message-ID: <CAB2nKc-KZFiirwYdHE8pJFgAk6Qay9CCembWuAJtHpsE1hTSPQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 22 Jan 2020 20:13:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No problem to keep latest version on master, there is no lts for this
project.

By the way, for those using it on Zeus, migration from 4.4 to 4.6 is quite
straitforward.

Le mer. 22 janv. 2020 =C3=A0 20:17, Khem Raj <raj.khem@gmail.com> a =C3=A9c=
rit :

>
>
> On Wed, Jan 22, 2020 at 9:36 AM Pierre-Jean Texier <pjtexier@koncepto.io>
> wrote:
>
>> Hi Vincent,
>>
>> Le 22/01/2020 =C3=A0 13:17, Vincent Prince a =C3=A9crit :
>> > Hi Team,
>> >
>> > v4.6.0 breaks some namespaces from v4.4.1, maybe we can keep both
>> > versions until people migrates?
>>
>> In fact, before the bump the version was v4.5.0, not v4.4.1.
>> But I think master should contains only the latest version.
>
>
> Right I think this change Looks ok for master unless 4.4 is long term
> release then we can discuss that fact
>
>>
>>
>> Thanks
>>
>> Regards
>> --
>> Pierre-Jean Texier
>> Embedded Linux Engineer
>> https://koncepto.io
>>
>

