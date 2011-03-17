Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q0Hkl-0005uC-6U
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Mar 2011 19:16:55 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q0Hj4-00035z-Ud from Tom_Rini@mentor.com ;
	Thu, 17 Mar 2011 11:15:10 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 17 Mar 2011 11:15:09 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Thu, 17 Mar 2011 11:15:09 -0700
Message-ID: <4D824F9A.8020903@mentor.com>
Date: Thu, 17 Mar 2011 11:14:50 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <ilt06r$gji$1@dough.gmane.org>
In-Reply-To: <ilt06r$gji$1@dough.gmane.org>
X-OriginalArrivalTime: 17 Mar 2011 18:15:09.0825 (UTC)
	FILETIME=[404B9710:01CBE4CF]
Subject: Re: [2011.03-maintenance] Pull request #3
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
X-List-Received-Date: Thu, 17 Mar 2011 18:16:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/17/2011 05:52 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Tom,
>
> Please pull the 11 commits from here:
>
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
>
> Koen Kooi (7):
>        angstrom 2011.03 blacklist bash-noemu
>        task-omap-drivers: task for commonly needed drivers on omap chips
>        *beagleboard-validation: collection of tasks iand images to serve
>        task-beagleboard*: add changes from latest round of feedback
>        linux-omap-psp 2.6.32: add support for xM revision C
>        linux-omap-psp 2.6.32: bump PR
>        u-boot git: update beagleboard u-boot to 2011.03-RC
>
> chase maupin (4):
>        u-boot.inc: allow variable make targets
>        dm368-evm: Add configuration for DM368 machine
>        matrix-gui: add support for dm386-evm machine
>        ti-pru-sw-example: fix building with new toolchain sysroot
>
>
> You can view the branch online at
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance
>
> The bash-noemu and u-boot commits both have a one line change compared
> to .dev to account for the differences between angstrom versions. The
> other 9 commits are straight cherry-picks.

Merged, thanks.

> I can pick up the external-toolchain patches from Ben for next weeks
> pull request if you wish.

I've grabbed these with pw-am.sh and updated patchwork.  Chase, can you 
please update patchwork to reflect that your changes have been applied? 
  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


