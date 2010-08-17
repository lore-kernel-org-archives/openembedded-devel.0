Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OlSyd-0000WA-E2
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 22:41:45 +0200
Received: (qmail 20330 invoked by uid 1003); 17 Aug 2010 20:41:15 -0000
Received: from adsl-76-201-143-217.dsl.pltn13.sbcglobal.net (HELO
	?192.168.1.148?) (philip@opensdr.com@76.201.143.217)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	17 Aug 2010 20:41:15 -0000
Message-ID: <4C6AF3E5.90502@balister.org>
Date: Tue, 17 Aug 2010 13:41:09 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.7) Gecko/20100720 Fedora/3.1.1-1.fc13 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282072886-11562-1-git-send-email-jkridner@beagleboard.org>	<1282072886-11562-2-git-send-email-jkridner@beagleboard.org>
	<AANLkTik73cayAjmykmJvp8KqsJ_XrBfQTOkM8MJWydsP@mail.gmail.com>
In-Reply-To: <AANLkTik73cayAjmykmJvp8KqsJ_XrBfQTOkM8MJWydsP@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] beagleboard-olddemo-image: saved off	beagleboard-demo-image
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
X-List-Received-Date: Tue, 17 Aug 2010 20:41:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2010 12:54 PM, Frans Meulenbroeks wrote:
> 2010/8/17 Jason Kridner<jkridner@beagleboard.org>:
>> I want to use the name beagleboard-demo-image for what actually ships
>> with the xM boards.

....

>> +inherit image
>> --
>
> What about a better name? E.g. XM-demo-iimage?
>
> And to widen the question: do we want to maintain customer/supplier
> specific images in the oe repo?
> The company I work for also has some images, but for now we opted to
> keep them in a private overlay.

In this case, beagleboard.org points people at oe dev to do builds, so 
it is appropriate to have this image in dev.

I do think they should just edit the existing file, no need to save the 
old one. I suspect that 90% of people using the beagle build images from 
narcissus anyway.

Philip


