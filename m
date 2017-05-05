Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id CE13B6E650
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 May 2017 22:52:24 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id s62so2369527pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 May 2017 15:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=7UyN2dK58xsjHArrUpBU6QDr+2fMAD8vJEQnEiZG6Ik=;
	b=Lfu72kcsGe5bnU47F4Mv1A58+L05Wa3WmY0aT/IVWQzpD6CFrowxY74TgrzrskK7d1
	4IjCaVE0id6zsylULWFedj9ZYZr6eLrhSpg8iFP7YH0xhLhRKU8dxTMRt1xuxWqbiJ0I
	mZrcBKalUvwcSytB1oewLo+kmUmfc67u7tPcKQU7L0Hab4/UaIsyvf3qSSKBT75wa6+7
	hiQDs2jAknnsuAizQMbI2gvBDmZGXnGDAZhwrIp9Fbnt1hqMbscOsBvYg2FoOzfHrbqN
	y/HyZpLrYbMCbp4gAo3mkjXi0fDrczDaoYCEkcsveYkE9canqerQQ+nVvMPlD8NQ49Si
	zq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=7UyN2dK58xsjHArrUpBU6QDr+2fMAD8vJEQnEiZG6Ik=;
	b=WOIcdWnMPXcUS7R2YgE2S2Aw0xkCXyQRXihUsmKBJC341Os8iAs/A4bAiT/qSCZJXo
	VedBLb0P7z3eujJeJSvycDZgdijCcOwY5zly+GDpuSIZYWSX3IGDmaDEbwdUQcY5u2hU
	MKeD2D+AyOx5MmRLgXuHiUwwBmyc0wT6eFvfi8s5KTXGeg2QomKAyejlbT1LwRmZ/sg+
	QvLbCuSZa2eaCuzERXQqUtwkyKbxngov/8mcIDvaLIpRA22sDabVZQvhgPFV0rCypXG0
	RUdgyI7OkF+oA2xqRTePzX//5bX9J35XbHTcafKTAmifvKAJhECYZHv8qoLefpre467j
	Bj1g==
X-Gm-Message-State: AN3rC/74ByfRcTC8QY6Tg0I5XlThvH7+B07yLJ/QupX0SpwaAGn2m1YJ
	Q/pdwksK9Bh0Ow==
X-Received: by 10.84.247.9 with SMTP id n9mr66752764pll.119.1494024745686;
	Fri, 05 May 2017 15:52:25 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4001:9ea0:61fe:e344:e113:5ec9])
	by smtp.googlemail.com with ESMTPSA id
	x185sm11497135pfx.102.2017.05.05.15.52.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 May 2017 15:52:24 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170426184422.GG3258@jama>
	<a05fd59e-cbf1-291c-c2fa-63d3ba5b1d6e@gmail.com>
	<CA+chaQfO+UJ9rm5u20hi9+68qafdnwhJ9Q0WXMnZC7XfLUbNMA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <e827e9a5-cbee-5eea-33a5-0e32ef3ac111@gmail.com>
Date: Fri, 5 May 2017 15:52:24 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfO+UJ9rm5u20hi9+68qafdnwhJ9Q0WXMnZC7XfLUbNMA@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 May 2017 22:52:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 5/4/17 7:02 AM, Martin Jansa wrote:
> As always, thanks armin!
You are welcome.

I believe we all owe you a big thanks for level of care taking you have
been providing on the entire meta-openembedded mega layer.

"Thanks Martin"

>
> If there are more people willing to step-up and maintain some layers
> or whole meta-oe for master branch, then I would be happy to share it.
meta-oe as in the mega layer meta-openembedded or sub-layer
meta-openembedded/meta-oe ?

- Armin
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
>     > as every 6 months I'm looking for some volunteer(s) to step-up and
>     > maintain "pyro" release branch.
>     put me down. I will be sending patches shortly.
>     -armin
>     >
>     > You can sign-up by replying to this thread and then one of you
>     need to
>     > send README update like this:
>     >
>     https://github.com/openembedded/meta-openembedded/commit/3082e30da58df0711182cf114c71a8c6a093aeae
>     <https://github.com/openembedded/meta-openembedded/commit/3082e30da58df0711182cf114c71a8c6a093aeae>
>     >
>     > More details in thread searching for daisy maintainer:
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/095601.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/095601.html>
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/095694.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/095694.html>
>     > or dizzy maintainer:
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098441.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098441.html>
>     > or fido maintainer:
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2015-March/100901.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2015-March/100901.html>
>     > or jethro maintainer:
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2015-October/103810.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2015-October/103810.html>
>     > or krogoth maintainer:
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2016-April/106952.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2016-April/106952.html>
>     > or morty maintainer:
>     >
>     http://lists.openembedded.org/pipermail/openembedded-devel/2016-October/109452.html
>     <http://lists.openembedded.org/pipermail/openembedded-devel/2016-October/109452.html>
>     >
>     > Regards,
>     >
>     >
>
>


