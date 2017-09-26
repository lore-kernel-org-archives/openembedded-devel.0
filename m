Return-Path: <ka6sox@gmail.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8543F600B3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 00:38:45 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id y138so1174554itc.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 17:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=xmUyiBuD1EycNB9E9YhZrxfvstkWAt3M5J4/ogOc8lk=;
	b=X9zmoGPBGWqdF0ua7kpbNW517qwNTFQcG/nOb4q9YwXxdAdcpNuAxW7UnYNJcrYZz1
	v/WrGXRKCN9NYpKrdpE631OsRWO/pJM3IQN2hRmfkXdj99sZLeSI9eMvYQ4p2uwScZiB
	U4aEgzDWTeLGJQ419Uqvoxy0pdvfgKuPgcWlKx551/wyvNPCd/2hNrKuM5L2hm1PEwE4
	AfBJmRWkAI9yQi2zH132UH4JK6QkypuNacePhValk+BCnAHaousb9IOyS+Po275GxTNG
	x2tPrWzaNNokAg8X4ZVmr+N+OY2u+37ONgaIOiuQwVixoS7lfr1rw8dVe28LV9fnI1Q/
	9uUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=xmUyiBuD1EycNB9E9YhZrxfvstkWAt3M5J4/ogOc8lk=;
	b=Sh3hiKV8sjfxFY70+5o/G0mzqdgRKqZEdgQ1HE7sfL9nVcETUc9qvTvOL5D3V8yMjS
	IYRhR71NnXeYC0aFDeLRkfWwcsGLPY1pmcHYdrT8D+aj+/6RQSGwrn3+AADJKBgy2dr5
	1GfuLAkSEZIpNifAIq0prVQcVKXiABGByJSfoRd0wVpdLiZqAV72+aInfow95W84E8Ri
	A3RR7jUhjtEHQ848uIFGQJNL8FP6UdzhkC0/ua93Jm7nRtGBG6EP+eTsXYiMSWvR8LqZ
	vMdoKtG3J7mwo72LwmMtcON6yvxQqO/9TafuA75Ss23qZkx1qoTh3By537SPtg5AP1YC
	AzQA==
X-Gm-Message-State: AHPjjUgT0981pNd8otozqoF7WLJKyH7zMnm4Nk4u6G7UkTir8zoOrVoA
	j51XMxz2wh5NAINIToHsl8a5aOYMm0b3IEccTF0=
X-Google-Smtp-Source: AOwi7QA1BZ1kjW/UNyry5C30frhOxcwhvegG5na5zKTPT8c3VqEUUz9aAl5zTM9LSRWTDnikKwBRUl5laeFVo5qpFTY=
X-Received: by 10.36.195.129 with SMTP id s123mr3373132itg.102.1506386326136; 
	Mon, 25 Sep 2017 17:38:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.237.65 with HTTP; Mon, 25 Sep 2017 17:38:45 -0700 (PDT)
In-Reply-To: <b38b99b3-9090-a99c-06c1-396ce3baab26@linuxfoundation.org>
References: <b38b99b3-9090-a99c-06c1-396ce3baab26@linuxfoundation.org>
From: Tom King <ka6sox@gmail.com>
Date: Mon, 25 Sep 2017 17:38:45 -0700
Message-ID: <CAHQecY5WmsyfQTpEj_ipqMVsak3LcJtr=JonpsikKW8N94eCxw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [yocto] [infra] git domain name updates
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
X-List-Received-Date: Tue, 26 Sep 2017 00:38:45 -0000
Content-Type: text/plain; charset="UTF-8"

I would like to do this with the OE Git as well as I see several large
spikes everyday where the server gets very busy and this would help:

git.openembedded.org for read-only access

new push.openembedded.org and ra.openembedded.org for those with Write
Access.

Tom King
Infrastructure OE Project.


---------- Forwarded message ----------
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Mon, Sep 25, 2017 at 5:17 PM
Subject: [yocto] [infra] git domain name updates
To: yocto-infrastructure@yoctoproject.org, yocto@yoctoproject.org


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

As Yocto Project continues to grow load on our git server does as
well. We are going to make a few changes to our git infrastructure to
allow for more growth.

All read-only git operations should point at git.yoctoproject.org. For
example poky can be cloned from the following URLs:

git://git.yoctoproject.org/poky
https://git.yoctoproject.org/git/poky

If you have repositories pointed at www.yoctoproject.org,
git.pokylinux.org, or any other domain name please update their remotes
to git.yoctoproject.org.

Read-write operations via ssh will use a new domain specifically for
that purpose. I've added push.yoctoproject.org and ra.yoctoproject.org
(like ra.kernel.org).

Read-write URLs should be updated to the new domain names. I've
changed mine like so:


git remote set-url origin ssh://git@push.yoctoproject.org/poky-contrib


This is all ready to go right now. Please update your remotes.

We will have to make these changes required before we can start to get
performance benefits from them. I suggest November 1st 2017 but I need
more feedback before we can set a cut off date.

Thank you,

- --
Michael Halstead
Yocto Project / SysAdmin
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEzowQ2UYmQerfiW8/amSWNbpCWpUFAlnJnKsACgkQamSWNbpC
WpVwphAAkRfTKy64rClsiB2lijbi2Z7o/NJIEbkDgbYf92aeAAJw4KQHLMxbrOS+
lZi6MtUSEGtFGdcxqOZ3RCNagfjA9peiDpcxf0A/Jnax02yQz5njHQco12n7IuYl
Q92CW2wMWfqVHJ+0NZe2THb72OUd6cepjHOeNBUb4L3TFOK6NAc63zaFD24vXqq0
VAx+x3s8DPIyzttS7s3lA1IXlLS1S3jGdhLM/0G0E48QJM3Y/I3ntUJ3G02mVMYc
wJ1a8E1/YTTgcL0Xwioa+EoGXeuAPmbrirlp+e9QXwBzYw/2EjNTt3stEpGCK+xK
Pf7+TNGgky/OMzX9pr51jHl1XwgtZJzmumyyIDA3UewVxxvkkOwsFjICN0keWM3W
GGlkOn+Sn+V7Nnw5MVchX9cexojgebgbaDuyFmlpr+nXin9YKO7ELPnOaENTQouk
lq72nvlfllHDGa0yx6ZbhP/UV5E03Q0g+aDLvoYvY+HWFZGyMFP5cyumEI4H2puQ
mqTjg9aWE3NExA5/gseihxjW/UvGhApfkV5OWXcxv03FmCfLIGNBKdFYJYTtC4gm
WUGZbV8yyw13/F0gwPe/538BEsL+4oJxhk4AqNtGYjbb3m0XpjIxVP/Gbf7WASJi
2r3NDP8SE0ehQE79gqxQIX07+s1smCPJ3EkHvvKY/Bk8QCa2iBg=
=TfzM
-----END PGP SIGNATURE-----
--
_______________________________________________
yocto mailing list
yocto@yoctoproject.org
https://lists.yoctoproject.org/listinfo/yocto

