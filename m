Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1OsrmI-0003UJ-2m
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 08:35:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 0D41BA6014
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Sep 2010 07:34:55 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id cfZMvNDFwrB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Sep 2010 07:34:54 +0100 (BST)
Received: from [192.168.1.119] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id E6647A6013
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Sep 2010 07:34:48 +0100 (BST)
Message-ID: <4C85DC92.2070002@xora.org.uk>
Date: Tue, 07 Sep 2010 07:32:50 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.7) Gecko/20100720 Lightning/1.0b2 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283775540-13164-1-git-send-email-noor_ahsan@mentor.com>	<AANLkTimjZwZ9TCLcWz3ZRQ2pGYj_nb=kE-qYtVW5uSBg@mail.gmail.com>
	<AANLkTimxy+r7_Wgaq1SvmWHBPRuvZ+Wtvn1Ctm=maaGb@mail.gmail.com>
In-Reply-To: <AANLkTimxy+r7_Wgaq1SvmWHBPRuvZ+Wtvn1Ctm=maaGb@mail.gmail.com>
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libsdl-native: Convert to new style staging, remove do_stage
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
X-List-Received-Date: Tue, 07 Sep 2010 06:35:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 On 07/09/10 07:32, Frans Meulenbroeks wrote:
> 2010/9/7 Graham Gower <graham.gower@gmail.com>:
>> On 6 September 2010 21:49, Noor Ahsan <noor_ahsan@mentor.com> wrote:
>>> * Remove do_stage ()
>>> * Replace tabs with 8 spaces in do_configure
>> I see that spaces and not tabs are the OE policy, but I can't lay my
>> eyes on anything that says how many spaces are preferred. I see a lot
>> of recipes and examples using 4 space indentation (and most others use
>> a tab). Is this something that people care about?
>>
>> -Graham
>>
>> PS: Personally I'm a tab man, not a spaceman.
> Afaik it is not defined.
> There is http://wiki.openembedded.net/index.php/Styleguide
> which only says "#
> # Use spaces for indentation as developers tends to use different
> amount of spaces per one tab. "
> now we're just using a different amount of spaces :-)
>
> (actually using different # of spaces for a tab is not that bad as
> long as you stick to tabs only. That is why the linux kernel requires
> indentig by tabs).
>
> Frans (who also likes tabs, if only because it is the default in vi
> with autoindent (and yeah, I know you can change that))
>
Informally the policy has always been we dont care tabs or spaces as
long as its consistent within the same recipe.

Graeme



