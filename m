Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 912D3780DD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 15:51:12 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id l14so4676637ybl.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 08:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+e01XriMdWnf3XbzMWbHK5nX4N8lm6Jd2bHtS7ARhJM=;
	b=KK+s6WMzCs0f88dwxFfv3/eLdLkkyL/pYWURGCGY5CPULp6GGqO9/gNXy+zrVhrH19
	2Ew4bexdmqTfPCrObPgivej3ZSqvThs8yxidyPc93hUSz7DC4maGjrUDvZHH9RPRrdzj
	cVAjlSLvULPK2nn5aJQ+f+Ybc7ytvuAUiREWPmwdqSYyOhcqTSCxNvQrKNeJ1WF1BLW9
	9rnynyVAvUML7ejnMKyhBaq6uRcFKMUELyA/lnk8S58mn9oPIRYIL2+nZ+nLkq2aOirc
	thLrtYYwM6uN8alWSLr23ZJ+rsWMMTACmVFFut1pZkfUGSynl3LkAiiD+FlJMTXgom4e
	SBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+e01XriMdWnf3XbzMWbHK5nX4N8lm6Jd2bHtS7ARhJM=;
	b=Lu/gsxvZPE6bEKi6DMVavHNqZfDw47C/3f8ZKqZsY3le+ruUwaD7DqWGY/a6ACORMT
	bAHvuiO0nXwFG7roITGVZGRT2O29CF5G+bgcFHBXuSmuEAwkPNlCYXWH1egmkgSGpAUB
	KYMg6xlItW8zYyDDn3Lito+cB0JTEhdxRo9G7d9sMVF96O5y05yF1bkb0IEPZuDA1RGc
	G+QwkdxFslbn0Yy2YxhAZ/45TU5ymMD2ITqmRgXZXorNKifJLnnZGJ1x2e6lPPyOtekv
	RCn9wkG7OTLq17Gvkht/g9Z1i+QyLDE0rTKDuB8JPjVzHL/oegWK1f6WsIi1ae91orrV
	Oflg==
X-Gm-Message-State: AODbwcCn0vmtpmzq+tRKJUJbouL5zpAiYUSi9A+6+NSmRL8N23ITNcEE
	xmUXvmCGw2EaOhUQgH1LnXHQlSCIpQ==
X-Received: by 10.37.4.132 with SMTP id 126mr28439192ybe.133.1495641073472;
	Wed, 24 May 2017 08:51:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Wed, 24 May 2017 08:51:13 -0700 (PDT)
In-Reply-To: <CA+chaQc+Lzfkx0=0r_2cwLcRT3CuFhAqgq46Kdn7wh0_moE6BA@mail.gmail.com>
References: <20170524153407.22969-1-dl9pf@gmx.de>
	<CAMKF1spe_4B86YGpY-SmNw6K-deJqnT5j1mDDSn7bqtiB1SpLg@mail.gmail.com>
	<CA+chaQc+Lzfkx0=0r_2cwLcRT3CuFhAqgq46Kdn7wh0_moE6BA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 May 2017 17:51:13 +0200
Message-ID: <CA+chaQcTOv_sa3_j7_4xH-k01mkhN+QLhrSoCasBfoSnJdABSA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Tom King <ka6sox@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-oe][master, morty] sg3-utils upstream SRC_URI unavailable
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
X-List-Received-Date: Wed, 24 May 2017 15:51:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Tom

the archives are correctly rsynced to milla:

jenkins@milla:~$ ls htdocs/oe-sources/sg3*
htdocs/oe-sources/sg3-utils_1.24.orig.tar.gz
htdocs/oe-sources/sg3-utils_1.24.orig.tar.gz.md5
htdocs/oe-sources/sg3_utils-1.31.tgz
htdocs/oe-sources/sg3_utils-1.38.tgz
htdocs/oe-sources/sg3_utils-1.40.tgz
htdocs/oe-sources/sg3_utils-1.41.tgz
htdocs/oe-sources/sg3_utils-1.42.tgz


but they don't appear on http://sources.openembedded.org/ can you check
what went wrong? The DNS might point to different host or something like
that, because there are no archives from 2016 or 2017 (newest I've seen are
from April 2015) and I think it was working a bit longer than that.

On Wed, May 24, 2017 at 5:45 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Why do you introduce the bbappend instead of fixing it in
> ./meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb ?
>
> It should be on sources.openembedded.org (everything built in my bitbake
> world should be rsynced there, will check where it got broken this time).
>
> On Wed, May 24, 2017 at 5:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Wed, May 24, 2017 at 8:34 AM,  <dl9pf@gmx.de> wrote:
>> > From: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
>> >
>> > This patch temporarily fixes the unavailable upstream URL for sg3-util=
s
>> > with an bbappend that redirects the SRC_URI to a mirror.
>> > Checksums match.
>> >
>> > Signed-off-by: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
>> > ---
>> >  meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >  create mode 100644 meta-oe/recipes-support/sg3-ut
>> ils/sg3-utils_1.42.bbappend
>> >
>> > diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
>> b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
>> > new file mode 100644
>> > index 000000000..aeef696cf
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
>> > @@ -0,0 +1,2 @@
>> > +# Upstream URL currently unavailable. Use mirror:
>> > +SRC_URI =3D "https://fossies.org/linux/misc/sg3_utils-${PV}.tgz"
>>
>> Can we also host it on sources.openembedded.org please ?
>>
>> > --
>> > 2.12.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

