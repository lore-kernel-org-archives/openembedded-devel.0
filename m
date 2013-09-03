Return-Path: <olof.johansson@axis.com>
Received: from anubis.se.axis.com (anubis.se.axis.com [195.60.68.12])
	by mail.openembedded.org (Postfix) with ESMTP id DEECA6C018
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 15:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by anubis.se.axis.com (Postfix) with ESMTP id 9B04D19D74
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:09:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at anubis.se.axis.com
Received: from anubis.se.axis.com ([127.0.0.1])
	by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iV4twXBiPWVi
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:09:36 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by anubis.se.axis.com (Postfix) with ESMTP id 6DB6319D0F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:09:27 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 50F955A7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:09:27 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 4610846D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:09:27 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by seth.se.axis.com (Postfix) with ESMTP id 444203E06F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:09:27 +0200 (CEST)
Received: from axis.com (10.92.17.1) by xmail2.se.axis.com (10.0.5.74) with
	Microsoft SMTP Server (TLS) id 8.2.255.0; Tue, 3 Sep 2013 17:09:27 +0200
Date: Tue, 3 Sep 2013 17:09:25 +0200
From: Olof Johansson <olof.johansson@axis.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20130903150925.GC12638@axis.com>
References: <1378219473-12551-1-git-send-email-erp@movis.dk>
MIME-Version: 1.0
In-Reply-To: <1378219473-12551-1-git-send-email-erp@movis.dk>
Thread-Topic: [oe] [PATCH] libtest-harness-perl: added
Accept-Language: en-US, sv-SE
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
X-List-Received-Date: Tue, 03 Sep 2013 15:09:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Language: en-US

Awesome, thanks for your efforts.


On 13-09-03 16:44 +0200, Emil Petersen wrote:
> +LICENSE = "GPLv1+"

This is actually artistic or GPLv1, just like in the other
recipes you posted.

LICENSE = "Artistic-1.0 | GPL-1.0+"

From Test::Harness POD:
> This module is free software; you can redistribute it and/or
> modify it under the same terms as Perl itself. See perlartistic.

Regards,
-- 
olofjn

