Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SMmgC-0001bj-8x
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Apr 2012 22:49:52 +0200
Received: by vcbfl13 with SMTP id fl13so910533vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Apr 2012 13:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=38Q+XJKnRDdQ0mnzjDjYx4edm17xCPSEv5qxNuinjII=;
	b=o1yk9YvZDATTJBLultL1/tH1EOZC+9KoBlUghANTYlYvwrf69UqLnlHDq5vl8CIrex
	QzTSnqc71mCP1JTXyPl8OFkVJL1e5CMcYy5DNc5hAAZM9xhE2XYUifMy06dvPo8L2lQf
	c0Qsobq/x8vfmmowd1pyB9Z/NVv4jlhfQbcl5fb6fbTEr6OSYuMjm40zo8Bb+ML4gT84
	x+kTdmVuX+VWSD1VLOB3qlFqKwK8FiBWe+4b7HoHa9bY/Y3IfGrVqrwwjcz+4vKDLwPr
	cAWj7ohbKz7Fwf5fWi8nH05VGZslTeoJb9P9TW2uiCC06eTvZ58x744mcsKTFLcPJvJ8
	z8fg==
Received: by 10.220.149.130 with SMTP id t2mr21808844vcv.40.1335300008988;
	Tue, 24 Apr 2012 13:40:08 -0700 (PDT)
Received: from [192.168.1.14] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id hf9sm33313329vdb.7.2012.04.24.13.40.05
	(version=SSLv3 cipher=OTHER); Tue, 24 Apr 2012 13:40:08 -0700 (PDT)
Message-ID: <4F970F9C.7030508@gmail.com>
Date: Tue, 24 Apr 2012 13:39:56 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120406 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F88ADA3.5030804@gmail.com>
	<4F8C9902.8020904@gmail.com> <4F8C9D26.9050500@mlbassoc.com>
	<4F8C9E68.9050106@gmail.com> <4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com> <4F8DCFC4.9010508@gmail.com>
	<4F8DDDB7.5010605@gmail.com> <4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
	<4F8E53DD.6060404@gmail.com>
	<CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
	<4F8F8749.8000803@gmail.com>
	<CAMKF1spNs63FypJRj332WJzwL9M_eoMFqbiVYzM7BLCim6-9MQ@mail.gmail.com>
	<4F90B056.5020209@gmail.com> <4F9144BE.1070508@mlbassoc.com>
	<4F91A4E4.2090608@gmail.com> <4F932ADB.7040003@gmail.com>
In-Reply-To: <4F932ADB.7040003@gmail.com>
Subject: Re: [oe-core] 3 build machines all failing in the same manner - was:ld segfault cant figure it out
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
X-List-Received-Date: Tue, 24 Apr 2012 20:49:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/21/2012 02:47 PM, j wrote:
> <snip>
>
> Thank you for your time and help.

really I am the only person who is this unlucky with 3 build machines 
all having the same issue ? This makes no sense to me. Is there anything 
I stated in my steps following or the guides I stated that it is not 
giving me a working build machine on 3 different setups all with the 
same issue? I have tried Ubuntu on every machine so it has nothing to do 
with me trying Arch initially. 10.04 11.04 and 12.04.

So the qa.log I attached previously is meaningless? The 
warnings/messages mean nothing? To me the ld segfault is the reason most 
of qa.log has messages. Also why would oe-classic build on my laptop and 
one of the borrowed machines with no segfaults and no issues with the 
completed images, but then doing the new setup and version used gives me 
the build issues on multiple machines. I also do not understand why if 
while building, the build machine segfaults while building some package 
but the "offending" package does not fail.

But since I obviously do not get what I should be supplying to the list 
for help and I am obviously the only person who has this issue and do 
not get working images in the end, this will go unsolved unless I just 
get lucky.

I am cleaning each machine again and going to try one last time on each 
one with Ubuntu 10.04 following the steps I listed above and the guides 
I stated, if all 3 fail again and with no more info than I get now I 
will just have to call it broken, and only works for specific hardware. 
Again I am willing to share any specific info that I have not already 
throughout this thread, but I do not feel like flooding anymore if there 
is no interest in this and will have to go to a different OS and build 
methods for the BBXM. The only different thing I am going to do this 
time is let it re-download all the sources over again just in case that 
is the cause, though doubt it is.

Do not mean to sound rude or ungrateful with the help recieved so far 
but this is very frustrating and I seem to be able to easily reproduce 
this on multiple hardware configurations, which is part of why I do not 
get how I am the only one.

Thank you for your time.


