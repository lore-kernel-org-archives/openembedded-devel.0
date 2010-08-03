Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OgGtc-0006vm-M7
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 14:47:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o73Ckx5c008636
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Aug 2010 13:46:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04809-07 for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Aug 2010 13:46:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o73CkrhF008622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Aug 2010 13:46:53 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <A6DDF661-1A0C-444D-BA84-9E7116031A3E@vanille-media.de>
References: <AANLkTim8npBMFS-5-u+iT6XPUJDkZ+ueqjwc0==WVubd@mail.gmail.com>
	<A6DDF661-1A0C-444D-BA84-9E7116031A3E@vanille-media.de>
Date: Tue, 03 Aug 2010 13:46:42 +0100
Message-ID: <1280839602.16235.69.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: CALL FOR ACTION: get rid of native recipes
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
X-List-Received-Date: Tue, 03 Aug 2010 12:47:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-08-03 at 10:21 +0200, Dr. Michael Lauer wrote:
> that's pretty cool, however I think we should restrict this list
> to those recipes which also have a non-native variant.
> 
> E.g. the 2nd entry in this list is android-image-utils-native for
> which a non-native variant makes little sense.

Just to add, there are some cases where the -native recipe still makes
sense as the alternative is rather ugly for example, python-native,
perl-native and a handful of others. The number of these cases is
extremely small however. BBCLASSEXTEND makes sense in most cases.

Cheers,

Richard



