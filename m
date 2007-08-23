Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mickey@vanille-media.de>)
	id 1IOA2n-0005R7-38; Thu, 23 Aug 2007 12:36:05 +0200
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id 4352E28C013; Thu, 23 Aug 2007 12:32:00 +0200 (CEST)
X-Spam-Flag: YES
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: *****
X-Spam-Status: Yes, score=5.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_NJABL_DUL,RCVD_IN_PBL,RCVD_IN_SORBS_DUL,RCVD_IN_XBL,
	REPTO_OVERQUOTE_THEBAT autolearn=no version=3.1.7-deb
X-Spam-Report: * -2.6 BAYES_00 BODY: Bayesian spam probability is 0 to 1%
	*      [score: 0.0000]
	* 2.0 RCVD_IN_SORBS_DUL RBL: SORBS: sent directly from dynamic IP
	address *      [85.180.189.163 listed in dnsbl.sorbs.net]
	*  3.9 RCVD_IN_XBL RBL: Received via a relay in Spamhaus XBL
	*      [85.180.189.163 listed in zen.spamhaus.org]
	*  1.9 RCVD_IN_NJABL_DUL RBL: NJABL: dialup sender did non-local SMTP
	*      [85.180.189.163 listed in combined.njabl.org]
	*  0.0 RCVD_IN_PBL RBL: Received via a relay in Spamhaus PBL
	*      [85.180.189.163 listed in zen.spamhaus.org]
	*  2.6 REPTO_OVERQUOTE_THEBAT The Bat! doesn't do quoting like this
	* -2.1 AWL AWL: From: address is in the auto white-list
Received: from PROMETHEUS (e180189163.adsl.alicedsl.de [85.180.189.163])
	by srv043.dedi23.de (Postfix) with ESMTP id 794A728C012;
	Thu, 23 Aug 2007 12:31:57 +0200 (CEST)
Date: Thu, 23 Aug 2007 12:34:52 +0200
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.3) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1276313988.20070823123452@vanille-media.de>
To: "hrw commit" <openembedded-commits@lists.openembedded.org>
In-Reply-To: <E1IO8Hq-000267-GV@linuxtogo.org>
References: <E1IO8Hq-000267-GV@linuxtogo.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev python-dbus: make it build on amd64
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
X-List-Received-Date: Thu, 23 Aug 2007 10:36:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

hrw commit wrote:
> python-dbus: make it build on amd64

Thanks, but how is this related to removing python-gobject[-native]?

> #
> # mt diff -rbec79f6189558adada5ebd875b63a2c71daf9d45
> -r38e2cd40a04ac88008e433a43002415c562145e4
> #
> # 
> # 
> # delete "packages/python/python-pygobject-native_2.12.2.bb"
> # 
> # delete "packages/python/python-pygobject_2.12.2.bb"

?

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



