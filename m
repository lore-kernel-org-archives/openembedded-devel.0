Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1P6gSI-0007UO-8n
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 11:20:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id A5C83A5193
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 10:19:30 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id X+H63HJSx7Zt
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 10:19:30 +0100 (BST)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 13293A518F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 10:19:30 +0100 (BST)
Message-ID: <4CB81CA3.9080601@xora.org.uk>
Date: Fri, 15 Oct 2010 10:19:31 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201010151039.08619.marcin@juszkiewicz.com.pl>
In-Reply-To: <201010151039.08619.marcin@juszkiewicz.com.pl>
X-Enigmail-Version: 1.1.1
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: remove old kernels
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
X-List-Received-Date: Fri, 15 Oct 2010 09:20:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 On 15/10/2010 09:39, Marcin Juszkiewicz wrote:
> Hi
>
> recipes/linux/ contains 235 recipes. I would like to propose cleaning:
>
This may be again time to discuss something I have proposed before at OEDEM.

Splitting machines out into seperate git trees, with Chris' awesome work
on collections this is no longer hard to maintain. But will mean the
main OE repo is free of unmaintained machines. Maintained ones will be
obvious by the activity on their git (which doesnt even neccessarilly
need to be hosted by OE)

Graeme



