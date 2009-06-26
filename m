Received: from [17.148.16.95] (helo=asmtpout020.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MKKNa-0001H0-MD
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Jun 2009 00:58:46 +0200
MIME-version: 1.0
Received: from [87.201.169.54] by asmtp020.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLV00FFZB9LX670@asmtp020.mac.com> for
	openembedded-devel@lists.openembedded.org; Fri,
	26 Jun 2009 15:46:38 -0700 (PDT)
Message-id: <EB00B4AB-9898-4C5F-BFE4-9771B113901C@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <1246037427.8887.73.camel@lenovo.internal.reciva.com>
Date: Sat, 27 Jun 2009 02:46:12 +0400
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
X-List-Received-Date: Fri, 26 Jun 2009 22:58:47 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Hi Phil,
		Is there a fix for this? I just reverted my virtual machine to what  
it was back a week ago, and noticed this discrepency! :-)

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



