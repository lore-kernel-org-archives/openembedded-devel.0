Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JKZsl-00078a-1W
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2008 14:55:11 +0100
Received: by ug-out-1314.google.com with SMTP id i24so535166ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2008 05:55:19 -0800 (PST)
Received: by 10.66.243.2 with SMTP id q2mr4118290ugh.14.1201787719136;
	Thu, 31 Jan 2008 05:55:19 -0800 (PST)
Received: from widy.localdomain ( [88.231.86.1])
	by mx.google.com with ESMTPS id 19sm8233791ugl.13.2008.01.31.05.55.17
	(version=SSLv3 cipher=OTHER); Thu, 31 Jan 2008 05:55:18 -0800 (PST)
Date: Thu, 31 Jan 2008 16:07:50 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080131160750.7601fa5d@widy.localdomain>
In-Reply-To: <fnqakr$ffa$1@ger.gmane.org>
References: <fnqakr$ffa$1@ger.gmane.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: RFC: aggressive usurpation of bugs.oe.net by Angstrom
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
X-List-Received-Date: Thu, 31 Jan 2008 13:55:11 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

I've renamed several meta-bugs to include "Angstrom 2007.12" so it was
clear that they apply to specific release only. As for machine
meta-bugs, ideally each distro (and release) would have their own, with
actual machine bugs attached to those as applicable. As that's not
going to work (machine mentors who should take care of that imho, and
we don't have signs of them to be too active), one solution could be to
remove distro-specific designators from meta-bug names, and treat them
as common machine-specific bugs, and put distro version(s) into subject
for those bugs which apply only to specific release (for those
distros/releases which use bugtracker for the list of known issues, so
must be user-friendly).

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


