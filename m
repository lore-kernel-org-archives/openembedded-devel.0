Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SIdiK-0005id-Eq
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 12:26:48 +0200
Received: by iaag37 with SMTP id g37so4147287iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2012 03:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=/BfLoty0DvMjzLjnRiNm35for85Ou+lbB2qQza+51sg=;
	b=0heKsSvllQIUC+v9vpVHR9bwtZ7uyNRbFHjXoSKFBpOU/IMe4/YQJzvnTVjefi8C1y
	N9U9ne/IHKow53HcrKnFi9IRcw7Av4rOjxKtmM8z0tYRcLI9j7TNd4zRHBOJtBqTRKLU
	cOAfrEUgTjGYi9wH9K5GrzIg+B+rjOH7wvpHpx/ehjfELU663uAWAFWZaKTGAcNCHLvS
	zozZ4R9KIXRmvl+PJJXAAcewTkGm/bXNLfoebafZICA7/AZ8/fhFboPJznuPAfV1De1j
	kkpM7YiYiVMUBxaltUd+MxAsefO0rKAgUCYHkZDQ1Wp6xIq3mgxVwZltoPxV4GJGiJNi
	netw==
MIME-Version: 1.0
Received: by 10.50.222.162 with SMTP id qn2mr819244igc.65.1334312246757; Fri,
	13 Apr 2012 03:17:26 -0700 (PDT)
Received: by 10.231.170.15 with HTTP; Fri, 13 Apr 2012 03:17:26 -0700 (PDT)
In-Reply-To: <CAOHjBZudis3ALttGQZ12hxKPQbXKyffZVtoB1buz4AMaamXO=A@mail.gmail.com>
References: <CAOHjBZudis3ALttGQZ12hxKPQbXKyffZVtoB1buz4AMaamXO=A@mail.gmail.com>
Date: Fri, 13 Apr 2012 12:17:26 +0200
Message-ID: <CAOHjBZv0QseOLWD564eCTLXhMy4YuJUUuhooaWvh=C5-QNo2dA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-core] how to add .bb file into project meta directory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Apr 2012 10:26:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Solved, it's the same as .bbappend file.

2012/4/13 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>

> Hi All,
>
> I need to add a new version for a given package and I'm wondering if (and
> how) I can add the relative recipe in the meta-<my_project> directory as
> well
> as I do for .bbappend files.
>
> Best Regards,
> Giuseppe
>

