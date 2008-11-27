Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L5bS1-0000o5-MB
	for openembedded-devel@openembedded.org; Thu, 27 Nov 2008 08:38:13 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L5bP0-0001XU-Sj
	for openembedded-devel@openembedded.org; Thu, 27 Nov 2008 07:35:06 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 27 Nov 2008 07:35:06 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 27 Nov 2008 07:35:06 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 27 Nov 2008 08:34:54 +0100
Message-ID: <ggliiu$3rr$1@ger.gmane.org>
References: <ggjnpc$qhg$1@ger.gmane.org>	<200811261755.53197.mickey@vanille-media.de>	<1227721214.19934.33.camel@mill.internal.reciva.com>	<ggk26f$30a$1@ger.gmane.org>	<1227722637.19934.36.camel@mill.internal.reciva.com>	<ggk56j$dtn$1@ger.gmane.org>	<1227726026.23391.245.camel@lenovo.internal.reciva.com>	<ggkae9$170$1@ger.gmane.org>
	<1227734853.23391.271.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081120 Shredder/3.0b1pre
In-Reply-To: <1227734853.23391.271.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: preferred-provider at the image level a.k.a why is all this fso stuff in my non-fso image
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
X-List-Received-Date: Thu, 27 Nov 2008 07:38:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-11-08 22:27, Phil Blundell wrote:
> On Wed, 2008-11-26 at 21:09 +0100, Koen Kooi wrote:
>> I'd rather have it only Conflict:, but that places extra burden on the
>> fso people.
>
> I must admit to being a bit baffled as to the effect that you (and/or
> the fso people) are trying to produce.  Can you explain a bit more of
> the background to this arrangement of packages?

I'm trying to clean up the 'mess' caused by the fso-packages, you'd have 
to ask Mickey what he actually wanted to achieve with the 
conflicts/replaces/provides dance.

regards,

Koen



