Received: from [17.148.16.93] (helo=asmtpout018.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MKPQ2-0004sI-H0
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Jun 2009 06:21:38 +0200
MIME-version: 1.0
Received: from [87.201.169.54] by asmtp018.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLV00KZIQ8Q6V10@asmtp018.mac.com> for
	openembedded-devel@lists.openembedded.org; Fri,
	26 Jun 2009 21:10:09 -0700 (PDT)
Message-id: <385B45B4-00BE-45E6-BDD1-81EE7DBF7B83@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1246037427.8887.73.camel@lenovo.internal.reciva.com>
Date: Sat, 27 Jun 2009 08:09:41 +0400
References: <7D58AE12-9642-4B1C-97F4-075F1E7447D3@mac.com>
	<1246037427.8887.73.camel@lenovo.internal.reciva.com>
X-Mailer: Apple Mail (2.935.3)
Subject: Re: Incorrect PR number appended to /tmp/work/ recipe folder
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
X-List-Received-Date: Sat, 27 Jun 2009 04:21:38 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Phil,
		I took a look at those threads, but was unclear about the  
resolution. I did a git pull of the oe repository to update it with  
the latest changes, also deleted my entire tmp folder and built the  
recipe again, but same problem persists.

Why would it pick r37 of all the PV series for that particular  
recipe? :-)

Elvis


On Jun 26, 2009, at 9:30 PM, Phil Blundell wrote:

> On Fri, 2009-06-26 at 20:08 +0400, Elvis Dowson wrote:
>> NOTE: Unpacking /usr/share/sources/
>> git_git.kernel.org.pub.scm.linux.kernel.git.tmlind.linux-
>> omap-2.6.git_90e758af52ba803cba233fabee81176d99589f09.tar.gz to tmp/
>> work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.29-r37/
>
> I think you have fallen foul of MACHINE_KERNEL_PR.  See the various
> threads on that subject in the archives for this list over the past
> month or two.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



