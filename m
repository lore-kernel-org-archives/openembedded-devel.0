Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Tl7Gq-0001A3-5N
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Dec 2012 01:12:26 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id BD91BD22E9; Wed, 19 Dec 2012 00:57:43 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id BFDD1D22B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2012 00:57:21 +0100 (CET)
Message-ID: <50D102DD.5090608@linaro.org>
Date: Wed, 19 Dec 2012 00:57:17 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <50D0978D.9090805@gmail.com>
	<1355848700.24487.126.camel@phil-desktop>
	<50D09CB2.1000607@gmail.com>
In-Reply-To: <50D09CB2.1000607@gmail.com>
Subject: Re: oe-core 2.6 kernel support
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
X-List-Received-Date: Wed, 19 Dec 2012 00:12:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 18.12.2012 17:41, Marco pisze:
> Il 18/12/2012 17:38, Phil Blundell ha scritto:
>> On Tue, 2012-12-18 at 17:19 +0100, Marco wrote:
>>> Paul had kindly pointed me to the meta-handheld stuff so I tried oe-core
>>> + meta-handheld and I built:
>>>    akita -> ok (3.2.32-git)
>>>    hx4700 -> ok (3.0.1)
>>>    h3600 -> fails (2.6.29)
>>
>> In what way does it fail?

Check
http://git.linaro.org/gitweb?p=kernel/linaro-aarch64.git;a=commit;h=05e926ae805a4ef80a2c27194303a21c9ddaf5f8
for solution. It's for arm64 but you can adapt it for arm.


