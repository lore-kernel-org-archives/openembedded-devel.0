Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NKtVu-0006X1-JM
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Dec 2009 14:02:01 +0100
Received: (qmail 13909 invoked by uid 1003); 16 Dec 2009 13:00:09 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 16 Dec 2009 13:00:09 -0000
Message-ID: <4B28D9D8.90102@balister.org>
Date: Wed, 16 Dec 2009 08:00:08 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <b381e0f80912150646v710aa0ecy4c4526d78f5acde3@mail.gmail.com>	<b381e0f80912160336t7a5a447as34fe2684abcc3649@mail.gmail.com>	<4B28C8D2.3000101@kernelconcepts.de>
	<b381e0f80912160454t1fa01b67id1a1426bbe97c722@mail.gmail.com>
In-Reply-To: <b381e0f80912160454t1fa01b67id1a1426bbe97c722@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Issue with bitbake
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
X-List-Received-Date: Wed, 16 Dec 2009 13:02:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/2009 07:54 AM, Vijay Rathi wrote:
> Hi,
>
> Thanks for quick reply.
>
> I followed steps mentioned at :
>
> http://www.angstrom-distribution.org/building-angstrom
>
> I tried using two approach in different directory/environment
>
> 1. As mentioned in online manual, I added ->  MACHINE ?= "beagleboard" (which
> i feel incorrect)
> 2. As mentioned in online manual, I added ->  MACHINE = "beagleboard"
>
> But I had same results with - bitbake base-image ie. libsdl-native... failed
>
> I am using Fedora Core 9 on my host.
>
> Am I missing something?

Try a git pull and restart the build.

Philip



>
> Regards,
> Vijay
>
> On Wed, Dec 16, 2009 at 5:17 PM, Florian Boor<
> florian.boor@kernelconcepts.de>  wrote:
>
>> Hi,
>>
>> Vijay Rathi schrieb:
>>> I have recently setup the bitbake, OE development tree as per the  wiki
>> for
>>> beagleboard.
>>
>> it would be good to have a link to which instruction you are referring.
>>
>>>
>> /home/dev/OE/angstrom-dev/work/i686-linux/libsdl-native-1.2.11-r2/temp/log.do_compile.12862
>>> NOTE: Task failed:
>>>
>> /home/dev/OE/angstrom-dev/work/i686-linux/libsdl-native-1.2.11-r2/temp/log.do_compile.12862
>>
>> these logs should provide the information to find out what's wrong. You
>> should
>> try to provide them through some pastebin if you need help to find out what
>> actually went wrong.
>>
>> Greetings
>>
>> Florian
>>
>> --
>> The dream of yesterday                  Florian Boor
>> is the hope of today                    Tel: +49 271-771091-15
>> and the reality of tomorrow.            Fax: +49 271-771091-19
>> [Robert Hutchings Goddard, 1904]        florian.boor@kernelconcepts.de
>>                                         http://www.kernelconcepts.de/en
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


