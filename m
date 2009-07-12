Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MQ7DO-0005xA-Jm
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jul 2009 00:08:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 40387507934
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 17:55:03 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25262-01 for <openembedded-devel@lists.openembedded.org>; 
	Sun, 12 Jul 2009 17:55:03 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 0CF1A5069F3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 17:55:03 -0400 (EDT)
Date: Sun, 12 Jul 2009 17:55:02 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <be7a9f3d0907111340p20b792ecod3874d59a8a0f183@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0907121752260.3621@juice.ott.cti.com>
References: <4A5788F3.2080805@cbnco.com>
	<be7a9f3d0907111340p20b792ecod3874d59a8a0f183@mail.gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: Building xserver-xorg 1.6.1 for i686: libtool error
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
X-List-Received-Date: Sun, 12 Jul 2009 22:08:14 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 11 Jul 2009, Otavio Salvador wrote:

> http://lists.freedesktop.org/archives/xorg/2009-May/045835.html
> 
> Above goes the patch we have sent for inclusion on dolt GIT. I'll
> pester upstream about it again ;-)

Thanks! In the meantime I'll update the 1.6.1 recipe to use your patch.

BTW, there's a separate dolt mailing list 
(http://lists.freedesktop.org/mailman/listinfo/dolt). Maybe the dolt
maintainer lurks there but not on xorg...

Mike


