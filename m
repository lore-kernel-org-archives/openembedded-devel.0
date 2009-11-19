Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NB8Fe-0001c4-GK
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 15:44:53 +0100
Received: (qmail 30633 invoked by uid 1003); 19 Nov 2009 14:43:24 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 19 Nov 2009 14:43:24 -0000
Message-ID: <4B055989.4030407@balister.org>
Date: Thu, 19 Nov 2009 09:43:21 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <be7a9f3d0911181211s614defeaq5a49ca33c3691c50@mail.gmail.com>	<1258576924.25369.687.camel@lenovo.internal.reciva.com>	<be7a9f3d0911181421i4d3a1ffy2417cbbd91d9a1ff@mail.gmail.com>	<1258631715.23826.63.camel@mill.internal.reciva.com>	<be7a9f3d0911190542j2bea66ccs65d6261b9c92bf87@mail.gmail.com>	<1258638762.23826.90.camel@mill.internal.reciva.com>
	<alpine.LFD.2.00.0911190909260.5078@localhost>
In-Reply-To: <alpine.LFD.2.00.0911190909260.5078@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Merging of stable/2009 into dev
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
X-List-Received-Date: Thu, 19 Nov 2009 14:44:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/2009 09:12 AM, Robert P. J. Day wrote:
> On Thu, 19 Nov 2009, Phil Blundell wrote:
>
>> On Thu, 2009-11-19 at 11:42 -0200, Otavio Salvador wrote:
>>> Ok but what is the planned migration path from users that used
>>> stable/2009 to stable/2010?
>>>
>>> I mean, when we start stable/2010 we expect that users that based
>>> their distros in stable/2009 need to redo all work to move to
>>> stable/2010? If we merge stable/2009 into .dev then this is going
>>> to be much easier.
>>
>> I am still struggling to understand what you mean by "merge
>> stable/2009 into .dev".  Can you please explain what exactly you
>> think the result of this merge would look like?  Maybe you could
>> pick a couple of sample packages and give a concrete description of
>> how the merged version would differ from what is currently in .dev.
>
>    what *is* the protocol for a new OE release?  if one were to emulate
> kernel development, it would normally involve, perhaps, starting a new
> branch headed toward, say, stable/2010, where packages would slowly be
> frozen and, as the release date approached, we'd see tags like "rc1",
> "rc2" and so on, and a final freeze and tag of "stable/2010", no?
>
>    in the meantime, the .dev branch would chug merrily on.  is that
> even remotely close?

Basically, the users define a release. From the discussion at OEDEM it 
is clear that there groups of people with similar (but very different 
needs).

I don't see a problem with groups of people getting together and 
defining a workflow for a branch they maintain. There is more than one 
right way to do this.

Philip


