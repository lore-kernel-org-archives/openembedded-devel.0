Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1OgI0X-0005VE-IX
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 15:58:17 +0200
Received: from [192.168.1.9] (business-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id B1486584390
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Aug 2010 16:00:37 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1081)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <1280839602.16235.69.camel@rex>
Date: Tue, 3 Aug 2010 15:58:15 +0200
Message-Id: <6B7F6365-5791-499C-938A-0249A0189569@vanille-media.de>
References: <AANLkTim8npBMFS-5-u+iT6XPUJDkZ+ueqjwc0==WVubd@mail.gmail.com>
	<A6DDF661-1A0C-444D-BA84-9E7116031A3E@vanille-media.de>
	<1280839602.16235.69.camel@rex>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Tue, 03 Aug 2010 13:58:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Am 03.08.2010 um 14:46 schrieb Richard Purdie:

> On Tue, 2010-08-03 at 10:21 +0200, Dr. Michael Lauer wrote:
>> that's pretty cool, however I think we should restrict this list
>> to those recipes which also have a non-native variant.
>> 
>> E.g. the 2nd entry in this list is android-image-utils-native for
>> which a non-native variant makes little sense.
> 
> Just to add, there are some cases where the -native recipe still makes
> sense as the alternative is rather ugly for example, python-native,
> perl-native and a handful of others. The number of these cases is
> extremely small however. BBCLASSEXTEND makes sense in most cases.

Oh right, the recipes for those pesky scripting languages are quite finnicky,
so I would prefer to not change them unless absolutely necessary :)

Cheers,

:M:



