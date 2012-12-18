Received: from mail-la0-f46.google.com ([209.85.215.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1Tl0Sh-0007cc-5C
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 17:56:33 +0100
Received: by mail-la0-f46.google.com with SMTP id p5so739899lag.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 08:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:reply-to:organization:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ja9ZIalRv3btK/mfHUwIZHwEKXAzAPcJffCbGGIuxKo=;
	b=fW4JHzKnISGjyZGVU4LZlZ5SBtUClpPZqnshH6eqNpitJzF79U2VG3Bn3ZHueV/0e0
	1i0MK+CHtaDKjrnv4E3iRf4wZMwoWCXFPs2/Mmdo5vCyJDapRtFUjngVLe//CYI8b9cW
	jU9+UrQAEiv3uxhAMsIwRyABc9wPNGts7mm8y+BkkXYqf2QZKCbZB0Rr6P2nRmAkBxmh
	GSH8R9z2mTchV8oQDlq5TG6Q03TmHbhz8IjBBuNGkIPgTjh/bZl2RIIWlxHzvT0eJY+D
	E7r4lpKcZg1SO2MiSf8OjsLWkNL18ElVVWXY9mlaYHDDoM8FleyPAonWHJPxW03a0Wye
	bK2Q==
X-Received: by 10.112.99.195 with SMTP id es3mr1091527lbb.132.1355848889166;
	Tue, 18 Dec 2012 08:41:29 -0800 (PST)
Received: from [192.168.0.5]
	(host56-7-static.30-87-b.business.telecomitalia.it. [87.30.7.56])
	by mx.google.com with ESMTPS id t3sm1070679lbl.17.2012.12.18.08.41.26
	(version=SSLv3 cipher=OTHER); Tue, 18 Dec 2012 08:41:28 -0800 (PST)
Message-ID: <50D09CB2.1000607@gmail.com>
Date: Tue, 18 Dec 2012 17:41:22 +0100
From: Marco <koansoftware@gmail.com>
Organization: MC
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50D0978D.9090805@gmail.com>
	<1355848700.24487.126.camel@phil-desktop>
In-Reply-To: <1355848700.24487.126.camel@phil-desktop>
Subject: Re: oe-core 2.6 kernel support
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
X-List-Received-Date: Tue, 18 Dec 2012 16:56:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Il 18/12/2012 17:38, Phil Blundell ha scritto:
> On Tue, 2012-12-18 at 17:19 +0100, Marco wrote:
>> Paul had kindly pointed me to the meta-handheld stuff so I tried oe-core
>> + meta-handheld and I built:
>>    akita -> ok (3.2.32-git)
>>    hx4700 -> ok (3.0.1)
>>    h3600 -> fails (2.6.29)
>
> In what way does it fail?
>


Hi Phil,

http://pastebin.com/zYWnj23h

-- 
Marco


