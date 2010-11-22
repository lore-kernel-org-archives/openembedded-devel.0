Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1PKWGm-0001VQ-3q
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 14:17:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 681422C7DD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 13:15:35 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPz2uaiwtCJa
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 13:15:31 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id EA0272C798
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 13:15:30 +0000 (UTC)
Message-ID: <4CEA6D14.1070702@gmail.com>
Date: Mon, 22 Nov 2010 14:16:04 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE96FE9.2080707@gmail.com>
	<AANLkTi=k06bB44UMxsQADDJxbPFkLKk53P9KCtvNH=qt@mail.gmail.com>
In-Reply-To: <AANLkTi=k06bB44UMxsQADDJxbPFkLKk53P9KCtvNH=qt@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: pixman_0.21.2.bb do_compile failed
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
X-List-Received-Date: Mon, 22 Nov 2010 13:17:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Khem Raj ha scritto, Il 22/11/2010 07:38:
> On Sun, Nov 21, 2010 at 11:15 AM, Marco Cavallini
> <koansoftware@gmail.com> wrote:
>> Hi,
>> Recently I am facing to a new error using DISTRO=kaeilos-2010 and
>> MACHINE=ronetix-pm9263.
>> I would be grateful if anybody could give me a hint about how could it
>> be caused and how to solve it.
> 
> as a quick workaround can you add
> ARM_INSTRUCTION_SET = "arm" in the recipe and see if that helps ?
> 
>> http://pastebin.com/hi2SVSuF
>>
>> TIA
>> /marco
>>

Khem,
thank you for answering.

Unfortunately the problem is deeper and more complex.
BTW I can't figure out why Angstrom builds fine.

/marco



