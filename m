Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1PjWaX-0002zS-KI
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Jan 2011 13:41:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 03F5414036;
	Sun, 30 Jan 2011 12:40:10 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1Zp5QSo-flFk; Sun, 30 Jan 2011 12:40:09 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id CFCE914022;
	Sun, 30 Jan 2011 12:40:08 +0000 (GMT)
Message-ID: <4D455C28.7010406@xora.org.uk>
Date: Sun, 30 Jan 2011 12:40:08 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: Paul Sokolovsky <pmiscml@gmail.com>
References: <20110130022818.1c15662c@widy.localdomain>	<4D44C015.9050700@xora.org.uk>
	<20110130123418.4e354145@widy.localdomain>
In-Reply-To: <20110130123418.4e354145@widy.localdomain>
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
X-List-Received-Date: Sun, 30 Jan 2011 12:41:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 30/01/2011 10:34, Paul Sokolovsky wrote:
> Hello,
>
> On Sun, 30 Jan 2011 01:34:13 +0000
> Graeme Gregory <dp@xora.org.uk> wrote:
>
>> On 30/01/2011 00:28, Paul Sokolovsky wrote:
>>> Hello,
>>>
>>> Searching for "openembedded" on both github and gitorious give
>>> quite a few hits:
>>>
>>> http://github.com/search?langOverride=3D&q=3Dopenembedded&repo=3D&sta=
rt_value=3D1&type=3DRepositories
>>> http://gitorious.org/search?q=3Dopenembedded
>>>
>>> Was there a thought to provide official mirrors on both (or one)
>>> services for the purpose of accounting forks?
>>>
>> There is an "official" =C3=85ngstrom mirror on gitorious.
>>
>> http://gitorious.org/+angstrom-distribution/angstrom/openembedded
> Yes, seeing it made me think that it would be nice to fork it via site
> means. Is there guarantee of upstream update time for it? Also, even
> then it seems like a 2nd-level fork, not forking a pure OE repo
> specially designed to keep track of offshots.
>
No we just update it sometime or other. But with git it doesn't really
matter I think.

I think you best option is to approach OE with a plan to run such
projects yourself and get the admins to put a crontab in for you which
does the update nightly or something like that.

Graeme



