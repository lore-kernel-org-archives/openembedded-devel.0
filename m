Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1NPhFj-0006a8-2t
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Dec 2009 19:57:10 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id BE69C16605D2; Tue, 29 Dec 2009 11:55:09 -0700 (MST)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 7679C16604D5;
	Tue, 29 Dec 2009 11:55:09 -0700 (MST)
Message-ID: <4B3A508D.8030908@mlbassoc.com>
Date: Tue, 29 Dec 2009 11:55:09 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.3a1pre) Gecko/20091228 Shredder/3.1a1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <c384c5ea0912281419h3c14c675r8ec6d044c234a381@mail.gmail.com>	<hhcg4o$ubd$1@ger.gmane.org>	<c384c5ea0912290651i1d3370bdk509d6f04f54a8d1a@mail.gmail.com>
	<hhdi83$13n$1@ger.gmane.org>
In-Reply-To: <hhdi83$13n$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: helloworld image
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
X-List-Received-Date: Tue, 29 Dec 2009 18:57:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/2009 11:36 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 29-12-09 15:51, Leon Woestenberg wrote:
>> Hello Koen,
>>
>> On Tue, Dec 29, 2009 at 9:54 AM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>>> On 28-12-09 23:19, Leon Woestenberg wrote:
>>>> I would like to start with nothing and then configure the system for
>>>> what I need.
>>>>
>>>> Should I start another more-minimal distro or can we change the
>>>> minimal distro to be truely minimalistic?
>>>
>>> You're confusing image and distro again. With angstrom I'm using a 80KiB
>>> big image that has an fbdev based gui, so it looks your image recipe is
>>> doing something wrong.
>>>
>> I think I am not confusing them again, I think other people are.
>>
>> This is what happened:
>>
>> Changes to the distro have made the image bigger (80 kB to 4MB).
>>
>> Apparently, the image does not define what goes in the image, but the
>> distro now specifies a minimum amount of packages that goes in.
>
> Actually it does not, your image recipe has the final say. Like I said,
> I have no trouble building an 80KiB image with angstrom.
>

I'd like to know what steps you take to make such an image.

Perhaps you could share your config files so that others can
see how it's done (as opposed to just repeating that it *can*
be done)?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


