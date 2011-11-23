Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RTKVE-00029w-D4
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Nov 2011 22:37:12 +0100
Received: (qmail 13839 invoked by uid 1003); 23 Nov 2011 21:30:39 -0000
Received: from unknown (HELO ?192.168.1.104?) (philip@opensdr.com@96.240.172.5)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	23 Nov 2011 21:30:39 -0000
Message-ID: <4ECD65FC.7000104@balister.org>
Date: Wed, 23 Nov 2011 16:30:36 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
In-Reply-To: <CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Wed, 23 Nov 2011 21:37:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 11/23/2011 04:18 PM, Frans Meulenbroeks wrote:
> 2011/11/23 Khem Raj <raj.khem@gmail.com>
> 
>> On Thu, Oct 27, 2011 at 3:53 AM, Mats Kärrman <Mats.Karrman@tritech.se>
>> wrote:
>>> Hi,
>>>
>>> Are there any plans for new releases and/or maintenance branches of OE
>> classic?
>>>
>>
>> 2011.03-maintenance is the last release of OE classic. As long as the
>> branch is maintained
>>
>> _
>>
>> Related: I noticed TSC plans to discuss on whether or not to make oe
> classic read only.
> 
> I'd like to suggest leaving it open for those of us that are still using
> it.
> For instance I have still products that are based on OE classic. If there
> is a problem that is of a generic nature, I'm more than happy to submit
> patches so others in the same situation can benefit from it.
> (actually I have one pending with a new version of netsnmp; the current
> recipe does not build with uclibc, whereas the latest version of netsnmp
> does; found/fixed this today, but haven't had time to make a commit)
> 
> And if there is no interest any more it'll eventually die. But as of now I
> do see people working on/with it (see the commit log).

At some point it needs to die/go read only.

But, until oe-core + openembedded can replace it, we need to be able to
do minor updates to support already deployed systems.

Philip


