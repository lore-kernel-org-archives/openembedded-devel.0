Received: from [66.249.82.237] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1HiWjj-0005dT-AQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2007 16:20:20 +0200
Received: by wx-out-0506.google.com with SMTP id t14so1516754wxc
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2007 07:11:06 -0700 (PDT)
Received: by 10.90.27.13 with SMTP id a13mr5173733aga.1177942265946;
	Mon, 30 Apr 2007 07:11:05 -0700 (PDT)
Received: from cube ( [82.193.98.1])
	by mx.google.com with ESMTP id r1sm7494281nzd.2007.04.30.07.11.04;
	Mon, 30 Apr 2007 07:11:05 -0700 (PDT)
Date: Mon, 30 Apr 2007 17:11:03 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <563812522.20070430171103@gmail.com>
To: "Leon Woestenberg" <leon.woestenberg@gmail.com>
In-Reply-To: <c384c5ea0704300524w40a360adne073f9576ee71e19@mail.gmail.com>
References: <c384c5ea0704300524w40a360adne073f9576ee71e19@mail.gmail.com>
MIME-Version: 1.0
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: Re: RFC: kernel configure steps hang if make oldconfig goes interactive
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2007 14:20:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Leon,

Monday, April 30, 2007, 3:24:45 PM, you wrote:

> Hello,

> I have noticed some kernel builds use an outdated defconfig (because
> they use that of another kernel), the one I'm now encountering is
> linux-efika-2.6.18+2.6.19-rc6-r2.
[]
>                 yes | make ARCH=${ARCH} oldconfig
[]

> Is this something we would bring in?

        linux-handhelds-2.6 and some other kernel recipes have been
using that all the time.

> Regards,



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



