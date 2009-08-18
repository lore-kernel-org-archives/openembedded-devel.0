Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MdTXK-0004Br-Q1
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 20:36:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5B44C54169C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 14:18:53 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01035-09 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 18 Aug 2009 14:18:53 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 33E60541689
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 14:18:53 -0400 (EDT)
Message-ID: <4A8AF08C.4010009@cbnco.com>
Date: Tue, 18 Aug 2009 14:18:52 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1250547762-18690-1-git-send-email-msmith@cbnco.com>	<20090817234217.GI2227@smtp.west.cox.net>
	<19c1b8a90908172337h6e1f5b81uc321c553141a3929@mail.gmail.com>
In-Reply-To: <19c1b8a90908172337h6e1f5b81uc321c553141a3929@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] site/common-linux: centralize bash configure vars
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
X-List-Received-Date: Tue, 18 Aug 2009 18:36:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Mon, Aug 17, 2009 at 4:42 PM, Tom Rini<trini@embeddedalley.com> wrote:
>> On Mon, Aug 17, 2009 at 06:22:42PM -0400, Michael Smith wrote:
>>
>>> If the other site files are accurate, almost all of the bash vars
>>> are universal across Linux.

> Did you test it by building/running uclibc based system as well ?

I did now, on x86... bash seems to work before and after.

Mike


