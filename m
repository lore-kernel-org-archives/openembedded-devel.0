Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OF6m8-0000of-L7
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 16:31:06 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 93BC216603F1; Thu, 20 May 2010 08:27:03 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id F150C16603C5;
	Thu, 20 May 2010 08:27:02 -0600 (MDT)
Message-ID: <4BF546B6.1090604@mlbassoc.com>
Date: Thu, 20 May 2010 08:27:02 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BF532DA.4080601@mlbassoc.com>	<AANLkTimYRrV82uHzco2jxLhEXw-7YTBx7fBOJb5YV4ZY@mail.gmail.com>	<4BF53ED3.2000806@mlbassoc.com>
	<AANLkTil8Wgu6KX91M-dl3IURrQNHTJk4zVWImCYxLITF@mail.gmail.com>
In-Reply-To: <AANLkTil8Wgu6KX91M-dl3IURrQNHTJk4zVWImCYxLITF@mail.gmail.com>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why is OE so slow?
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
X-List-Received-Date: Thu, 20 May 2010 14:31:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/20/2010 07:56 AM, Frans Meulenbroeks wrote:
> 2010/5/20 Gary Thomas<gary@mlbassoc.com>:
>> On 05/20/2010 07:28 AM, Andrea Adami wrote:
>>>
>>> I guess you're using bitbake_1.8.18.
>>> Use bitbake_1.10.0.
>>
>> Where do I get it?  It's not at http://download.berlios.de/bitbake/
>
> cgit.openembedded.org/bitbake

Thanks

The performance is *much* better - even rebuilding the cache, it
dispatched the first task in around 6 minutes (compared to 22)

Sadly, Angstrom seems totally broken at the moment, but that's another issue.

>>
>> Thanks
>>
>>> On Thu, May 20, 2010 at 3:02 PM, Gary Thomas<gary@mlbassoc.com>    wrote:
>>>>
>>>> I'm using OpenEmbedded to build Angstrom.  Recent trees
>>>> in the org.openembedded.dev branch have some 8370 recipes.
>>>> When I initiate a build, it takes *forever* just to get started.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


