Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N2X7E-0004m4-7d
	for openembedded-devel@openembedded.org; Mon, 26 Oct 2009 22:28:40 +0100
Received: (qmail 6101 invoked by uid 1003); 26 Oct 2009 21:27:30 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 26 Oct 2009 21:27:30 -0000
Message-ID: <4AE61441.40705@balister.org>
Date: Mon, 26 Oct 2009 17:27:29 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1255966150-1854-1-git-send-email-marcin@juszkiewicz.com.pl>	<200910192018.29300.marcin@juszkiewicz.com.pl>	<200910211420.34763.marcin@juszkiewicz.com.pl>	<200910262135.55313.marcin@juszkiewicz.com.pl>
	<hc526h$1q9$1@ger.gmane.org>
In-Reply-To: <hc526h$1q9$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Updating kernels to latest stable versions
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
X-List-Received-Date: Mon, 26 Oct 2009 21:28:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/26/2009 04:52 PM, Koen Kooi wrote:
> On 26-10-09 21:35, Marcin Juszkiewicz wrote:
>> Dnia środa, 21 października 2009 o 14:20:33 Marcin Juszkiewicz napisał(a
>>
>>> I did a check for applying all patches for those machines (they alter
>>> SRC_URI):
>>>
>>> 2.6.18 - at91sam9263ek
>>> 2.6.19 - at91sam9263ek
>>> 2.6.20 - n2100, at91sam9263ek
>>> 2.6.21 - simpad, kb9202, at91sam9263ek, sarge-at91, gumstix-verdex
>>> (FAIL),
>>> gumstix-connex (FAIL)
>>> 2.6.22 - cm-x270, bd-neon
>>> 2.6.23 - em-x270, cm-x270, mpc8313e-rdb, mpc8323e-rdb
>>> 2.6.24 - simpad, gesbc-9302, mpc8313e-rdb, cm-x270, ts72xx (FAIL), oxnas
>>> (FAIL), hipox (FAIL)
>>> 2.6.25 - mpc8313e-rdb, cm-x270, at32stk1000 (FAIL on
>>> fetching), at91-l9260, m8050
>>> 2.6.26 - boc01, mpc8313e-rdb, topas910
>>> 2.6.27 - boc01, progear, simpad
>>> 2.6.28 - at91sam9263ek, ronetix-pm9263, stb225, collie, tosa, gamecube,
>>> tx27 FAIL
>>> 2.6.29 - boc01, canyonlands, micro2440 FAIL, tosa, ep93xx,
>>> cm-x270, stamp9g20evb
>>> 2.6.30 - mpc8315e-rdb, at91sam9263ek
>>> 2.6.31 - boc01, ep93xx
>>>
>>> So this changeset breaks few devices at patch level:
>>> gumstix-verdex/connex in 2.6.21, ts72xx/oxnas/hipox in 2.6.24,
>>> tx27 in 2.6.28 and micro2440 in 2.6.29.
>>>
>>> at32stk1000 patch was not available for fetching.
>>
>> Did someone who maintain any of failed devices took a look at it?
>
> Somewhere on my TODO is to update the pxa gumstix to 2.6.3x, but it's "a
> few weeks away" down.

There is also some traffic on the gmustix list about this happening.

Philip


