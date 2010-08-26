Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OolHo-0004Km-8O
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 00:51:11 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 1E67F1660935; Thu, 26 Aug 2010 14:23:29 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id B94B4166092F;
	Thu, 26 Aug 2010 14:23:08 -0600 (MDT)
Message-ID: <4C76CD2C.2090102@mlbassoc.com>
Date: Thu, 26 Aug 2010 14:23:08 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: Cliff Brake <cliff.brake@gmail.com>
References: <AANLkTim6-d4krhcMuAZojQVNdy3W-m_ON-mOvK5y3tqn@mail.gmail.com>	<4C76C597.9050302@mlbassoc.com>
	<AANLkTinnnfOCw3m_q6_d27o9Luyw4dWS-uVhJzYUTTbZ@mail.gmail.com>
In-Reply-To: <AANLkTinnnfOCw3m_q6_d27o9Luyw4dWS-uVhJzYUTTbZ@mail.gmail.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2010-08-23
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
X-List-Received-Date: Thu, 26 Aug 2010 22:51:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/26/2010 02:10 PM, Cliff Brake wrote:
> On Thu, Aug 26, 2010 at 3:50 PM, Gary Thomas<gary@mlbassoc.com>  wrote:
>> On 08/23/2010 05:49 PM, Cliff Brake wrote:
>>>
>>> Hello,
>>>
>>> As detailed in the following page, we are trying to get a testing
>>> branch going where we try to verify OE builds for a number of
>>> combinations of distro/machine/target/
>>>
>>> http://wiki.openembedded.net/index.php/Testing
>>>
>>> I have branched dev.oe.org to the testing-testing branch, and have
>>> verified it builds the following.
>>>
>>> beagleboard     angstrom-2008.1
>>> beagleboard-linuxtag2010-demo-image
>>>         Ubuntu 10.04 64-bit     User:Cbrake
>>> beagleboard     angstrom-2008.1         console-image   Ubuntu 10.04
>>> 64-bit     User:Cbrake
>>
>> To be clear, a line with an entry in the 'last tested' column indicates a
>> successful build of that combination?
>
> Yes, that is my current idea.  I changed the name of the column to
> "last successful build" to be a little more clear.

OK, I've added a couple of builds I'm trying.  It's interesting to
note that all the other builds are using 64-bit hosts and I've had
0% luck with that myself :-(

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


