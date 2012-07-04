Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1SmRvm-0000UU-16
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Jul 2012 17:55:54 +0200
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 58939D2380; Wed,  4 Jul 2012 17:44:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-144.dynamic.chello.pl
	[87.206.60.144])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id C7B74D232B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2012 17:44:32 +0200 (CEST)
Message-ID: <4FF464DC.8000005@linaro.org>
Date: Wed, 04 Jul 2012 17:44:28 +0200
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120620 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1341416451-20362-1-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1341416451-20362-1-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [PATCH] lighttpd: follow oe-core to 1.4.31
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
X-List-Received-Date: Wed, 04 Jul 2012 15:55:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

W dniu 04.07.2012 17:40, Andreas M=C3=BCller pisze:

> a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
> b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend=20

> inherit systemd

Can we finally get version without systemd? With current state of
meta-oe I can use lighttpd 1.4.31 without systemd but this change will
make it impossible again ;(


