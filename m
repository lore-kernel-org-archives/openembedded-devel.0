Received: from [66.249.92.171] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1JZh2O-00008P-Ms
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 07:35:42 +0100
Received: by ug-out-1314.google.com with SMTP id i24so612529ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 23:33:28 -0700 (PDT)
Received: by 10.66.220.17 with SMTP id s17mr1369107ugg.20.1205390008352;
	Wed, 12 Mar 2008 23:33:28 -0700 (PDT)
Received: by 10.67.25.4 with HTTP; Wed, 12 Mar 2008 23:33:28 -0700 (PDT)
Message-ID: <a7f8874a0803122333y3feeff0bx34805f4b4eb3b0ac@mail.gmail.com>
Date: Wed, 12 Mar 2008 23:33:28 -0700
From: "Hans Henry von Tresckow" <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47D881BF.1090507@whitby.id.au>
MIME-Version: 1.0
References: <200803110807.11368.zecke@selfish.org>
	<1205280598.16531.26.camel@dax.rpnet.com>
	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
	<fr997r$aat$1@ger.gmane.org>
	<c384c5ea0803121326r631bf595v72126de8c7905835@mail.gmail.com>
	<1205358843.4530.22.camel@dax.rpnet.com>
	<47D872D7.4060404@whitby.id.au>
	<1205369994.4530.82.camel@dax.rpnet.com>
	<47D881BF.1090507@whitby.id.au>
X-SA-Exim-Connect-IP: 66.249.92.171
X-SA-Exim-Mail-From: hvontres@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,HTML_MESSAGE,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Thu, 13 Mar 2008 06:35:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Since there seem to be at least two major schools of thought on which SCM to
use, has anybody condiddered some sort of hybrid approach? SSCM (
http://sscm.masukomi.org/) looks like an interesting tool to keep multiple
SCM's happy.

I think that the apparent bias towards git has something to do with the fact
that most people working on embedded hardware need to do a fair share of
kernel hacking.

I do agree that whatever solution we pick needs to allow for easier
branching-merging-backporting then the current mtn repo.

Just some random thoughts by a (for now) read-only OE user.


-- 
Henry von Tresckow (hvontres)

