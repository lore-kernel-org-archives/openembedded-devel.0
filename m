Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JFTQk-00015t-GY
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jan 2008 13:01:10 +0100
Received: from PROMETHEUS (e180142124.adsl.alicedsl.de [85.180.142.124])
	by drlauer-research.com (Postfix) with ESMTP id 6B5E8584BDC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2008 13:03:49 +0100 (CET)
Date: Thu, 17 Jan 2008 13:01:09 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <957341773.20080117130109@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <413710907.20080117131841@gmail.com>
References: <E1JF7vM-0000k1-Mc@linuxtogo.org>
	<413710907.20080117131841@gmail.com>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev apm: turn off wifi cards before suspend so they are fully reloaded upon resume. closes 3664.
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
X-List-Received-Date: Thu, 17 Jan 2008 12:01:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
> How workarounds for specific buggy wifi cards relate to a generic APM
> daemon? Or from other side, why everyone should endure more latency
> during suspend/resume, with that latency already being >1s, because 5%
> or less of those "everyone" use buggy cards?

> Please move this workaround to a packages of the buggy driver, or to a
> separate package which is RDEPEND'ed by buggy driver. See
> bluez-dtl1-workaround_1.0.bb for similar conversion performed.

I agree. The issue to fix is worthwile, but I would prefer seperate
packaging as well.

Regards,

:M:

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



