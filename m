Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KTbHm-0003vB-K2
	for openembedded-devel@openembedded.org; Thu, 14 Aug 2008 13:46:34 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KTbH8-0005kx-J9
	for openembedded-devel@openembedded.org; Thu, 14 Aug 2008 11:45:54 +0000
Received: from ip-62-143-12-162.hsi.ish.de ([62.143.12.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 14 Aug 2008 11:45:54 +0000
Received: from no2spam by ip-62-143-12-162.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 14 Aug 2008 11:45:54 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 14 Aug 2008 13:45:46 +0200
Message-ID: <g815ta$ca0$1@ger.gmane.org>
References: <g7vqvs$3fi$1@ger.gmane.org>
	<1218699665.10360.25.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-12-162.hsi.ish.de
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
In-Reply-To: <1218699665.10360.25.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
Subject: Re: git and dir
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
X-List-Received-Date: Thu, 14 Aug 2008 11:46:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> What's the specific corruption that you're worried about?

Maybe my worries are unfounded and that would be great.  I was thinking 
that building for a certain distribution but changing the checked out 
repo underneath its feet back and forth could eventually result in 
incompatible stuff getting into TMPDIR and particularly staging.  Think 
switching between dev, stable, openmoko and some of its variant and 
building stuff in between.  I don't think it is too far-fetched to worry 
this might lead to some incompatabilities in what is under TMPDIR.



