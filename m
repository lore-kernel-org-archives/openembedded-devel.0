Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1PjaPQ-00029T-6l
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Jan 2011 17:45:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id BCD1114036;
	Sun, 30 Jan 2011 16:44:58 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Tw7vUWhLEORT; Sun, 30 Jan 2011 16:44:57 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id AEE8D14022;
	Sun, 30 Jan 2011 16:44:57 +0000 (GMT)
Message-ID: <4D459589.1020707@xora.org.uk>
Date: Sun, 30 Jan 2011 16:44:57 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <20110130022818.1c15662c@widy.localdomain>	<4D44C015.9050700@xora.org.uk>	<20110130123418.4e354145@widy.localdomain>	<4D455C28.7010406@xora.org.uk>
	<20110130181210.17afe082@widy.localdomain>
In-Reply-To: <20110130181210.17afe082@widy.localdomain>
X-Enigmail-Version: 1.1.1
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Official git mirror on github/gitorious?
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
X-List-Received-Date: Sun, 30 Jan 2011 16:45:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 30/01/2011 16:12, Paul Sokolovsky wrote:
> Hello,
>
> On Sun, 30 Jan 2011 12:40:08 +0000
> Graeme Gregory <dp@xora.org.uk> wrote:
>
> []
>>>> There is an "official" =C3=85ngstrom mirror on gitorious.
>>>>
>>>> http://gitorious.org/+angstrom-distribution/angstrom/openembedded
>>> Yes, seeing it made me think that it would be nice to fork it via
>>> site means. Is there guarantee of upstream update time for it?
>>> Also, even then it seems like a 2nd-level fork, not forking a pure
>>> OE repo specially designed to keep track of offshots.
>>>
>> No we just update it sometime or other. But with git it doesn't really
>> matter I think.
>>
>> I think you best option is to approach OE with a plan to run such
>> projects yourself and get the admins to put a crontab in for you which
>> does the update nightly or something like that.
> Well, it's indeed doesn't matter much technically, and not important
> for one case. But as I pointed out, there're ~30 or something forks
> around. Maybe it would be good visibility, and well, PR, if there were
> official mirrors on popular git hosting sites where that number
> (dozen or so) could be seen directly.
>
> Otherwise, having asked if it's already there, I better just put up
> my little stuff like everybody else did so far, and hopefully proceed
> to submit patches/advocate them instead ;-).
>
Personally I think the idea is probably good. But Id hate to ask the
already overworked OE admins to try and maintain yet another system. As
a board member i prefer the method of co-opting fellow OE users to feel
empowered to run these services themselves with support from us. The
more we can push tasks like this to ordinary developers such as yourself
the better. The more OE can spread the load the better for the whole
community.

Graeme



