Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HVDVT-0003Y3-UD
	for openembedded-devel@openembedded.org; Sat, 24 Mar 2007 22:10:36 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l2OLASLr013018 for <openembedded-devel@openembedded.org>;
	Sat, 24 Mar 2007 22:10:31 +0100
Message-ID: <460593C2.1080501@dominion.kabel.utwente.nl>
Date: Sat, 24 Mar 2007 22:10:26 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <c384c5ea0703240813w6e575805n2471bd1d6aa2614a@mail.gmail.com>
In-Reply-To: <c384c5ea0703240813w6e575805n2471bd1d6aa2614a@mail.gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: False handling of image types (pls check assumptions of your	distro)
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
X-List-Received-Date: Sat, 24 Mar 2007 21:10:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:

> The second regression seems that the IMAGE_CMD_tar now compresses into
> .tar.bz2.
> 
> conf/bitbake.conf:201:IMAGE_CMD_tar
> 
> However, we have the seperate "tar.bz2" type for that.
> 
> I am not fixing this yet, as Koen warned me some
> "people/images/distros rely on the (wrong) behaviour".
> 
> So if you are such a entity, please fix now. I'll hold off the simple
> fix to IMAGE_CMD_tar for some time,

I fixed mine just now :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGBZPCMkyGM64RGpERAhp6AKCNN//hsdUXKfm3e6plZ+tgJm6NNgCfUboz
TJxJ0aq/4RThsLHL9XXxxW8=
=mwy9
-----END PGP SIGNATURE-----


