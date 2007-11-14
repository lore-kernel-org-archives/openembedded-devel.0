Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Is8cW-0007Iz-4F
	for openembedded-devel@openembedded.org; Wed, 14 Nov 2007 04:08:52 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Is8ay-0000jZ-1J
	for openembedded-devel@openembedded.org; Wed, 14 Nov 2007 03:07:16 +0000
Received: from cm38.kappa85.maxonline.com.sg ([58.182.85.38])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 14 Nov 2007 03:07:16 +0000
Received: from robk by cm38.kappa85.maxonline.com.sg with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 14 Nov 2007 03:07:16 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Wed, 14 Nov 2007 11:07:05 +0800
Message-ID: <fhdoor$m2d$1@ger.gmane.org>
References: <fhc484$6ln$1@ger.gmane.org>
	<f96d234e0711130749u270d6774h8114829b68dcfc6f@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: cm38.kappa85.maxonline.com.sg
User-Agent: KNode/0.10.4
Sender: news <news@ger.gmane.org>
Subject: Re: Initramfs support?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Nov 2007 03:08:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Hi Cliff,

Cliff Brake wrote:
> - define a custom image or use something like minimal-image
> - add cpio.gz to IMAGE_FSTYPES
> - use the resulting cpio.gz as your initramfs

Thanks, I guess that's the way to go. I was hoping I could modify my main
image (already custom) to also create a cpio.gz, but a second image may be
just as clean. The x270 images are a good reference..

Cheers!

    Rob



