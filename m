Return-Path: <bill.randle@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3D31C787C1;
	Sun, 24 Dec 2017 16:03:19 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id a42so6364975otj.5;
	Sun, 24 Dec 2017 08:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/bEvEyFBqSy0PE30bkuDDbtmvEUZON8ajVQxgBJaL+k=;
	b=tug04Ra39q6vaZIzdqN3Y4WNJDfdIaYcfFw4flgrCz6gWxb93GSkuF5sc7j2SW6CRz
	dOSouu8lZY5gMh6ZWPi+RtA/YId8FZv9REOUW7est9vt1ivLXsnfZfd3oAyLA5yAucTu
	x77IP8b2+f8Aw7/Bh/m4LDBraa/NN7CG5GAmLHahxk/u62yXzkZQkITemzOM4wZT6WMq
	yBX1RAblElmFZhy0T3LDe1bNkl4O2g6SKjn8g+cDrI37mo0X+C4cw3hU05RMJXnBUQDz
	hr2JjyuS8lmhiqGb0AOG975VnnfE7oyoJZPYfzszh9GmiitVH+wQxI9M+8cLbBbHbgYt
	NAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/bEvEyFBqSy0PE30bkuDDbtmvEUZON8ajVQxgBJaL+k=;
	b=exbBgV4+1dd6KM422EDI5MCW7JTqiBpi9soS2saGIimvx6Bbgj010Pfonbm6xCmFBD
	XdyDHCXVobX18OUeaPIHeUHk8wKUFZYr0K+S988LPgu9AkrWgWBWfMinOX0Zqr8S4Uh6
	YgJ032wNGh/FbPDKGDfaY2nhQggF2XQ/leymFkoktl1m6cfQrbNYXp6rs8hJ6+dB+geA
	fLBdfcFMcLOgQpKN6c4saGiIREQowX4OouHTlO4rrQ9p3vD5TDGK7e91UORdGJxNCrZg
	10daoOxWixYGYpA6yNRE1uy/dz4Q+v9TkRtIWa0WWEIGKwaRMnMo6LIgUFe0eMM0WuQo
	IRmQ==
X-Gm-Message-State: AKGB3mLpiI517YdfToDPqqJcTEPtIVJjwKjlbQjio3OT9Vog0paipuXV
	VdL9CRUxS3MFdZv5gFKcVNTFC/+RghPmKaY9e+U=
X-Google-Smtp-Source: ACJfBoshHk2Jl8wtRJXzDI9mbIMzGJNWX6XA5DDT6dTdnABeLA/o67ZkZ6PbrYPypsQyJM5PYGOT42lj+cyKrBPLBhI=
X-Received: by 10.157.46.105 with SMTP id c38mr14483017otd.213.1514131400626; 
	Sun, 24 Dec 2017 08:03:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.221.194 with HTTP; Sun, 24 Dec 2017 08:03:20 -0800 (PST)
In-Reply-To: <20171224073443.GA4127@jama>
References: <151400211887.5101.9516674106915358280@git.openembedded.org>
	<20171223040839.6971C2355DB@git.openembedded.org>
	<20171224073443.GA4127@jama>
From: Bill Randle <bill.randle@gmail.com>
Date: Sun, 24 Dec 2017 08:03:20 -0800
Message-ID: <CA+n--H-o6pUnaLH73wYjYXt6Qs6iTuYx7_SKRN0=CFf+E0f4bQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [meta-openembedded] 14/30: python[3]-flask-nav: new recipes
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
X-List-Received-Date: Sun, 24 Dec 2017 16:03:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 23, 2017 at 11:34 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Sat, Dec 23, 2017 at 04:08:52AM +0000, git@git.openembedded.org wrote:
>> This is an automated email from the git hooks/post-receive script.
>>
>> armin_kuster pushed a commit to branch master
>> in repository meta-openembedded.
>
> Hi,
>
> This depends on 2 python-blinker reviews which weren't merged with this
> batch, causing:
>
> ERROR: Nothing RPROVIDES 'python3-blinker' (but meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'python3-blinker' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-blinker']
> NOTE: Runtime target 'python3-flask-nav' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-flask-nav', 'python3-blinker']
> NOTE: Runtime target 'python3-flask-nav-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-flask-nav-dev', 'python3-blinker']
>
> Regards,

That would be this patch:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-December/115865.html
posted on the mailing list five days earlier than the patch for
flask-nav. I should have perhaps put a note in the patch series that
the previously submitted patch was also required as a prerequisite.
I'll to do that in the future.

    -Bill

>> commit 55d77b7e3f81dff333cbaa3361d02249943a8fec
>> Author: Bill Randle <bill.randle@gmail.com>
>> AuthorDate: Thu Dec 7 21:49:02 2017 -0800
>>
>>     python[3]-flask-nav: new recipes
>>
>>     Signed-off-by: Bill Randle <bill.randle@gmail.com>
>>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  meta-python/recipes-devtools/python/python-flask-nav.inc    | 13 +++++++++++++
>>  meta-python/recipes-devtools/python/python-flask-nav_0.6.bb |  2 ++
>>  .../recipes-devtools/python/python3-flask-nav_0.6.bb        |  2 ++
>>  3 files changed, 17 insertions(+)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-flask-nav.inc b/meta-python/recipes-devtools/python/python-flask-nav.inc
>> new file mode 100644
>> index 0000000..932ccdf
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-flask-nav.inc
>> @@ -0,0 +1,13 @@
>> +DESCRIPTION = "Easily create navigation for Flask applications."
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416"
>> +
>> +SRC_URI[md5sum] = "4d51cfd06d58f8d0fe85775a6696c0e5"
>> +SRC_URI[sha256sum] = "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf36b3aca2e110a33f4"
>> +
>> +PYPI_PACKAGE = "flask-nav"
>> +
>> +RDEPENDS_${PN} += "\
>> +    ${PYTHON_PN}-blinker \
>> +    ${PYTHON_PN}-flask \
>> +    "
>> diff --git a/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
>> new file mode 100644
>> index 0000000..30b5b3b
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
>> @@ -0,0 +1,2 @@
>> +inherit pypi setuptools
>> +require python-flask-nav.inc
>> diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
>> new file mode 100644
>> index 0000000..d251152
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
>> @@ -0,0 +1,2 @@
>> +inherit pypi setuptools3
>> +require python-flask-nav.inc
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

