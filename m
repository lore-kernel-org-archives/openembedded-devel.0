Received: from [64.26.60.144] (helo=smtpauth00.csee.onr.siteprotect.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric.nelson@boundarydevices.com>) id 1JwfBL-0002gw-VP
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 May 2008 17:15:48 +0200
Received: from [192.168.0.14] (unknown [67.42.45.38])
	(Authenticated sender: eric.nelson@boundarydevices.com)
	by smtpauth00.csee.onr.siteprotect.com (Postfix) with ESMTP id
	10C97758057 for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2008 10:14:05 -0500 (CDT)
Message-ID: <482C533D.8050800@boundarydevices.com>
Date: Thu, 15 May 2008 08:14:05 -0700
From: Eric Nelson <eric.nelson@boundarydevices.com>
User-Agent: Thunderbird 1.5.0.14ubu (X11/20080505)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080515121034.20C9F189319@amethyst.openembedded.net>
	<482C4652.1020704@gmx.net>
In-Reply-To: <482C4652.1020704@gmx.net>
X-Enigmail-Version: 0.94.4.0
Subject: Re: [oe-commits] org.oe.dev dsplink: add url to manual dsplink download
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Thu, 15 May 2008 15:15:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Robert Schuster wrote:
> Hi,
> is this stuff non-free? Otherwise couldn't it be hosted somewhere else?
> 
> Regards
> Robert
> 
> koen commit schrieb:
>>  # Get dsplink tarball from TI website, place in sources and calculate
>>  # md5sum
>> +# https://www-a.ti.com/downloads/sds_support/targetcontent/link/index.html
>>  SRC_URI ="http://install.tarball.in.source.dir/dsplink_1_50.tar.gz \
> 
DSP-link is not open-source as of this version. The license agreement inside
the tarball clearly states:

	"You may not distribute, publish, rent, lease or sub-license the
	Licensed Materials, or any portion or derivative thereof, in
	a source code format"

I believe that TI has an intent to open the DSP-link sources, but it
apparently hasn't happened yet.

Eric



