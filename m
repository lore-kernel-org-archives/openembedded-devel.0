Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PIjn2-00038H-CB
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 16:19:17 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PIjlw-0003NB-Rj from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 07:18:08 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 17 Nov 2010 07:18:08 -0800
Received: from [172.30.7.13] ([172.30.7.13]) by na2-mail.mgc.mentorg.com with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 17 Nov 2010 08:18:07 -0700
Message-ID: <4CE3F22C.8000104@mentor.com>
Date: Wed, 17 Nov 2010 08:18:04 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=qSnufgxxDHZ+VW6mZED1LFXBduX81HA-kBZEu@mail.gmail.com>
	<1290006345-22363-1-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1290006345-22363-1-git-send-email-rep.dot.nop@gmail.com>
X-OriginalArrivalTime: 17 Nov 2010 15:18:07.0982 (UTC)
	FILETIME=[A39CF8E0:01CB866A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Author: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
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
X-List-Received-Date: Wed, 17 Nov 2010 15:19:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2010 08:05 AM, Bernhard Reutner-Fischer wrote:
>
>      bitbake.conf: add ext4 image support

Looks like e2fsprogs needs to be more careful about moving stuff for 
update-alternatives.  Mind fixing that and doing this as a 2 parter?

-- 
Tom Rini
Mentor Graphics Corporation


