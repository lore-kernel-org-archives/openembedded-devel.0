Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UK42W-0007ZQ-GO
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Mar 2013 10:50:07 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 9EDDFD22E8; Mon, 25 Mar 2013 10:33:12 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 9492BD22B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 10:32:42 +0100 (CET)
Message-ID: <515019B5.4040400@linaro.org>
Date: Mon, 25 Mar 2013 10:32:37 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1364203559-24240-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<50528808.YOdRBQeq7Q@helios>
In-Reply-To: <50528808.YOdRBQeq7Q@helios>
X-Enigmail-Version: 1.4.6
Subject: Re: [PATCH] powertop: add 2.3
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
X-List-Received-Date: Mon, 25 Mar 2013 09:50:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 25.03.2013 10:30, Paul Eggleton pisze:
> On Monday 25 March 2013 10:25:59 Marcin Juszkiewicz wrote:
>> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>> ---
>>  meta-oe/recipes-support/powertop/powertop_2.3.bb | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/powertop/powertop_2.3.bb
> 
> powertop is in OE-Core, if you want to update it please update it there.

Thanks, sent.



