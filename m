Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OvqiD-0008Uf-HQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 14:03:42 +0200
Received: (qmail 27589 invoked by uid 1003); 15 Sep 2010 12:02:47 -0000
Received: from pool-96-240-180-126.ronkva.east.verizon.net (HELO
	?192.168.1.167?) (philip@opensdr.com@96.240.180.126)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	15 Sep 2010 12:02:47 -0000
Message-ID: <4C90B5E6.1070402@balister.org>
Date: Wed, 15 Sep 2010 08:02:46 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.9) Gecko/20100907 Fedora/3.1.3-1.fc13 Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C90130C.3040303@gmail.com>
	<AANLkTi=ZF3uT1Y6=yy_+wAizh64KYv0nRjq9BoFZN6E2@mail.gmail.com>
In-Reply-To: <AANLkTi=ZF3uT1Y6=yy_+wAizh64KYv0nRjq9BoFZN6E2@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] p4: remove broken and 4 years old recipes.
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
X-List-Received-Date: Wed, 15 Sep 2010 12:03:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/15/2010 02:32 AM, Frans Meulenbroeks wrote:
> 2010/9/15 Graham Gower<graham.gower@gmail.com>:
>> Recipes are broken for all architectures except one (probably arm)
>> because the files in the SRC_URI depend on TARGET_ARCH and the md5/sha256
>> are presumably valid only for one of these.
>>
>> Anyone wanting perforce should submit new recipes for new perforce versions.
>>
>> Signed-off-by: Graham Gower<graham.gower@gmail.com>
>
> Agree with the reasoning of Graham, so:
>
> Acked-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
>
> Actually I am not too keen on having recipes that just "install" an
> externally downloaded binary blob
> (and functionally speaking this does not seem to be something for an
> embedded system either)

I will have a need for a recipe to install binary blobs (fpga bin files) 
into a file system at some point. So this class recipes are needed.

Philip


