Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HNu6o-0000aU-LF
	for openembedded-devel@openembedded.org; Sun, 04 Mar 2007 18:02:54 +0100
Received: from [172.20.0.21] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l24H2oLr016287 for <openembedded-devel@openembedded.org>;
	Sun, 4 Mar 2007 18:02:50 +0100
Message-ID: <45EAFBBA.6000704@dominion.kabel.utwente.nl>
Date: Sun, 04 Mar 2007 18:02:50 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <3812EAEB-7EFE-40F3-8311-1047D0540BD6@selfish.org>
In-Reply-To: <3812EAEB-7EFE-40F3-8311-1047D0540BD6@selfish.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Recent wordpress attacks and md5sum
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
X-List-Received-Date: Sun, 04 Mar 2007 17:02:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
> Hello,
> the recent wordpress attacks illustrates the danger of changed  
> sourcecode. Luckily we do not package wordpress but our packages  
> would have contained this backdoor! Now to use the buzz words  
> terrorism, danger, security and you all should be scared.
> Luckily we do not need a homeland security act to avoid this situation:
> 
> <THE_MAIN_POINT>
> Please add md5sum to your SRC_URI on http/ftp/sctp.
> </THE_MAIN_POINT>

I have a bunch of sources, but how do I know that these have the correct md5sum? Should we
all run md5sum on our DL_DIR and compare results?


> PS: I wonder if bitbake should refuse to fetch code without md5sum/ 
> shasum

Another extension for insane.bbclass? How do we handle mirrors for svn/cvs checkouts?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF6vu6MkyGM64RGpERArrVAJ9E0JteKkamkU0hyL/ZBhKEZrApjwCfUmbH
a89nPtPAdSUsw7f7gmrGZ28=
=oOhM
-----END PGP SIGNATURE-----


