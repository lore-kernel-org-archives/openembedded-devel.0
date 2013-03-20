Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UIFz4-0003Uj-2U
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 11:11:27 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id A044ED22E8; Wed, 20 Mar 2013 10:54:15 +0100 (CET)
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
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6E3E9D20D2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2013 10:53:54 +0100 (CET)
Message-ID: <5149872D.7090803@linaro.org>
Date: Wed, 20 Mar 2013 10:53:49 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1363769468-20321-1-git-send-email-raj.khem@gmail.com>
	<51497DC8.5090006@linaro.org>
	<CAGiJk9ejLAdb3LWpTDpbVaPaDMsGNsX26yB3gHOExA46XW5L1g@mail.gmail.com>
In-Reply-To: <CAGiJk9ejLAdb3LWpTDpbVaPaDMsGNsX26yB3gHOExA46XW5L1g@mail.gmail.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [meta-kde][PATCH] cyrus-sasl: Make pkg_postinst/rm package specfic
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
X-List-Received-Date: Wed, 20 Mar 2013 10:11:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 20.03.2013 10:32, Samuel Stirtzel pisze:
> 2013/3/20 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>:
>> W dniu 20.03.2013 09:51, Khem Raj pisze:
>>> ERROR: QA Issue:
>>> /b/kraj/angstrom/sources/meta-kde/recipes-misc-support/cyrus-sasl_2.1.19.bb:
>>> Variable pkg_postinst is set as not being package specific, please fix
>>> this.
>>
>> meta-openembedded has 2.1.26 in meta-networking so meta-kde copy should
>> be removed.
>>
> 
> Hi, it seems there are some differences in the recipes, maybe we can
> work through them.
> 
> Is BDB 5 working correctly with this version, without the patch [1]?

It built properly against db 5.3.21 - support was added upsteam.



