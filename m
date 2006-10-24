Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1GcLU7-00049e-FQ
	for openembedded-devel@openembedded.org; Tue, 24 Oct 2006 14:34:23 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1GcLTb-0005AU-57
	for openembedded-devel@openembedded.org; Tue, 24 Oct 2006 14:33:51 +0200
Received: from v2ab5.v.pppool.de ([89.57.42.181])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 24 Oct 2006 14:33:51 +0200
Received: from no2spam by v2ab5.v.pppool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 24 Oct 2006 14:33:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 24 Oct 2006 14:33:14 +0200
Message-ID: <ehl16f$dp7$1@sea.gmane.org>
References: <453DD6D1.8080407@dominion.kabel.utwente.nl>
	<453DD889.2040209@dominion.kabel.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: v2ab5.v.pppool.de
User-Agent: Thunderbird 1.5.0.7 (X11/20060922)
In-Reply-To: <453DD889.2040209@dominion.kabel.utwente.nl>
Sender: news <news@sea.gmane.org>
Subject: Re: unset MACHINE before building bintutils-cross
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
X-List-Received-Date: Tue, 24 Oct 2006 12:34:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:

> The above is a bit confusing, to trigger the bug you need to do:
> 
> export MACHINE=hx4700 ; bitbake glibc

Maybe take a look at bug 1110?  Or is that bug invalid?



