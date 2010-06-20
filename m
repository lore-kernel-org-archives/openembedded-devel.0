Received: from carmex.station51.net ([109.74.206.142] helo=station51.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <butters@station51.net>) id 1OQR7f-0005gz-Jl
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jun 2010 22:28:18 +0200
Received: from [87.241.107.86] (account butters HELO [192.168.1.201])
	by station51.net (CommuniGate Pro SMTP 5.3.4)
	with ESMTPSA id 1514197 for openembedded-devel@lists.openembedded.org;
	Sun, 20 Jun 2010 22:23:35 +0200
Message-ID: <4C1E78C5.1010608@station51.net>
Date: Sun, 20 Jun 2010 22:23:33 +0200
From: butters <butters@station51.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.4) Gecko/20100608 Thunderbird/3.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C04F6FD.4070804@mlbassoc.com>	<alpine.DEB.2.00.1006011021440.32142@lynx>	<201006011647.23770.ml@vdm-design.de>
	<4C052584.2040905@mlbassoc.com>
In-Reply-To: <4C052584.2040905@mlbassoc.com>
X-SA-Exim-Connect-IP: 109.74.206.142
X-SA-Exim-Mail-From: butters@station51.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Is Angstrom dead?
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
X-List-Received-Date: Sun, 20 Jun 2010 20:28:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

  Were you ever able to resolve this? I'm quite annoyed because I'm 
compiling the gnome image and still getting this error.

Thanks,
Bill

On 6/1/2010 5:21 PM, Gary Thomas wrote:
>
> Sadly, the final image still does not build:
>
> | log_check: Matched keyword: [Cannot satisfy the following dependencies]
> | Collected errors:
> |  * resolve_conffiles: Existing conffile 
> /local/Angstrom_BeagleBoard/tmp/rootfs/beagleboard-linuxtag2010-demo-image/etc/device_table 
> is different from the conffile in the new package. The new conffile 
> will be placed at /local/Angstrom_BeagleBoard/tmp/rootfs/b * 
> satisfy_dependencies_for: Cannot satisfy the following dependencies 
> for angstrom-task-gnome:
> |  *    encodings *     encodings *     encodings *
> |
> NOTE: package beagleboard-linuxtag2010-demo-image-1.0-r0: task 
> do_rootfs: Failed
>
> I don't understand this error well enough (believe me, I've
> spent hours reading the various recipes and trying things)
> to hazard a guess as to what this error means.
>



