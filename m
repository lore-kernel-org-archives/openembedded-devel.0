Received: from mail-qa0-f41.google.com ([209.85.216.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SIkWi-0006w4-U0
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 19:43:17 +0200
Received: by qafl39 with SMTP id l39so6153175qaf.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2012 10:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=zeCVzjvbvl0VM3cPfuH4Lyyw9k/fEP8JGuakSbeU7Uc=;
	b=PG80xhf515l+gpMOC+mno4o9iTRJ0rrEeMmq1aMhj9+wYt1T/afa9w7GJ2XIBWuPxX
	2PuWVjA66zPAZ3vw4IpgsbT2rkO6XR2DP3f5/SkWEQ3wMkWucEgKJ9zLCCT2Krul0LOB
	oQEaob6mJuMbtEBnVfoZ1CHxZGbl/QFextSZ+eFx0uYIEj9HwkMqVZi8PLnl0yVA4YDn
	Uf5oMLAY++8gGmekkkRTdlBflcUzTms2FOM9jgvmyzRE7G/QVdgvvGfWHT92/rqCgtJh
	ucY8nNGhQwIt1AhdEnfWgZ2tjPFaZIUy4m2xENrW2kU6W6W8wNN1whg94KZiR3w63pRD
	UOLQ==
Received: by 10.224.207.131 with SMTP id fy3mr3776585qab.74.1334338435116;
	Fri, 13 Apr 2012 10:33:55 -0700 (PDT)
Received: from [192.168.1.3] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id de7sm18578083qab.16.2012.04.13.10.33.49
	(version=SSLv3 cipher=OTHER); Fri, 13 Apr 2012 10:33:54 -0700 (PDT)
Message-ID: <4F886373.1020700@gmail.com>
Date: Fri, 13 Apr 2012 10:33:39 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F8860F4.8050002@gmail.com>
In-Reply-To: <4F8860F4.8050002@gmail.com>
Subject: Re: libxcursor-1.1.12.bbappend
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
X-List-Received-Date: Fri, 13 Apr 2012 17:43:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/13/2012 10:23 AM, j wrote:
> I just updated hoping it would help with another build issue I am 
> having and after the update I can no longer build anything I always 
> get the error.
> ERROR: No recipes available for:
>   
> /home/beagle/OE/setup-scripts/sources/meta-openembedded/meta-oe/recipes-graphics/xorg-lib/libxcursor_1.1.12.bbappend
> ERROR: Command execution failed: Exited with 1
>
> Anyone know how to fix this? The append is there but the recipe it is 
> appending is not. Either that or I can not find it. I only see 
> 1.1.13.bb but not the 1.1.12.bb and both appends are there.
>
> Thanks.
Just moving the file from the tree made builds continue. Was this recipe 
something that should have been deleted but was missed?

Thanks


