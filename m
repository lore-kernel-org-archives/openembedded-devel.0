Received: from [204.2.163.5] (helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Shane.Dixon@atmel.com>) id 1Lp4O7-0005v7-P1
	for openembedded-devel@openembedded.org; Wed, 01 Apr 2009 19:38:10 +0200
Received: from csomb01.corp.atmel.com ([10.95.30.150])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id n31HYTOg016687
	for <openembedded-devel@openembedded.org>;
	Wed, 1 Apr 2009 10:34:29 -0700 (PDT)
Received: from 10.95.105.47 ([10.95.105.47]) by csomb01.corp.atmel.com
	([10.95.30.150]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed,  1 Apr 2009 17:35:43 +0000
Received: from homestead.cso.atmel.com by csomb01.corp.atmel.com;
	01 Apr 2009 11:35:43 -0600
From: Shane Dixon <shane.dixon@atmel.com>
To: openembedded-devel@openembedded.org
Organization: Atmel
Date: Wed, 01 Apr 2009 11:35:43 -0600
Message-Id: <1238607343.27167.1.camel@homestead>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 204.2.163.5
X-SA-Exim-Mail-From: Shane.Dixon@atmel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: cmake
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
X-List-Received-Date: Wed, 01 Apr 2009 17:38:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm considering changing my projects over to cmake, but before I do, I
wanted to ask how good the cmake support is in OE.  I saw a recent
proposal to allow out-of-tree builds for cmake, but I'm not sure if that
happened or not.

Can I move forward with changing my projects to cmake and expect that it
will build correctly in OE?

-- 
Shane Dixon
Linux Engineer
Atmel Corporation
E-mail: shane.dixon@atmel.com


