Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JH6br-0005zH-BK
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jan 2008 01:03:23 +0100
Received: from PROMETHEUS (e180136198.adsl.alicedsl.de [85.180.136.198])
	by drlauer-research.com (Postfix) with ESMTP id CC76C584BB8;
	Tue, 22 Jan 2008 01:06:27 +0100 (CET)
Date: Tue, 22 Jan 2008 01:03:25 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1986714322.20080122010325@vanille-media.de>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <942022707.20080122001050@gmail.com>
References: <200801211408.31701.openembedded@haerwu.biz>
	<13810087643.20080121191622@gmail.com>
	<200801212053.17632.openembedded@haerwu.biz>
	<942022707.20080122001050@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Bug 2430 -- TrueType fonts handling and solution for it
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
X-List-Received-Date: Tue, 22 Jan 2008 00:03:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Paul Sokolovsky wrote:
>> I really do not see a problem where you are trying to find one.

>   I'm usually trying to generalize a solution if its worth that IMHO,
> and for OE, a rather large system, having best practices of general
> solutions is worthy aim IMHO. Still, everything is at right time, so
> if you think what I've written above is not relevant to current issue
> at hand, let's skip it.

Paul, I can see what you're up to and I fully agree that such a
solution will be very helpful! In the meantime, lets see how people
implement the font handling and then we have yet another example of
updating entities for different configuration systems which will give
us helpful input for when we are ready to emerge these into a generic
solution.

Regards,

:M:

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



