Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NH3FH-0007vD-F3
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Dec 2009 23:36:58 +0100
Received: (qmail 21225 invoked by uid 1003); 5 Dec 2009 22:35:15 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 5 Dec 2009 22:35:14 -0000
Message-ID: <4B1AE022.40204@balister.org>
Date: Sat, 05 Dec 2009 17:35:14 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1260039602-21665-1-git-send-email-darkstar6262@gmail.com>
	<4B1AC1D3.6000601@balister.org>
	<6cb013310912051247h6fc00140h74b6d49118e3cf99@mail.gmail.com>
In-Reply-To: <6cb013310912051247h6fc00140h74b6d49118e3cf99@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE] [PATCH] icu: Add patch for dangling #elif	expression
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
X-List-Received-Date: Sat, 05 Dec 2009 22:36:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2009 03:47 PM, Cory Maccarrone wrote:
> On Sat, Dec 5, 2009 at 12:25 PM, Philip Balister<philip@balister.org>  wrote:
>> On 12/05/2009 02:00 PM, Cory Maccarrone wrote:
>>>
>>> This change adds a patch that fixes a compile error in
>>> source/layoutex/ParagraphLayout.cpp caused by an
>>
>> I'm testing this and also see a problem with icu-native preventing icu from
>> building. Did you fix this in stable also?
>>
>
> I haven't noticed any issues with icu-native -- I was building the
> openmoko image when I encountered this, and for me this patch was
> enough to get it compiling again.  I've confirmed that both icu and
> icu-native compiled fine for me after this patch is added.

I had to clean icu-native also after making sure the problem was real. 
Hn it builds, I'll acck, apply, and push.

Philip


