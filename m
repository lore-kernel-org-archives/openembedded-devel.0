Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OHy32-0003TW-6v
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 May 2010 13:48:21 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 83C7A16606FC; Fri, 28 May 2010 05:44:05 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 2AFEB16606CF;
	Fri, 28 May 2010 05:44:05 -0600 (MDT)
Message-ID: <4BFFAC85.9000008@mlbassoc.com>
Date: Fri, 28 May 2010 05:44:05 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100330 Fedora/3.0.4-1.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BFE5402.8030607@mlbassoc.com>
	<loom.20100528T112202-923@post.gmane.org>
In-Reply-To: <loom.20100528T112202-923@post.gmane.org>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: gideon <gideon@dcomt.com>
Subject: Re: Problems building Angstrom images
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
X-List-Received-Date: Fri, 28 May 2010 11:48:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/28/2010 03:40 AM, gideon wrote:
>
> Hi, I get exactly the same error. but building something different
>
>
>
>> To be clear, I'm building
>>     MACHINE="beagleboard"
>>     DISTRO="angstrom-2008.1"
>>
>
>
> MACHINE=x86
> DISTRO=angstrom-2008.1
>
>
>
>> I got these errors when I tried to build:
>>     beagleboard-linuxtag2010-demo-image
>>     angstrom-gnome-image
>>
> for me its
>   angstrom-x-image
>
> had success with console image and base-image
>
> but it seems like problem with gnome,
> so probably all images building with that
> will fail.
>
>
>> I have success with
>>     beagleboard-demo-image
>>
>> Any ideas how to fix this?
>>
>> Thanks
>>
>> n.b. yes, this is a cross post from the Angstrom list, but my
>> query sat there for a day with no reply and I'm hoping for some
>> help from the larger OE crew
>>
>
> You got any help with this yet Gary?
> I just replied here as it was the only
> similar error i could find

I have seen no replies to this problem, sorry.  I *would*
really like to see it fixed.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


