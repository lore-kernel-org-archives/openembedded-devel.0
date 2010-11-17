Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PIlt3-0006ce-Iw
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 18:33:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 5F6538F8575
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 12:32:32 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15911-02 for <openembedded-devel@lists.openembedded.org>; 
	Wed, 17 Nov 2010 12:32:32 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 1F235898DF8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 12:32:32 -0500 (EST)
Message-ID: <4CE411AF.1060804@cbnco.com>
Date: Wed, 17 Nov 2010 12:32:31 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1289482655-20086-1-git-send-email-msmith@cbnco.com>
	<AANLkTimdHUNPec=AKNXJCbwbM9UeJ0yP+d5ZNDMwVmRC@mail.gmail.com>
In-Reply-To: <AANLkTimdHUNPec=AKNXJCbwbM9UeJ0yP+d5ZNDMwVmRC@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] usbutils 0.70 & 0.73: don't set DEFAULT_PREFERENCE = "1"
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
X-List-Received-Date: Wed, 17 Nov 2010 17:33:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Thu, Nov 11, 2010 at 5:37 AM, Michael Smith <msmith@cbnco.com> wrote:
>> I think it may be leftover from earlier.  Let 0.86 build by default.
>> Most distros already prefer it.
>>
> 
> does it work well with udev 141 ?
> some uclibc based distros still use older udev

I use udev 141, but not uclibc; it seems to work here.

Mike


