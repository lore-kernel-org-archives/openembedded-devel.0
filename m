Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Im3qH-0007jC-So
	for openembedded-devel@openembedded.org; Sun, 28 Oct 2007 09:49:57 +0100
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9S8gBUo002085 for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Oct 2007 09:42:12 +0100
Message-ID: <47244B64.2030609@student.utwente.nl>
Date: Sun, 28 Oct 2007 09:42:12 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <471FC1C0.4010103@linux.it>
	<20071025001926.GA14645@lenovo>	<472047C3.20208@student.utwente.nl>
	<20071025121153.GA8231@lenovo>	<f96d234e0710251034s488b9c13me8c4d9731638a94e@mail.gmail.com>	<20071026134528.GA6182@lenovo>
	<1193483219.6376.100.camel@toontown>	<20071027153928.GA6118@lenovo>	<47237509.8070405@student.utwente.nl>
	<20071027212600.GA6219@lenovo>
In-Reply-To: <20071027212600.GA6219@lenovo>
X-Enigmail-Version: 0.95.4
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: getting started - docbook
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Oct 2007 08:49:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

David Farning schreef:
> On Sat, Oct 27, 2007 at 07:27:37PM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> David Farning schreef:
>>> On Sat, Oct 27, 2007 at 01:06:59PM +0200, Tobias Pflug wrote:
>>>> on 1: 
>>>> with big picture I mean there should be a description of the 
>>>> "system" with its main components. Currently i think there is too
>>>> little of that, and too many use-cases. ("In order to change xyz,
>>>> apply abc to 123").
>>> I finished a rough draft of getting started this morning.  I am going
>>> to let it sit for a week before looking at it again.  Then I will
>>> rework as needed and submitte for review.
>>>
>>> In the mean time I am starting on a introduction chapter.  This will
>>> be a very high level overview.  Below is a first stab at the outline.
>> Even if 99.9% if the people use OE to build linux stuff, it is able to
>> build nonlinux targets like bare-metal stuff for the msp430
>> microcontroller and things like arm-wince-pe or arm-apple-darwin.
> 
> That makes sense.  Nothing special about the Linux kernel.  For the
> purposes of documentation would you mind if we:
> 
> 1 Studied the device - processer, memory, IO, devices....
> 2 Studied a generic Linux distribution - kernel, libs, apps, packages,
> files system....
> 3 Discussed how to use bb/oe to create a customized distro to run on a
> specific device.

I don't mind at all, since I said that's what 99% of the people do :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHJEtkMkyGM64RGpERAj1lAJwKnbjzj21rEj9TLZUfqrF0DHDQHwCgulo7
CaUokllIm5bTMLMv/dIg1Ko=
=f5+C
-----END PGP SIGNATURE-----


