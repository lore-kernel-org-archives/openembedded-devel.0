Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 44C7773EC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 21:43:57 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so21403420pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 14:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=FP4Zj67kz07UQL0DzTADjwqkGmijHBVxq8vUwUAE7Oc=;
	b=EGVpu6Jgljj9bNskgPVmjDoSnnX39NrI6H0bEMGVvhdqhYLqyRsZjpqAE4lKM9yhqo
	5YVE24rRBwpjKSeJXV9Zj+eap9HYExeSb0OXKAeDrqqRIm172mz9Y8NE3xYor1gWa8DZ
	YAB80nHpOkIW1vOfC+pBRnbfXviEliM2bi6QVlMWMiWTlrXxAsJrwfZtv1fJyMe3epCm
	ddcDB9KuK3b18WLQrWHfNjaaQ+ho5c3x+dzLziESVQzOq1yJ4EDI9eoTNWr6vmDTPRvv
	R0/TjFh3Oj2XjxQp7lwLjJBusZtxvSDuFWjJh7k+l8LEFyGekoRoiMLpKlp5IPpYLIp2
	RjFw==
X-Received: by 10.68.94.225 with SMTP id df1mr1223470pbb.89.1430948639153;
	Wed, 06 May 2015 14:43:59 -0700 (PDT)
Received: from [10.22.11.251] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id da3sm34516pdb.8.2015.05.06.14.43.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 14:43:58 -0700 (PDT)
Message-ID: <554A8B1B.3060503@gmail.com>
Date: Wed, 06 May 2015 14:43:55 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
References: <55483F50.5020803@gmail.com>
	<554A76F1.8050407@gmail.com>	<554A7893.3060701@gmail.com>
	<554A8A7A.6030404@gmail.com>
In-Reply-To: <554A8A7A.6030404@gmail.com>
Subject: Re: Odroid-xu3 support
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
X-List-Received-Date: Wed, 06 May 2015 21:43:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit




On 05/06/2015 02:41 PM, Trevor Woerner wrote:
> On 05/06/15 16:24, akuster808 wrote:
>> On 05/06/2015 01:17 PM, Trevor Woerner wrote:
>>> It'd be nice if someone could put together one "meta-odroid" that would
>>> support them all ;-)
>>
>> Yep. looking into that.
>
> That's great to hear :-D Which device(s) do you have, just the -xu3?

I just got -W so just the two. nothing else.

- armin

My
> -c1 arrived yesterday so I can help with testing that device if you
> don't have one.
>

