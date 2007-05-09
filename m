Received: from [62.27.45.185] (helo=argo.arachnion.zzZZzz.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <hacker@klever.net>) id 1HlkwF-0002ww-JP
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2007 14:06:35 +0200
Received: from pd9539108.dip0.t-ipconnect.de ([217.83.145.8])
	by argo.arachnion.zzZZzz.net with esmtpa (Exim 4.42)
	id 1Hlkk3-0004NT-HK for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2007 13:53:59 +0200
Message-ID: <4641B5D7.2070406@klever.net>
Date: Wed, 09 May 2007 13:51:51 +0200
From: Michael Krelin <hacker@klever.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070321)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <464130FC.7030008@gmail.com>
	<02827798.20070509123821@gmail.com>	<4641A311.4030907@klever.net>	<4641A5A2.8050108@dominion.kabel.utwente.nl>	<4641A902.6020506@gmail.com>	<4641AFCB.6080203@dominion.kabel.utwente.nl>
	<818235002.20070509143709@gmail.com>
In-Reply-To: <818235002.20070509143709@gmail.com>
X-Enigmail-Version: 0.94.3.0
Subject: Re: QA for intentionally unpackaged files
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
X-List-Received-Date: Wed, 09 May 2007 12:06:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

> 
>         But I agree that catch-all package is better idea than another
> adhoc var. Except that we probably should add ${PN}-unshipped and
> ${PN}-leftovers to distinguish those intentional vs missed cases.
> 

How would any catch-all solution actually differ from disabling QA
notice? Except for that you'd be able to install these leftovers.

Love,
H


