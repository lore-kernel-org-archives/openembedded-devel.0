Received: from p3plsmtpa01-04.prod.phx3.secureserver.net ([72.167.82.84])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <mike@mwester.net>) id 1Q7Eq1-0008Sn-Q4
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 00:35:07 +0200
Received: (qmail 21946 invoked from network); 5 Apr 2011 22:32:58 -0000
Received: from unknown (209.242.7.132)
	by p3plsmtpa01-04.prod.phx3.secureserver.net (72.167.82.84) with ESMTP;
	05 Apr 2011 22:32:58 -0000
Message-ID: <4D9B989D.5060703@mwester.net>
Date: Tue, 05 Apr 2011 17:33:01 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1300981024-9111-2-git-send-email-obi@opendreambox.org>	<1300983264-16652-1-git-send-email-obi@opendreambox.org>	<4D99C0EA.5070902@opendreambox.org>	<inciqg$3vi$2@dough.gmane.org>	<4D99E05E.9020100@opendreambox.org>	<ind0l0$io$1@dough.gmane.org>	<4D9A0A1D.3020209@opendreambox.org>	<inecec$sae$2@dough.gmane.org>	<4D9ADC0D.6060603@opendreambox.org>
	<inen1t$mgv$1@dough.gmane.org>
	<1301995968.14449.293.camel@phil-desktop>
In-Reply-To: <1301995968.14449.293.camel@phil-desktop>
Subject: Re: [PATCHv2] kernel/module-base: Append PR to MACHINE_KERNEL_PR
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
X-List-Received-Date: Tue, 05 Apr 2011 22:35:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 4/5/2011 4:32 AM, Phil Blundell wrote:
> On Tue, 2011-04-05 at 11:23 +0200, Koen Kooi wrote:
>> On 05-04-11 11:08, Andreas Oberritter wrote:
>>> Thereby making MACHINE_KERNEL_PR mandatory for all machines?
>>
>> I don't see why not.
> 
> The majority of machines aren't using it at present so this would be an
> unexpected (and presumably unwelcome) change for them.  That seems like
> a bad idea unless there is a compelling reason why it needs to be done.

Quite frankly, I recall when this was originally discussed, and I really
didn't understand the use case for it -- if it makes sense to use it for
SlugOS, I'd be happy to do so.

On a somewhat tangential note, I am responsible for a *distro*, but I'm
not sure that I'm responsible for any *machines* -- so perhaps this is
not my decision to make WRT to SlugOS?  Am I missing something?

-Mike (mwester)


