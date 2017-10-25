Return-Path: <akuster808@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD026E688
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 05:46:54 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t139so476094wmt.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Oct 2017 22:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=wdJoafuBS6Sd5FCdezyB+jITSi9jrcya9PtoRueiE28=;
	b=PQ3FCrqLE/xC2PXYA6SaDKqDTQCtFCzoZJMwiyYl4Slx1/4QN7EiKau1lqLBFOtDdu
	XNpNULR91I9UHV6ct9G7zNxTB7OZkrQ8guNgdc3eA6vOIiOEKTbvUtNs8SlMgcgmMe0x
	twCKsp1KJy6SH1znIbJ6SNn03LmxD5lRZXtOh3nptUMTwsrz5pc30YhWD5wgXv5yJzqI
	RZAlt/XrS3W3XxP8RqH6xWYq96c/Cfu2W7XcP0n45X0injXLK6FPJX6W7JtackuBsRWh
	DmKCNKL9sBE7W6af440Tb+dv4Rq+Zr5ERIjeGMbMTFv6y+mriQswwUMYuguAryBDhC6O
	9ikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=wdJoafuBS6Sd5FCdezyB+jITSi9jrcya9PtoRueiE28=;
	b=UQ7nTjZmrnoR8J8Pmg/QxGXeqrl6R3fCwquVfX8EaQyF5Exbh1QtLrU6KROgJofFwJ
	D8x576G/2hHPf1CrhtKg+P6NXyTrysslf2IynynYMSguQr2tO07fy/8Q/44xIChFWRRq
	LqytgwuhePDjdTWZ6/t3xManNqkrJOmj9whx7uV3i5n4oxEY9JkpNiNTSIlssl2Uy2cQ
	VYnBOi4psbX3Qt/KfzMr0sSkR1tDwsOT+nSozaMCq2uQqdt3QEx+f8bviIpNSvbbQb/E
	54FkW2aYqQLnBvDL29v0iySMw6ia2QQ4kxErQamAI+CwbaS+bGerwD7m6nEiuuSUnC7c
	EokA==
X-Gm-Message-State: AMCzsaVfgLGltzkILKOwdvTdQcje5Csn8eVwOV3j7bzm3/g5Nwk5z149
	Zz96QQsl5eE4/qOZFHlMn0jTFQ==
X-Google-Smtp-Source: ABhQp+Q0kVK0Ohk8axXvPVBlahMIpKBLANfkXKno708q4TJ+Pc3ZpyV6aQ82tqGTr+gLxIxxwgTckg==
X-Received: by 10.80.220.202 with SMTP id v10mr22555060edk.226.1508910415875; 
	Tue, 24 Oct 2017 22:46:55 -0700 (PDT)
Received: from [10.253.10.43] ([62.168.35.105])
	by smtp.gmail.com with ESMTPSA id
	o60sm1140026eda.48.2017.10.24.22.46.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Oct 2017 22:46:55 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170426184422.GG3258@jama>
	<a05fd59e-cbf1-291c-c2fa-63d3ba5b1d6e@gmail.com>
	<CA+chaQfO+UJ9rm5u20hi9+68qafdnwhJ9Q0WXMnZC7XfLUbNMA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <82e2e61c-68ae-1c53-ae70-9b509ee0dfaf@gmail.com>
Date: Tue, 24 Oct 2017 22:46:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfO+UJ9rm5u20hi9+68qafdnwhJ9Q0WXMnZC7XfLUbNMA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: pyro branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Wed, 25 Oct 2017 05:46:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 05/04/2017 07:02 AM, Martin Jansa wrote:
> As always, thanks armin!
>
> If there are more people willing to step-up and maintain some layers
> or whole meta-oe for master branch, then I would be happy to share it.

After some careful thought, I have decided to help maintain meta-oe and
beyond.

regards,
Armin
>
> Any kind of help counts: reviewing changes on ML, sending consolidated
> pull-requests for layers or recipes you care about or just generally
> helping to fix the issues detected and reported in world builds.
>
> Cheers,
>
> On Wed, Apr 26, 2017 at 10:24 PM, akuster808 <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     On 4/26/17 11:44 AM, Martin Jansa wrote:
>     > Hello,
>     >
>     > as every 6 months I'm looking for some volunteer(s) to step-up an=
d
>     > maintain "pyro" release branch.
>     put me down. I will be sending patches shortly.
>     -armin
>     >
>     > You can sign-up by replying to this thread and then one of you
>     need to
>     > send README update like this:
>     >
>     https://github.com/openembedded/meta-openembedded/commit/3082e30da5=
8df0711182cf114c71a8c6a093aeae
>     <https://github.com/openembedded/meta-openembedded/commit/3082e30da=
58df0711182cf114c71a8c6a093aeae>
>     >
>     > More details in thread searching for daisy maintainer:
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2014-Apr=
il/095601.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2014-Ap=
ril/095601.html>
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2014-May=
/095694.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2014-Ma=
y/095694.html>
>     > or dizzy maintainer:
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2014-Oct=
ober/098441.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2014-Oc=
tober/098441.html>
>     > or fido maintainer:
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2015-Mar=
ch/100901.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2015-Ma=
rch/100901.html>
>     > or jethro maintainer:
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2015-Oct=
ober/103810.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2015-Oc=
tober/103810.html>
>     > or krogoth maintainer:
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2016-Apr=
il/106952.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2016-Ap=
ril/106952.html>
>     > or morty maintainer:
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2016-Oct=
ober/109452.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2016-Oc=
tober/109452.html>
>     >
>     > Regards,
>     >
>     >
>
>


