Received: from [62.70.27.150] (helo=hoat.troll.no)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tcooksey@trolltech.com>) id 1Jeq6p-0004He-25
	for openembedded-devel@openembedded.org; Thu, 27 Mar 2008 12:17:27 +0100
Received: from hoat.troll.no (tedur.troll.no [62.70.27.154])
	by hoat.troll.no (Postfix) with SMTP id 744D220A1C
	for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 12:17:25 +0100 (CET)
Received: from sx01.troll.no (sx01.troll.no [62.70.27.21])
	by hoat.troll.no (Postfix) with ESMTP id 647522028C
	for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 12:17:25 +0100 (CET)
Received: from sx01.troll.no (localhost.localdomain [127.0.0.1])
	by sx01.troll.no (8.13.8/8.13.8) with ESMTP id m2RBHOoY018199
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2008 12:17:24 +0100
Received: from tomdev.troll.no (tomdev.troll.no [10.3.5.39])
	by sx01.troll.no (Scalix SMTP Relay 11.3.0.11339)
	via ESMTP; Thu, 27 Mar 2008 12:17:24 +0100 (CET)
Date: Thu, 27 Mar 2008 12:17:41 +0100
From: Tom Cooksey <thomas.cooksey@trolltech.com>
To: openembedded-devel@openembedded.org
Message-ID: <200803271217.41967.thomas.cooksey@trolltech.com>
x-scalix-Hops: 1
Organization: Trolltech
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Subject: LEAD_SONAME?
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
X-List-Received-Date: Thu, 27 Mar 2008 11:17:27 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Disposition: inline

I get a warning saying:

NOTE: Multiple libraries (...) found and LEAD_SONAME not defined

The only documentation I can find is on:

http://www.openembedded.org/user-manual&dpage=recipes_misc

in a section described as: "This section is to be completed."


The other recipies which use it don't have any comments indicating
what it does or how it should be used? I also can't find anything in 
the archives. I'm guessing it's got something to do with automatic 
dependency tracking? Do I just list the shared libraries my package 
provides? If so, which version? The .so, .so.major, .so.major.minor or 
the complete .so.major.minor.patch?


Cheers,

Tom


