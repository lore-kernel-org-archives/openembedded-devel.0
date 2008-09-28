Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1KjyxQ-0000lY-U4
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Sep 2008 18:17:16 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 522B28400A2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2008 18:13:22 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4FECF8400A0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2008 18:13:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_05
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e178072171.adsl.alicedsl.de
	[85.178.72.171]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Sep 2008 18:13:21 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id C4D373C1D9; Sun, 28 Sep 2008 18:13:20 +0200 (CEST)
Date: Sun, 28 Sep 2008 18:13:20 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080928161320.GA5665@rhein.zuhause.netz>
References: <87abdtcpvp.fsf@neumann.lab.ossystems.com.br>
	<gbo38l$9sr$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gbo38l$9sr$1@ger.gmane.org>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: fennec fails to build when host system lacks autoconf2.13
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
X-List-Received-Date: Sun, 28 Sep 2008 16:17:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 28, 2008 at 04:10:29PM +0200, Koen Kooi wrote:
> On 27-09-2008 22:09, Otavio Salvador wrote:
>> Hello,
>>
>> It takes a while until I found the reason fennec was failing to build;
>> it needs autoconf2.13 but OE doesn't has it anymore.
>>
>> Does someone feels like fixing it?
>
> I've asked the mozilla people to fix their crappy autotools code, but  
> they say that the mozilla code isn't buggy, but that all autoconf >2.13  
> versions are buggy.....

Args,

I looked at this autotools abuse too and this is really crap. Seems
no easy fixing for us.


Bye Henning


