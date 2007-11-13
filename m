Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Irvjg-0002df-Va
	for openembedded-devel@openembedded.org; Tue, 13 Nov 2007 14:23:25 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Iruba-0004tu-Mg
	for openembedded-devel@openembedded.org; Tue, 13 Nov 2007 12:10:58 +0000
Received: from cm38.kappa85.maxonline.com.sg ([58.182.85.38])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 13 Nov 2007 12:10:58 +0000
Received: from robk by cm38.kappa85.maxonline.com.sg with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 13 Nov 2007 12:10:58 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Date: Tue, 13 Nov 2007 20:10:43 +0800
Message-ID: <fhc484$6ln$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: cm38.kappa85.maxonline.com.sg
User-Agent: KNode/0.10.4
Sender: news <news@ger.gmane.org>
Subject: Initramfs support?
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
X-List-Received-Date: Tue, 13 Nov 2007 13:23:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit

Hi,

I've been trying to figure out how/if OE supports creation of initramfs
files. There's initramfs-uniboot and friends in initrdscripts, but I'm not
sure if that is current or useful, as it doesn't seem to be used by
anything, anywhere.

Then there's linux-hackndev, which builds a mini-busybox on the fly. But
that seems a bit hackish..

Anyone know if there's a good way to have OE create an initramfs archive of
a bunch of files that I provide?

Cheers!

    Rob



