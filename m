Received: from [17.148.16.89] (helo=asmtpout014.mac.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1MKQ2G-0008Im-EE
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Jun 2009 07:01:08 +0200
MIME-version: 1.0
Received: from [87.201.169.54] by asmtp014.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KLV003LJS1J8Q60@asmtp014.mac.com> for
	openembedded-devel@lists.openembedded.org; Fri,
	26 Jun 2009 21:49:05 -0700 (PDT)
Message-id: <70A323C0-6A73-4282-91BC-5E78D23B03F0@mac.com>
From: Elvis Dowson <elvis.dowson@mac.com>
To: openembedded-devel@lists.openembedded.org
In-reply-to: <20090627044253.GA22137@denix.org>
Date: Sat, 27 Jun 2009 08:48:34 +0400
References: <7D58AE12-9642-4B1C-97F4-075F1E7447D3@mac.com>
	<1246037427.8887.73.camel@lenovo.internal.reciva.com>
	<385B45B4-00BE-45E6-BDD1-81EE7DBF7B83@mac.com>
	<20090627044253.GA22137@denix.org>
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
X-List-Received-Date: Sat, 27 Jun 2009 05:01:08 -0000
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=US-ASCII; format=flowed; delsp=yes

Thanks for the info, Denys!

On Jun 27, 2009, at 8:42 AM, Denys Dmytriyenko wrote:

>> Why would it pick r37 of all the PV series for that particular  
>> recipe? :-)
>
> conf/machine/include/omap3.inc:
> MACHINE_KERNEL_PR = "r37"

So does that mean I have to remove the PV = "r45" from my linux- 
omap3-2.6.29.bb recipe file?

Elvis


