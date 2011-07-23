Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Qkefi-0006Hz-Sv
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jul 2011 18:03:23 +0200
Received: (qmail 23020 invoked by uid 1003); 23 Jul 2011 15:59:12 -0000
Received: from unknown (HELO ?192.168.1.167?)
	(philip@opensdr.com@96.240.162.216)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	23 Jul 2011 15:59:12 -0000
Message-ID: <4E2AEFCE.7060406@balister.org>
Date: Sat, 23 Jul 2011 11:59:10 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110621 Fedora/3.1.11-1.fc14 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1307648104-24260-1-git-send-email-raj.khem@gmail.com>	<4E29B25D.8030503@balister.org>	<20110722202113.GA19631@sakrah.homelinux.org>
	<CAG4_upTZ9cjZG-jrcj7NSWhwrb539yUqVm89HUCdxrk97JWi_A@mail.gmail.com>
In-Reply-To: <CAG4_upTZ9cjZG-jrcj7NSWhwrb539yUqVm89HUCdxrk97JWi_A@mail.gmail.com>
Subject: Re: [PATCH] gcc: Package libstdc++ gdb python helpers into dev package
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
X-List-Received-Date: Sat, 23 Jul 2011 16:03:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2011 11:09 AM, Chris Verges wrote:
> On Fri, Jul 22, 2011 at 1:21 PM, Khem Raj<raj.khem@gmail.com>  wrote:
>> On (22/07/11 13:24), Philip Balister wrote:
>>> On 06/09/2011 03:35 PM, Khem Raj wrote:
>>>> People are seeing these errrors from ldconfig
>>>> libstdc++.so.6.0.14-gdb.py is not an ELF file - it has the wrong magic
>>>> bytes at the start.
>>>
>>> No more annoying message when I run ldconfig. Getting this fix in
>>> will reduce my support emails by a small, but noticeable amount.
>>
>> thanks for testing it out. I have installed in in oe.dev/master
>
> Would it be worth a cherry-pick of this into 2011.03-maintenance?
> I've been seeing it there with gcc 4.4.4, too, and have the same issue
> with questions that pop up about it.

I'm going to look at this "soon".

Philip


