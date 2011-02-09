Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PnDtw-0001M6-1S
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 18:32:24 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PnDss-0004MC-CV from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 09:31:18 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 9 Feb 2011 09:31:18 -0800
Received: from [172.30.80.130] ([172.30.80.130]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 9 Feb 2011 10:31:17 -0700
Message-ID: <4D52CF60.2080608@mentor.com>
Date: Wed, 09 Feb 2011 10:31:12 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D51566B.9060603@mentor.com>
In-Reply-To: <4D51566B.9060603@mentor.com>
X-OriginalArrivalTime: 09 Feb 2011 17:31:17.0281 (UTC)
	FILETIME=[284E4110:01CBC87F]
Subject: Re: OpenEmbedded 2011.3 Release: Request for targets!
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
X-List-Received-Date: Wed, 09 Feb 2011 17:32:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2011 07:42 AM, Tom Rini wrote:
> Hey all,
>
> As March is fast approaching I want to gather the list of DISTRO /
> MACHINE / BBPKGS targets that the various distributions would like to
> see at least compile tested (volunteers for HW testing welcome!). Today,
> I have the following setup to be built:
>
> minimal / minimal-uclibc:
> qemux86/ppc/arm/mips/mips64/sh4/mipsel, mpc8315e-rdb, p2020ds, p2020rdb
> +
> nas-server-image/native-sdk-image/console-image/minimal-image/x11-image/meta-toolchain/qt4-x11-demo-image/qt4e-demo-image
>
>
> angstrom-2008.1 / angstrom-2010.x:
> hawkboard, mini2440, mini6410, beagleboard + console-image /
> qt4-x11-demo-image / qt4e-demo-image
>
> slugos / ucslug:
> nslu2be/le + slugos-image
>
> I'm building all of these for 32bit Ubuntu 8.04, RHEL5 and will be
> adding Ubuntu 10.04 for the next run. What more do people want added?
> I'm looking to fill this matrix out to something that runs "over the
> weekend" and I've still got plenty of room to spare (which is why I've
> bcc'd everyone in the MAINTAINERS file with a Distro by their name).
>
> And of course if you wish to handle building what you care about
> yourself instead, that's great! Please just take this as a gentle
> reminder that there's a release coming up so it's time to crank the
> builders up and make sure your stuff is working.

At this time would people that are going to be building things on their 
own please fill out the table on
http://wiki.openembedded.org/index.php/Release-2011.03 and list N/A for 
the git hash?  I'll fill in the table of what I'm going to be building 
after, lets say Friday as a deadline for getting requests in for the 
first build round.

-- 
Tom Rini
Mentor Graphics Corporation


