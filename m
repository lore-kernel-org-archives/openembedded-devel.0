Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KsZ8K-0006aU-VN
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 10:32:01 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KsZ7t-0007cp-FS
	for openembedded-devel@openembedded.org; Wed, 22 Oct 2008 08:31:33 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 22 Oct 2008 08:31:33 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 22 Oct 2008 08:31:33 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Oct 2008 10:31:24 +0200
Message-ID: <gdmocs$97j$1@ger.gmane.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF480@hiob.intern.dresearch.de>	<gdknoe$186$2@ger.gmane.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF484@hiob.intern.dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081015 Shredder/3.0b1pre
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF484@hiob.intern.dresearch.de>
Sender: news <news@ger.gmane.org>
Subject: Re: support another hardware
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
X-List-Received-Date: Wed, 22 Oct 2008 08:32:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-10-2008 10:24, Sledz, Steffen wrote:
> I've created/changed oxe810.conf and linux_2.6.24.bb in the described way and tried to build the angstrom distro using minimal-image.bb.
>
> The good news is that the kernel build without problems. :)
>
> The bad one that building the root_fs fails with:
>
> | Collected errors:
> |  * ERROR: Cannot satisfy the following dependencies for task-boot:
> |        *  base-passwd *  busybox *  initscripts *  modutils-initscripts *  netbase *  udev *  sysvinit *  sysvinit-pidof *  tinylogin *
>
> Hmmmm? What's wrong here? Building the same image for other machines works fine.

Looks like a package arch problem, could you show the oxe810.conf?

regards,

Koen




