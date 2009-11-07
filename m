Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N6h2d-00080M-So
	for openembedded-devel@openembedded.org; Sat, 07 Nov 2009 09:53:07 +0100
Received: (qmail 2335 invoked by uid 1003); 7 Nov 2009 08:45:08 -0000
Received: from localhost (HELO ?192.168.48.81?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 7 Nov 2009 08:45:08 -0000
Message-ID: <4AF53391.8090806@balister.org>
Date: Sat, 07 Nov 2009 08:45:05 +0000
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ac9c93b10911061238p366f65edqeff04b25c872015f@mail.gmail.com>
	<200911070406.18094.holger+oe@freyther.de>
In-Reply-To: <200911070406.18094.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what to do with wrong checksum
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
X-List-Received-Date: Sat, 07 Nov 2009 08:53:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2009 03:06 AM, Holger Hans Peter Freyther wrote:
> On Friday 06 November 2009 21:38:40 Frans Meulenbroeks wrote:
>> While trying to build xmltv I got this:
>>
>> NOTE: The MD5Sums did not match. Wanted:
>> '495fd8c320f67a0c8e0b90ccb060f0ea' and Got:
>> '68d9a93d507bbf917e1f3ad294fd5727'
>> NOTE: Task failed: Checksum of
>> 'http://xmltwig.com/xmltwig/XML-Twig-3.33.tar.gz' failed
>>
>> How should I handle this. Of course I can change the checksum, but i
>> don't think that is the intention :-)
>> Is there a version somewhere cached that has the old checksum (so I
>> can compare).
>> Or how else should I handle this?
>
>
> Check the angstrom mirror or sources.oe.org and download that version
> and then diff it.

Try asking the xmltwig people what happened.

Philip

>
> z.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


