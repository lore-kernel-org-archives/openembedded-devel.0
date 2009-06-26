Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1MKFQv-0008Ip-BD
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 19:41:53 +0200
Received: from 79-71-239-25.dynamic.dsl.as9105.com ([79.71.239.25]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1MKFFs-0000Ql-CH
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 18:30:28 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <7D58AE12-9642-4B1C-97F4-075F1E7447D3@mac.com>
References: <7D58AE12-9642-4B1C-97F4-075F1E7447D3@mac.com>
Date: Fri, 26 Jun 2009 18:30:27 +0100
Message-Id: <1246037427.8887.73.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
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
X-List-Received-Date: Fri, 26 Jun 2009 17:41:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-06-26 at 20:08 +0400, Elvis Dowson wrote:
> NOTE: Unpacking /usr/share/sources/ 
> git_git.kernel.org.pub.scm.linux.kernel.git.tmlind.linux- 
> omap-2.6.git_90e758af52ba803cba233fabee81176d99589f09.tar.gz to tmp/ 
> work/overo-angstrom-linux-gnueabi/linux-omap3-2.6.29-r37/

I think you have fallen foul of MACHINE_KERNEL_PR.  See the various
threads on that subject in the archives for this list over the past
month or two.

p.




