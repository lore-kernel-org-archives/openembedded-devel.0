Return-Path: <olof.johansson@axis.com>
Received: from ra.se.axis.com (ra.se.axis.com [195.60.68.13])
	by mail.openembedded.org (Postfix) with ESMTP id 848E46C05F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 16:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by ra.se.axis.com (Postfix) with ESMTP id F27C8349611
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 18:01:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ra.se.axis.com
Received: from ra.se.axis.com ([127.0.0.1])
	by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id u+ZKYPoZ2Gvk
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 18:01:03 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by ra.se.axis.com (Postfix) with ESMTP id 8C37834960E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 18:01:03 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 6B504760
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 18:01:03 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 5FCD2750
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 18:01:03 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 5E3593404E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 18:01:03 +0200 (CEST)
Received: from axis.com (10.92.17.1) by xmail2.se.axis.com (10.0.5.74) with
	Microsoft SMTP Server (TLS) id 8.2.255.0; Tue, 3 Sep 2013 18:01:03 +0200
Date: Tue, 3 Sep 2013 18:01:01 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20130903160101.GG12638@axis.com>
References: <1378219473-12551-1-git-send-email-erp@movis.dk>
	<20130903150925.GC12638@axis.com>
MIME-Version: 1.0
In-Reply-To: <20130903150925.GC12638@axis.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] libtest-harness-perl: added
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2013 16:01:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 13-09-03 17:09 +0200, Olof Johansson wrote:
> Awesome, thanks for your efforts.
> 
> 
> On 13-09-03 16:44 +0200, Emil Petersen wrote:
> > +LICENSE = "GPLv1+"
> 
> This is actually artistic or GPLv1, just like in the other
> recipes you posted.
> 
> LICENSE = "Artistic-1.0 | GPL-1.0+"
> 
> From Test::Harness POD:
> > This module is free software; you can redistribute it and/or
> > modify it under the same terms as Perl itself. See perlartistic.


This is a core module as well come to think of it. Very core :).

-- 
olofjn

