Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1PUyhd-0005j2-Nr
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 10:40:18 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B02D011000DC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 10:34:23 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 9A6EF11000B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 10:34:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225147091.adsl.alicedsl.de
	[92.225.147.91]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 10:34:22 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 60F8E3C124; Tue, 21 Dec 2010 10:33:48 +0100 (CET)
Date: Tue, 21 Dec 2010 10:33:48 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101221093348.GA3927@rhein.zuhause.netz>
References: <4D10315D.5020707@gmail.com>
	<AANLkTin8Fk1Zs3U-s_SAHrHOCn+NW2j=utt0J5OYtbKb@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTin8Fk1Zs3U-s_SAHrHOCn+NW2j=utt0J5OYtbKb@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: uclibc - which virtual/libintl?
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
X-List-Received-Date: Tue, 21 Dec 2010 09:40:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

in my tests proxy-libintl provided the smallest lib. So we should use it.

Bye Henning


