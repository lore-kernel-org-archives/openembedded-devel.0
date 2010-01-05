Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NS66u-0005ya-Qu
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 10:54:00 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 3A3DC1100096
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2010 10:51:55 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CBE8F1100093
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2010 10:51:54 +0100 (CET)
Received: from rhein.familie-heinold.de (f052228155.adsl.alicedsl.de
	[78.52.228.155]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2010 10:51:54 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 45EF23C118; Tue,  5 Jan 2010 10:51:49 +0100 (CET)
Date: Tue, 5 Jan 2010 10:51:49 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100105095147.GA3433@rhein.zuhause.netz>
References: <1262649107.3238.44.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
In-Reply-To: <1262649107.3238.44.camel@mattotaupa.wohnung.familie-menzel.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [bitbake vdr] /arm-angstrom-linux-gnueabi/bin/ld: cannot find -lintl
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
X-List-Received-Date: Tue, 05 Jan 2010 09:54:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

seems I forgot the depency. Will check them in later. This happens when one
done build vom clean oetmp.

Bye Henning


