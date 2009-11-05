Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N5w7S-00078M-GB
	for openembedded-devel@openembedded.org; Thu, 05 Nov 2009 07:46:57 +0100
Received: (qmail 17171 invoked by uid 1003); 5 Nov 2009 06:45:40 -0000
Received: from localhost (HELO ?192.168.0.4?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 5 Nov 2009 06:45:40 -0000
Message-ID: <4AF27492.9010904@balister.org>
Date: Thu, 05 Nov 2009 06:45:38 +0000
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911050014240.6944@localhost>	<20091105053459.GC30116@denix.org>
	<20091105054827.GD30116@denix.org>
In-Reply-To: <20091105054827.GD30116@denix.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: where is the canonical OE web site these days?
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
X-List-Received-Date: Thu, 05 Nov 2009 06:46:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/05/2009 05:48 AM, Denys Dmytriyenko wrote:
> On Thu, Nov 05, 2009 at 12:34:59AM -0500, Denys Dmytriyenko wrote:
>> On Thu, Nov 05, 2009 at 12:15:09AM -0500, Robert P. J. Day wrote:
>>>
>>>    if one goes to openembedded.org these days, one gets to
>>> linuxtogo.org.  but there's also the site openembedded.net, which
>>> takes you to a fairly useful wiki (even if some of the info seems a
>>> bit out of date).  and the linuxtogo wiki definitely doesn't take one
>>> over to the openembedded.net wiki.
>>>
>>>    so where's the official portal these days?
>>
>> Try http://www.openembedded.org or http://wiki.openembedded.org. I believe
>> there is a misconfiguration (in DNS?) where openembedded.org points to the IP
>> address of linuxtogo.org, hence opening http://openembedded.org opens
>> http://linuxtogo.org
>> Not sure if there was a reason for that, as linuxtogo.org handles the mailing
>> list, but that would require an MX record, not IN...
>
> Sorry, meant to say "would require MX record, not A"...
>
> Hmm, interesting. According to my dig, there is no MX record for
> openembedded.org. Then lists.openembedded.org is a CNAME to openembedded.org -
> no wonder it requires to point A record to linuxtogo.org for the mailing list
> to work properly... I'm not sure why it's being done this way - let's ask
> admins :)

Yeah, I tried setting up a MX record once, but for some reason it did 
not work. We'll talk a little about this at OEDEM and I will see if I 
can work out a way to resolve this problem.

Philip

>
>> openembedded.net is an older and different zone, which has no such issue.
>> AFAIK, there is a move to deprecate openembedded.net in favor of
>> openembedded.org...
>>
>> Current infrastructure is documented here:
>> http://wiki.openembedded.net/index.php/Infrastructure
>


