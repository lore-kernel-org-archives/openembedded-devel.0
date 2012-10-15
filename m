Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1TNjE0-0007Ao-Is
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Oct 2012 13:52:48 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 3D2BFD22BC; Mon, 15 Oct 2012 13:39:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2FF52D22B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2012 13:39:10 +0200 (CEST)
Message-ID: <507BF5D6.5070604@linaro.org>
Date: Mon, 15 Oct 2012 13:39:02 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20121003 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1350062247.git.paul.eggleton@linux.intel.com>
	<3713695.RcKMCbUqi3@helios> <507BEAD5.8020302@linaro.org>
	<1973903.D9SRCPrtLZ@helios> <k5grp9$6j5$1@ger.gmane.org>
In-Reply-To: <k5grp9$6j5$1@ger.gmane.org>
Subject: Re: [meta-webserver][PATCH 0/2] modphp fixes
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
X-List-Received-Date: Mon, 15 Oct 2012 11:52:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 15.10.2012 13:24, Koen Kooi pisze:

>>> Your do_configure did that. config.{sub,guess} were too old for
>>> AArch64.
> 
>> If you can make the build succeed without overriding do_configure, then
>> please send patches. I didn't have any success with that the last time I
>> tried it.
> 
> adding a gnu-confiigize --force should be same enough, right?

Yes, it did the trick. Thanks.


