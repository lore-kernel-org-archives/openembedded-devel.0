Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.17282.1593593325463523935
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 01:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=NQRwFjjh;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=znrm=am=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49xZdP11xKz5t;
	Wed,  1 Jul 2020 10:48:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1593593322;
	bh=UfWFF7uC7eQ/YYImJwjip4rZF9S3hWl/n9abijcqikc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NQRwFjjheD9KLQ8gHN36/ZDiY9Q1aN8WHPgD0oBFIjVP8rMr/HW25VW9ZoqVOWQZu
	 wuNe5C95yczEJqJ2zz+n9bCEC7PLyoJVLQyUE0nH5CwvImb+ViSyTPAQYnvFmemRBi
	 cqA7SD1LoUOPWfmfSR0QmsoUyy36b5IEM09S148h7BKHVRBkhjbeWd8XG87yTJ4OZh
	 wJw52aTNjiVqnvtTP7E3xEwY1welaAvpKeOhXvfjesfLfwh4Q9i6SKe42vclzInB0E
	 40TL5ZfncbfbW+MhtLshNBumhr3JQtv3raQA953a/ylXYcmOLZYYEfmPcRy5AJLIYs
	 tsM7BysEi+4tFZKEP02O6oO4Y71IYhVBV9PkiKghdYDqf1b8+WvaGDvSf9QFMs9IzV
	 T2698eh0UQaSOEubqsx7P9IomyanrEayT3z//1ZIgpwL73Wx6wKsVCYenlGK9Syx2W
	 jtBEb1BJHfMd/zbpccO+dM9wASy+dcdi2SqIT3He8m2TFMiR1CKFNZoTJtSESp3rvF
	 TP3RbQFugNxTrPsy4t5DujpV8SWC8rBfNhRzcQAwLpzZ4cHJcVbx13P4mR6BEoPIB0
	 Vy5jg8LTWfxlwkZphcpaVuNKGUZMshxwRsrd/b8IdvOMlJiN/0vEgAka0Y2dCaodhT
	 GSLDjFM9n++9+MfzA6uEbkxo=
Date: Wed, 1 Jul 2020 11:48:39 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: akuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [dunfel 08/32] multipath-tools: Fix build with json-c 0.14 and newer
Message-ID: <20200701084839.GC10930@localhost>
References: <cover.1593561840.git.akuster808@gmail.com>
 <d345970f40c6f9caae869f048c358f598d37e109.1593561840.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d345970f40c6f9caae869f048c358f598d37e109.1593561840.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

dunfell has json-c 0.13.1

cu
Adrian
