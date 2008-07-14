Received: from [216.239.128.26] (helo=smtp.omnis.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@e4net.com>) id 1KIBVr-0008B7-OU
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jul 2008 02:01:55 +0200
Received: from smtp-a.omnis.com (smtp-a.omnis.com [216.239.128.237])
	by smtp.omnis.com (Postfix) with ESMTP id C4082565A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jul 2008 17:01:26 -0700 (PDT)
Received: from [192.168.3.4] (99-139-75-113.lightspeed.snjsca.sbcglobal.net
	[99.139.75.113]) (Authenticated sender: jmorris%e4net.com)
	by smtp-a.omnis.com (Postfix) with ESMTP id 72490400851
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jul 2008 17:01:26 -0700 (PDT)
Message-ID: <487A9756.9090500@e4net.com>
Date: Sun, 13 Jul 2008 17:01:26 -0700
From: Jim Morris <ml@e4net.com>
User-Agent: Thunderbird 2.0.0.14 (X11/20080421)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Is Ruby being maintained by anyone?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 14 Jul 2008 00:01:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The current version of ruby in OE appears to be 1.8.5 which is pretty old, and it does not have the 
socket or thread libraries installed which are pretty much standard and are required by various 
useful libraries like dbus.

Is anyone maintaining or working on updating this package?

If not I'm willing to have a crack at getting the stable release of ruby (1.8.6P111) working and 
also work on the socket and thread libs.

Anyone who may have started this and abandoned the project, if you have any patches lying around it 
would help.

Thanks
Jim

-- 
Jim Morris, http://blog.wolfman.com


