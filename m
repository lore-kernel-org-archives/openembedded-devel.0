Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NB7US-0004i4-LX
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 14:56:07 +0100
Received: (qmail 4836 invoked by uid 1003); 19 Nov 2009 13:54:39 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 19 Nov 2009 13:54:39 -0000
Message-ID: <4B054E1E.80602@balister.org>
Date: Thu, 19 Nov 2009 08:54:38 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <B44D4D5BF344094DABB900C4E0F6E3533945A36F15@srv02.nortechonline.net>
	<alpine.LFD.2.00.0911190818300.16520@localhost>
In-Reply-To: <alpine.LFD.2.00.0911190818300.16520@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Which distro for OE development?
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
X-List-Received-Date: Thu, 19 Nov 2009 13:56:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/2009 08:19 AM, Robert P. J. Day wrote:
> On Thu, 19 Nov 2009, Hodgson, Simon wrote:
>
>> I'm setting up a new machine with Linux specifically to use for
>> OpenEmbedded development. Which Linux distro should I go with?
>>
>> I'm looking to make it as easy as possible to get started, so
>> ideally all the packages I need will be available from that distro's
>> standard repositry.
>>
>> I've tried SuSE in the past and given up trying to get all of the
>> required tools installed, and more recently been using Debian, but
>> the Python version in Debian is a few versions behind and there was
>> talk of OE soon requiring a more up to date version.
>>
>> Ubuntu is a good candidate at the moment as I belive there won't be
>> any hardware issues with the laptop I want to use, but this wiki
>> page suggests there's some faffing to do
>> http://wiki.openembedded.net/index.php/Gcc_issues_in_Intrepid_and_later
>> which I'd like to avoid if possible - does anyone know if these
>> issues are present in the latest version 9.10?
>
>    despite my occasional(?) shrieks of outrage, fedora has generally
> served me well for OE builds.

You should be fine with the "mainstream" distros since it is likely 
someone on the list is using it and can help you with any issues that 
crop up. As you can see at the moment, the Fedora users are working out 
a potential issue with F12.

Philip


