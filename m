Received: from [17.148.16.89] (helo=asmtpout014.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MCqyg-00020d-Pj
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Jun 2009 10:10:11 +0200
MIME-version: 1.0
Received: from [87.201.169.139] by asmtp014.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KKT006N24XEPU60@asmtp014.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	06 Jun 2009 01:00:54 -0700 (PDT)
Message-id: <EE778AE5-9E7A-4138-A500-2466E830C8DA@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <20090606074606.GF4988@denix.org>
Date: Sat, 06 Jun 2009 12:00:46 +0400
References: <046B8D02-FF75-4D9E-BBB9-2D2DF22E37BC@mac.com>
	<20090606074606.GF4988@denix.org>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: Where do the extra #include <mach/board-overo.h> come	from in linux-omap3-2.6.29.bb recipe?
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
X-List-Received-Date: Sat, 06 Jun 2009 08:10:11 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Thanks Denys,
				So shall I just comment out the SRCREV entry? How do I find out  
what the current SRCREV value is, as of today, to lock down on a  
particular SRCREV version?

Best regards,

Elvis

On Jun 6, 2009, at 11:46 AM, Denys Dmytriyenko wrote:

>> aster branch?
>
> The recipe pulls 2.6.29 version (specified by SRCREV), while you are  
> looking
> at the latest source after git clone. Somewhere in between the file  
> was
> removed:
>
> http://git.kernel.org/?p=linux/kernel/git/tmlind/linux-omap-2.6.git;a=commitdiff;h=ed99db8e5c53acced1a7c02aa9a94d50bea48409



