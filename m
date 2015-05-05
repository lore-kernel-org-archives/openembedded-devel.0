Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7FA8471144
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 15:25:47 +0000 (UTC)
Received: by pabsx10 with SMTP id sx10so196590183pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 08:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=otp88G1Ev7VpNH3Yf2aBQLSX59+VLjOzyZoN2JWMqV8=;
	b=mN2HJBFRC++zcgDGNU+BaB2Wn+mgRsSsmnMXQMSSkj7359YuBEeuO2WqqTbYPK11E0
	9xEGV4uvIyrJyom64JN7i7r1KFejONjhAOBtRyePNDjI/3bfYhtKQuR/hcOfNbYare1f
	jVIs31x6U8NqU4a4s0ELMeLQ1g9v9SyoERemkGdOe9udxAzPxwQWLqpu/lnJjU4KEcFZ
	mLCJxYcxIexZJoAYXSJw/4a9j6YtUhhb21d0MLmEcLKK+28mE3gf2IxVwIoSGGQS9opt
	nOKxt69UlajuqWStktQ/MYWYhN4ZcbWcmaT8i3+dqC+GJQNRVDeAhELW0/gKlao+tUFR
	usRA==
X-Received: by 10.70.134.133 with SMTP id pk5mr52673687pdb.133.1430839529871; 
	Tue, 05 May 2015 08:25:29 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:84a:4937:3a73:d745?
	([2601:c:a700:3ba7:84a:4937:3a73:d745])
	by mx.google.com with ESMTPSA id
	ca2sm16307613pdb.25.2015.05.05.08.25.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 May 2015 08:25:28 -0700 (PDT)
Message-ID: <5548E0E3.1020704@gmail.com>
Date: Tue, 05 May 2015 08:25:23 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>, 
	openembedded-devel@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>
References: <1430483441-4566-1-git-send-email-Martin.Jansa@gmail.com>
	<5548B3A9.40301@dresearch-fe.de>
In-Reply-To: <5548B3A9.40301@dresearch-fe.de>
Subject: Re: [meta-ruby][PATCH] ruby: explicitly disable dtrace support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 May 2015 15:25:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

on my list.

thanks

On 05/05/2015 05:12 AM, Steffen Sledz wrote:
> On 01.05.2015 14:30, Martin Jansa wrote:
>> both 2.2.1 and 2.2.2 are failing on some hosts native builds with:
>> ...
>
> It would be really great if this patch could make it to the fido branch!
>
> We are some of the mourners and cannot build fido at the moment. :(
>

