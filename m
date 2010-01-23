Received: from asmtpout027.mac.com ([17.148.16.102])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1NYlsr-0007n6-Qz
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 20:43:05 +0100
MIME-version: 1.0
Received: from [87.201.169.25] by asmtp027.mac.com
	(Sun Java(tm) System Messaging Server 6.3-8.01 (built Dec 16 2008;
	32bit)) with ESMTPSA id <0KWP00BKSTAU6410@asmtp027.mac.com> for
	openembedded-devel@lists.openembedded.org; Sat,
	23 Jan 2010 11:40:12 -0800 (PST)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=5.0.0-0908210000 definitions=main-1001230168
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Sat, 23 Jan 2010 23:40:04 +0400
In-reply-to: <1264258263.21187.26.camel@mattotaupa.wohnung.familie-menzel.net>
To: openembedded-devel@lists.openembedded.org
References: <1263888104.2678.15.camel@ubuntu-desktop>
	<C305642D-75E5-4B97-8A14-65BE8A867E53@mac.com>
	<BD272887-5F72-4B99-B9E9-0C8D1451426F@mac.com>
	<201001231357.53005.holger+oe@freyther.de>
	<6A97E73D-E10B-4CC2-B239-1AB8FC2AC47B@mac.com>
	<1264258263.21187.26.camel@mattotaupa.wohnung.familie-menzel.net>
Message-id: <9677BF84-35AD-4661-BEB1-B272680AE61A@mac.com>
X-Mailer: Apple Mail (2.1077)
X-SA-Exim-Connect-IP: 17.148.16.102
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Bitbake build error on Fedora 12 x86 64-bit
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
X-List-Received-Date: Sat, 23 Jan 2010 19:43:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT

Hi,

On Jan 23, 2010, at 6:51 PM, Paul Menzel wrote:
> 
> You used Git to get BitBake. The needed commands you used are not
> documented on OpenEmbedded.org. The reason is that it is officially
> recommended by OE to use the tarballs.

Oh, okay!! Most of the people who use bitbake for overo development always pull from the latest sources. Perhaps that is why we endup getting so many problems once in a while. 

When I search for a solution to the os problem, I found that it was fixed in the latest release of bitbake in the git repository.

Best regards,

Elvis

