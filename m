Received: from [68.230.240.8] (helo=eastrmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <loudawgucr@gmail.com>) id 1K16dS-00041v-4g
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 May 2008 23:23:10 +0200
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20080527211941.FZXW26184.eastrmmtao102.cox.net@eastrmimpo01.cox.net>
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 May 2008 17:19:41 -0400
Received: from veronica.jetheaddev.com ([70.164.99.62])
	by eastrmimpo01.cox.net with bizsmtp
	id WlKg1Z00W1Llurq02lKgql; Tue, 27 May 2008 17:19:41 -0400
Received: from veronica.jetheaddev.com ([192.168.13.7]
	helo=veronica.jetheaddev.com)
	by mail.jetheaddev.com; 27 May 2008 14:19:40 -0700
Received: from lou-jethead.jetheaddev.com ([192.168.13.87]) by
	veronica.jetheaddev.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 27 May 2008 14:19:40 -0700
From: Louie Ilievski <loudawgucr@gmail.com>
To: Openembedded-devel@lists.openembedded.org
Date: Tue, 27 May 2008 14:20:02 -0700
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200805271420.02174.loudawgucr@gmail.com>
X-OriginalArrivalTime: 27 May 2008 21:19:40.0531 (UTC)
	FILETIME=[5FF34430:01C8C03F]
Subject: Kernel not booting
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
X-List-Received-Date: Tue, 27 May 2008 21:23:10 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

All,

I have successfully built x11-gpe-image and console-image for my Dell Axim 
x51v with the following:

DISTRO = "angstrom.2008.1"
MACHINE = "aximx50v"
ANGSTROM_MODE = "uclibc"

When trying to boot this with Haret, the last message I see is "Jumping to 
kernel" and then it sits there until I reset the device.  I don't know where 
to go from here to find out what is wrong with the kernel.

Where do I go from here?

Thanks,

~Lou


