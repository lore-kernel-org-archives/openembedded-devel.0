Received: from [81.228.8.164] (helo=pne-smtpout2-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Mdnf8-00018X-RP
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 18:05:22 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn2.hy.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A5BC8BE0030550D for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 17:48:10 +0200
Message-ID: <4A8C1EB7.4050500@atmel.com>
Date: Wed, 19 Aug 2009 17:48:07 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: fbv neutered
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
X-List-Received-Date: Wed, 19 Aug 2009 16:05:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I added "fbv" "frame buffer viewer" to the file system,
and happily tried to watch my Mustang rental car.

-- fbv did not recognize the file format.

Generated a nice bmp file and tried this...

--  fbv did not recognize the file format.

I then checked the recipe:


---------------------------------
	CC="${CC}" ./configure --without-libungif --without-bmp \
		--without-libjpeg
---------------------------------

Beats me why someone would want to have it built this way.

Is there another application one should use?


-- 
Best Regards
Ulf Samuelsson



