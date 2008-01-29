Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JJpjI-0001an-Vg
	for openembedded-devel@openembedded.org; Tue, 29 Jan 2008 13:38:21 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JJpjO-0007WK-4d
	for openembedded-devel@openembedded.org; Tue, 29 Jan 2008 12:38:26 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 29 Jan 2008 12:38:26 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 29 Jan 2008 12:38:26 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 29 Jan 2008 13:38:17 +0100
Message-ID: <fnn6np$vvv$1@ger.gmane.org>
References: <200801211408.31701.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <200801211408.31701.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: Bug 2430 -- TrueType fonts handling and solution for it
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
X-List-Received-Date: Tue, 29 Jan 2008 12:38:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz schrieb:
> http://bugs.openembedded.net/show_bug.cgi?id=2430

> 6. qpf.bbclass ([...]) will also RDEPEND on "update-fonts" and will call
>    it in postinst/postrm
> 7. qpf fonts will also RDEPEND on qte-fonts-common which
>    provide "update-qtfontdir" script

00152e23f5366f1e8e84e4b10b210ec4df91ddc2

I will clean things up a bit further wrt fonts, but basically, bug 2430
should be taken care of now.



