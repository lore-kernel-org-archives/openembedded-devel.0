Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Q153N-0005yV-Jr
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 23:55:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id D70F0A4952
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 22:53:39 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id X1Fk4iP6mF-q
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 22:53:39 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 02220A4950
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 22:53:38 +0000 (GMT)
Message-ID: <4D8533F3.7090301@xora.org.uk>
Date: Sat, 19 Mar 2011 22:53:39 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <6F3B187F-5497-4504-9EEB-99204CCC815B@vanille-media.de>	<4D83E632.2040701@xora.org.uk>
	<4D8530EF.5040307@mentor.com>
In-Reply-To: <4D8530EF.5040307@mentor.com>
X-Enigmail-Version: 1.1.1
Subject: Re: blacklist.bbclass
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
X-List-Received-Date: Sat, 19 Mar 2011 22:55:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 19/03/2011 22:40, Tom Rini wrote:
> On 03/18/2011 04:09 PM, Graeme Gregory wrote:
>> On 18/03/2011 19:24, Dr. Michael Lauer wrote:
>>> Salut,
>>>
>>> the blacklisting of packages as found in angstrom.bbclass
>>> is pretty helpful and would be beneficial to all kinds
>>> of distribution configurations in OE. Would there be
>>> a strong objection of renaming this to blacklist.bbclass?
>>>
>>> Copying, of course, is also a possibility, but
>>> in my opinion it would only be the second best choice.
>>>
>> As the author I object to renaming it.
>>
>> We have played this rename game before and Im still not happy with the
>> results of the last time.
>>
>> I also object on the grounds of the amount of abuse I got from some
>> other distro maintainers for implementing this, which is the reason it
>> is called angstrom.bbclass.
>
> OK.  Can we change the message so it says ${DISTRO} doesn't support,
> rather than Angstrom doesn't support?
>
Heh, your slow, do a git pull :-)

Graeme



