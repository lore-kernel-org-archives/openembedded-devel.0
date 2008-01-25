Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JIDiJ-0000Tt-VO
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2008 02:50:40 +0100
Received: from PROMETHEUS (e180134175.adsl.alicedsl.de [85.180.134.175])
	by drlauer-research.com (Postfix) with ESMTP id F359C584BBC;
	Fri, 25 Jan 2008 02:54:00 +0100 (CET)
Date: Fri, 25 Jan 2008 02:50:43 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1071844182.20080125025043@vanille-media.de>
To: "Neha agarwal" <neha.agarwal@aegismobility.com>
In-Reply-To: <005501c85eee$578dfe50$e10b10ac@nagarwaldt>
References: <47992AD2.7040805@kernelconcepts.de>
	<005501c85eee$578dfe50$e10b10ac@nagarwaldt>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: task-base image issue!
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
X-List-Received-Date: Fri, 25 Jan 2008 01:50:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Neha agarwal wrote:
> Hi,
> I am trying to create an image to make my diskless Xeon linux intel blade
> become standalone.
> I am running a "bitbake task-base"

Only some recipes in OpenEmbedded generate images. Please see files
among the packages/images/ directory.

> Also how do I use the image generated to boot my diskless system so that it
> becomes standalone? Using tftp?DHCP?

That's up to your board, but your BIOS should support something like
tftp or netboot.

Regards,

:M:

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



