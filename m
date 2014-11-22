Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id A33E1718EC
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Nov 2014 18:47:55 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id kx10so6997635pab.16
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Nov 2014 10:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=UPFnxkCZSdCxSRv9CjrELoEfkVbMBi5+ohmBX/sTZwM=;
	b=td3GAP3AFtIIE1WIbtVzdfr0nL3CQFioJduflRYEGz8jieSe4JIW8LKVC73SIyYDi3
	14+wxb7RReE5NM0FpjoCG4sB9MUIsUtIRlhnpUf9b1KzHR9wh2qlG+odt3lojnVNl2qB
	lWpiWqrYga2nNDbF9m6rznGLw1ZmIBCJ6mWdAtNLlwET/L3s9I+BV1mJr1zx/+metttz
	VRDyIJJn+In6mjJtCs4CBwp2ET6WNQKpN3xidtSpYJ7HVLXVd6rEChuqE+5feZVDm2PP
	AgMnfk4G5jemplFAKcEP4vUDg4QDBVeSBWkfbTDrFbXZJyIxu7OVDG8Welzymry9joDS
	8ZeQ==
X-Received: by 10.70.61.136 with SMTP id p8mr18556907pdr.98.1416682076416;
	Sat, 22 Nov 2014 10:47:56 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:2124:41b2:89f4:734c?
	([2601:c:9380:601:2124:41b2:89f4:734c])
	by mx.google.com with ESMTPSA id bf2sm8061655pbb.13.2014.11.22.10.47.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Nov 2014 10:47:55 -0800 (PST)
Message-ID: <5470DA58.3000301@gmail.com>
Date: Sat, 22 Nov 2014 10:47:52 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Joe MacDonald <joe_macdonald@mentor.com>
References: <EC21369A6993DD47985E1CBF1038266E21FDE8BD@NA-MBX-04.mgc.mentorg.com>
In-Reply-To: <EC21369A6993DD47985E1CBF1038266E21FDE8BD@NA-MBX-04.mgc.mentorg.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: ufw - Uncomplicated Firewall
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
X-List-Received-Date: Sat, 22 Nov 2014 18:47:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Joe,


On 11/22/2014 10:16 AM, MacDonald, Joe wrote:
>
> On 22 Nov 2014 01:29, akuster808 <akuster808@gmail.com> wrote:
>>
>> Is anyone working on ufw? if not, I will post something soon.
>
> Funny you should ask. I was putting together a recipe for this earlier this week before I got interrupted. I was debating about how best to deal with the rather heavy host-centric assumptions it makes and thought I'd try to get a change set the upstream folks could live with.

you are further along then me.

Have you got something ready?

nope. I got few higher priority task to finish.

If not, I'll see how quickly I can finish up mine.

sounds good.

- Armin

>
> -J.
>
>>
>> - Armin
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

