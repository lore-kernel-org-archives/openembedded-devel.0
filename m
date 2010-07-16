Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OZjIf-0004bv-Hj
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 13:41:54 +0200
Received: (qmail 19429 invoked by uid 1003); 16 Jul 2010 11:41:47 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 16 Jul 2010 11:41:47 -0000
Message-ID: <4C40457A.9070005@balister.org>
Date: Fri, 16 Jul 2010 07:41:46 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikabrLWPM53wvdCKrDSKRJdFQTdNsA2MnfwzrI0@mail.gmail.com>	<4C403F02.8080606@balister.org>
	<AANLkTinyrz_-sC3VCRIj-O5bQoFjx-YJpa3vu7hR0uLx@mail.gmail.com>
In-Reply-To: <AANLkTinyrz_-sC3VCRIj-O5bQoFjx-YJpa3vu7hR0uLx@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: u-boot-utils badness
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
X-List-Received-Date: Fri, 16 Jul 2010 11:41:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 07/16/2010 07:33 AM, Frans Meulenbroeks wrote:
> 2010/7/16 Philip Balister<philip@balister.org>
>
>> On 07/15/2010 02:41 AM, Frans Meulenbroeks wrote:
>>
>>
>>
> As you wish :-)
>
> Note that u-boot-tools not only provides mkimage but also things like fw_env
> Also, to further mess up things: we also have u-boot-mkimage_1.3.2.bb
> There seems to be room for some quality improvement.
> Oh well....

It might be worth consolidating these two recipes. But you'll need to 
figure out why they both exist.

Philip


