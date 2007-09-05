Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>) id 1IT3fL-0004s0-K9
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2007 00:48:07 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id D874528C013; Thu,  6 Sep 2007 00:42:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
Received: from PROMETHEUS (e180170160.adsl.alicedsl.de [85.180.170.160])
	by srv043.dedi23.de (Postfix) with ESMTP id 612DD28C012
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2007 00:42:09 +0200 (CEST)
Date: Thu, 6 Sep 2007 00:45:35 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1138784998.20070906004535@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20070905211437.GA10460@cimmeria>
References: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
	<1189011486.7849.35.camel@localhost.localdomain>
	<46DEE9E3.4080206@student.utwente.nl>
	<1434447296.20070905205215@vanille-media.de>
	<1189021941.7849.46.camel@localhost.localdomain>
	<20070905211437.GA10460@cimmeria>
MIME-Version: 1.0
Subject: Re: [RFC] How to handle external kernel patches in oe the right way?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2007 22:48:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Graeme Gregory wrote:
> On Wed, Sep 05, 2007 at 08:52:21PM +0100, Richard Purdie wrote:
>> I'm afraid I'm with Mickey here. I don't like the way this "prepatching"
>> works and I think its pretty ugly but I can understand why people are
>> doing it. I'd like to see a better solution but until then what they're
>> doing allows them to develop effectively which is what we're supposed to
>> be about.
>> 
> Maybe if I get some free time around october I might suggest enhancing
> the fetcher/patcher so that any URL can have a

> http://blah.com/patches.gz;patchseries=1
> svn://wibble.com/branchs/smoo/;patchseries=1

I like that a lot.

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



