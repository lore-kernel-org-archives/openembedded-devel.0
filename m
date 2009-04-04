Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LqCxV-0005o0-6i
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Apr 2009 22:59:23 +0200
Received: by bwz19 with SMTP id 19so1370912bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Apr 2009 13:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Zurw41hDVeTWFJe01L6B9gxrCAr+tVig74VB7zOtRwg=;
	b=fcIoRIgDGXDveG8xbYaSmenYjWWI6GxwDrLOyJvJ2BAh7UTn9fzf4IZicPKPT9at9U
	Wfp0DmaQ1IH0lfR7FLfPywCDCWbot3Ofesr7txDTFFGgCMp1kEDNl6TQGq1ZChy1ubzo
	wveERR4MELMxvkyMxfqs7x6nPv4m8KcO1VnPI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YFrQumi0EhVyKHUHN9nQG2B0uheaMdTYGOyLPkX0tQlqHNnox27IWCteJoTMRSKCse
	8TqAcJBM1rfbiAh82UXXwHZYz/u8Wa1oBqhjiR04hGbIC3p7qJXnk+VqvB9ymzGCcJqg
	jqzu7RoPb2g2hlhKuuqcOPDLpMofgfITfyrcQ=
MIME-Version: 1.0
Received: by 10.223.115.12 with SMTP id g12mr2241379faq.92.1238878599364; Sat, 
	04 Apr 2009 13:56:39 -0700 (PDT)
In-Reply-To: <200904041523.29738.mickey@vanille-media.de>
References: <ac9c93b10904030956g2e8a1663g7877947b1a17775c@mail.gmail.com>
	<069B6B31F6201B4389D7EEB9AD827BCA0500604A@otis.burlington.evertz.tv>
	<ac9c93b10904040101p434f67acrd9cc05602b57ec91@mail.gmail.com>
	<200904041523.29738.mickey@vanille-media.de>
Date: Sat, 4 Apr 2009 22:56:39 +0200
Message-ID: <ac9c93b10904041356i59b7a1bel66d2ea022b37bcf5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE] Where is the python-zopeinterface recipe?
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
X-List-Received-Date: Sat, 04 Apr 2009 20:59:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/4/4 Michael 'Mickey' Lauer <mickey@vanille-media.de>:
> On Saturday 04 April 2009 10:01:09 Frans Meulenbroeks wrote:
>> I think what happened is that when zopeinterface was split off the
>> zope recipe, the name got changed. Not sure if that was intentional.
>>
>> Mickey, as I am not a python wiz: should baking zopeinterface result
>> in a python-zopeinterface package or should we change the name in the
>> packages that require zopeinterface (like twisted) ?
>
> We should change the name here.
>
> :M:
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Michael,

I tried, but this is outside my bitbake knowledge.
Can you give it a try?

Thanks, Frans


