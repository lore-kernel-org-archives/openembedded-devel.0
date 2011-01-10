Received: from mail-in-10.arcor-online.net ([151.189.21.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <no2spam@nospam.arcornews.de>) id 1PcIa3-0000gD-FD
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 15:18:43 +0100
Received: from mail-in-13-z2.arcor-online.net (mail-in-13-z2.arcor-online.net
	[151.189.8.30]) by mx.arcor.de (Postfix) with ESMTP id 881B52D66DC;
	Mon, 10 Jan 2011 14:44:13 +0100 (CET)
Received: from mail-in-15.arcor-online.net (mail-in-15.arcor-online.net
	[151.189.21.55])
	by mail-in-13-z2.arcor-online.net (Postfix) with ESMTP id 7D558E1B4F;
	Mon, 10 Jan 2011 14:44:13 +0100 (CET)
Received: from [192.168.3.100] (unknown [112.206.128.158])
	(Authenticated sender: leggewie@arcor.de)
	by mail-in-15.arcor-online.net (Postfix) with ESMTPA id CB3681AC8FB;
	Mon, 10 Jan 2011 14:44:11 +0100 (CET)
X-DKIM: Sendmail DKIM Filter v2.8.2 mail-in-15.arcor-online.net CB3681AC8FB
Message-ID: <4D2B0D23.4070003@nospam.arcornews.de>
Date: Mon, 10 Jan 2011 21:44:03 +0800
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>, 
	Paul Menzel <paulepanter@users.sourceforge.net>
References: <1294585014.4036.47.camel@mattotaupa>	 <4D29FC65.9010608@gmail.com>
	<1294659553.4342.69.camel@mattotaupa>
In-Reply-To: <1294659553.4342.69.camel@mattotaupa>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] libcap, libcap2: use automatic packaging to fix QA errors
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
X-List-Received-Date: Mon, 10 Jan 2011 14:18:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2011 19:39, Paul Menzel wrote
>>>          FILES_${PN} = "${libdir}"
>>>          FILES_${PN}-dev = "${includedir}"
> 
> I am putting Rolf into CC to get the reasoning for the previous
> behavior.

My commit did not change the previous behaviour as far as I can see and
thus I cannot comment on it.  Maybe you want to look deeper into the
history of that file.  Sorry.


