Received: from [17.148.16.86] (helo=asmtpout011.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MDGcA-0004Z2-RZ
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jun 2009 13:32:39 +0200
MIME-version: 1.0
Received: from [87.201.169.74] by asmtp011.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKV0044W8YDR760@asmtp011.mac.com> for
	openembedded-devel@lists.openembedded.org; Sun,
	07 Jun 2009 04:23:15 -0700 (PDT)
Message-id: <402ACA05-0C64-4995-B71A-C061A2DD8C4E@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: Phil Blundell <pb@reciva.com>
In-reply-to: <1F1DD9C5-164F-4137-88B5-FD9C7F60BCDC@mac.com>
Date: Sun, 07 Jun 2009 15:22:56 +0400
References: <4E17E8CF-AA3B-4929-BC22-B9B28A757035@mac.com>
	<1244367963.4151.5.camel@lenovo.internal.reciva.com>
	<618E409A-94E7-486B-B6CF-6D2F01FF08B6@mac.com>
	<1244369313.4151.9.camel@lenovo.internal.reciva.com>
	<94920284-2A1B-4EFC-83A0-F445BFDE92B9@mac.com>
	<1244371661.4151.14.camel@lenovo.internal.reciva.com>
	<1F1DD9C5-164F-4137-88B5-FD9C7F60BCDC@mac.com>
X-Mailer: Apple Mail (2.935.3)
Cc: OpenEmbedded Developers <openembedded-devel@lists.openembedded.org>
Subject: Re: linux-omap3_git.bb	doesn't	work	when	copied	to	user.collection
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
X-List-Received-Date: Sun, 07 Jun 2009 11:32:40 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Phil,
		What I did is manually copy the .git folder from a separately clone  
linux-omap-2.6 repository, on the master branch, and the copied the  
entire .git folder to the /usr/share/sources/git/ 
git.kernel.org.pub.scm.linux.kernel.git.tmlind.linux-omap-2.6.git/  
folder.

Now when I run bitbake -c clean linux-omap3 and bitbake -c rebuild  
linux-omap3, it works.

Doesn't this mean that there is some problem or bug with OpenEmbedded?

Best regards,

Elvis




