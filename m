Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QuQ1s-0003tG-0h
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 16:26:36 +0200
Received: by gwb11 with SMTP id 11so1609656gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 07:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=3YTne1e8HTiNsZemGOAT0ursxQFR12he7KnQMver9+M=;
	b=PfpJbiSKi1x4s5SrVZp3fN6h6r/JmsZxtzlNP3WQ5WIZydnt/FPpMN+vXN3eQ39dTh
	EMDksA00IyFqvO+bn/BBcX4Xkwvsx3ZJs1QH0CpJkL884hgO8UVUv3b3eIYtwkTASDqB
	oPfjBQpgHQo/WMAXhPr1/deQr2WyX4PzXluCw=
Received: by 10.236.77.131 with SMTP id d3mr8004810yhe.63.1313763714993;
	Fri, 19 Aug 2011 07:21:54 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p11sm1681164ibf.47.2011.08.19.07.21.51
	(version=SSLv3 cipher=OTHER); Fri, 19 Aug 2011 07:21:52 -0700 (PDT)
Message-ID: <4E4E717C.2040506@gmail.com>
Date: Fri, 19 Aug 2011 07:21:48 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: Steffen Sledz <sledz@dresearch-fe.de>
References: <4E3A3C4B.8040208@dresearch-fe.de>
	<4E40FCA9.7060204@dresearch-fe.de>
	<4E439289.3050005@dresearch-fe.de> <1615282.kebj4eQ1MV@perseus>
	<4E44C076.90407@dresearch-fe.de> <4E4E28AB.8010806@dresearch-fe.de>
In-Reply-To: <4E4E28AB.8010806@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] unsatisfied dependencies to libgcc
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
X-List-Received-Date: Fri, 19 Aug 2011 14:26:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/2011 2:11 AM, Steffen Sledz wrote:
> Regards,
> Steffen
>
> PS: I'm i bit disappointed in the weak help from the maintainers in solving the problem. :( But i do not bear grudges[1]. ;-)
>
> [1] Hope that's correct english.

personally I would have liked to help more but was short on time and 
since I could not reproduce the problem at my end. It was not obvious to 
me what the problem was.


