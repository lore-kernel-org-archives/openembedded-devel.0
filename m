Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nh7Xh-0005LO-Lh for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 21:27:44 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nh7VB-0005bj-4K for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 21:25:05 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 21:25:05 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2010 21:25:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 15 Feb 2010 21:23:33 +0100
Message-ID: <hlcag3$ae$1@ger.gmane.org>
References: <openembedded-devel@lists.openembedded.org>
	<1266264914-7069-1-git-send-email-aalonso00@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100204 Shredder/3.0.2pre
In-Reply-To: <1266264914-7069-1-git-send-email-aalonso00@gmail.com>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux.inc: add device tree for xilinx ml507 Signed-off-by: aalonso <aalonso00@gmail.com>
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
X-List-Received-Date: Mon, 15 Feb 2010 20:27:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi!

It seems you fell victim to the "git needs blank line between summarry
and body" maffia and git put everything in the subject line. Could you
regenerate and resend please?

regards,

Koen

On 15-02-10 21:15, aalonso wrote:
> ---
>  recipes/linux/linux.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/linux/linux.inc b/recipes/linux/linux.inc
> index 7405c08..b562657 100644
> --- a/recipes/linux/linux.inc
> +++ b/recipes/linux/linux.inc
> @@ -38,6 +38,7 @@ KERNEL_DEVICETREE_mpc8313e-rdb = "arch/${ARCH}/boot/dts/mpc8313erdb.dts"
>  KERNEL_DEVICETREE_mpc8315e-rdb = "arch/${ARCH}/boot/dts/mpc8315erdb.dts"
>  KERNEL_DEVICETREE_mpc8323e-rdb = "arch/${ARCH}/boot/dts/mpc832x_rdb.dts"
>  KERNEL_DEVICETREE_sequoia = "arch/${ARCH}/boot/dts/sequoia.dts"
> +KERNEL_DEVICETREE_xilinx-ml507 = "arch/${ARCH}/boot/dts/virtex440-ml507.dts"
>  
>  KERNEL_DEVICETREE_FLAGS = "-R 8 -S 0x3000"
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLea1FMkyGM64RGpERArh3AKCLPoXbnPAhfNAVo+RFo0ybG906IACfeuaP
4Raof8c0plbGFLXVlU1jTxs=
=TIcr
-----END PGP SIGNATURE-----



