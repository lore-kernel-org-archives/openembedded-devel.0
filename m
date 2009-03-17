Received: from [204.2.163.5] (helo=sjogate2.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Shane.Dixon@atmel.com>) id 1Ljhf5-0007UI-TC
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 23:22:55 +0100
Received: from csomb01.corp.atmel.com ([10.95.30.150])
	by sjogate2.atmel.com (8.13.6/8.13.6) with ESMTP id n2HMJMOp028557
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Mar 2009 15:19:23 -0700 (PDT)
Received: from 10.95.105.47 ([10.95.105.47]) by csomb01.corp.atmel.com
	([10.95.30.150]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 17 Mar 2009 22:20:38 +0000
Received: from homestead.cso.atmel.com by csomb01.corp.atmel.com;
	17 Mar 2009 22:20:38 +0000
From: Shane Dixon <shane.dixon@atmel.com>
To: "openembedded-devel@openembedded.org" <openembedded-devel@openembedded.org>
Organization: Atmel
Date: Tue, 17 Mar 2009 22:20:36 +0000
Message-Id: <1237328436.20770.57.camel@homestead>
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
Subject: Cleaning tmp folder
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
X-List-Received-Date: Tue, 17 Mar 2009 22:23:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've been digging through the bitbake files and I don't see any recipe
for cleaning the tmp folder.  I typically just blow away the entire tmp/
folder and build again, but then I'm spending time rebuilding the native
packages and crosscompiler.

Is there a bitbake recipe for cleaning out all non-native and
non-crosscompiler packages from tmp or am I stuck just starting over
each time?

-- 
Shane Dixon
Linux Engineer
Atmel Corporation
E-mail: shane.dixon@atmel.com


