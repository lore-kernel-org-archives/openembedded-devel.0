Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Kz9ys-0004IO-HY
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 14:05:30 +0100
Received: from p5b03689a.dip.t-dialin.net ([91.3.104.154]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Kz9x9-0007iQ-4M by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 14:03:45 +0100
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1Kz9yL-0001aV-Ca for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 14:04:57 +0100
Date: Sun, 9 Nov 2008 14:04:57 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081109130457.GB19668@dodger.lab.datenfreihafen.org>
References: <20081105202153.GB5836@dodger.lab.datenfreihafen.org>
	<20081108210138.GA7205@dodger.lab.datenfreihafen.org>
	<gf69j0$623$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gf69j0$623$1@ger.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00,
	NORMAL_HTTP_TO_IP autolearn=ham version=3.2.3
Subject: Re: Broken update-mime-database due to recent changes
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
X-List-Received-Date: Sun, 09 Nov 2008 13:05:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2008-11-09 at 10:13, Koen Kooi wrote:
> On 08-11-2008 22:01, Stefan Schmidt wrote:
>> For this one shared-mime-info-native_0.51.bb is needed. Sadly this one 
> fails for
>> me on one machine:
>>
>> | /usr/bin/ld: cannot find -lgio-2.0
>>
>> http://134.169.172.106/~sschmidt/log.do_compile.28587.txt
>
> http://gitweb.openembedded.net/?p=openembedded.git;a=commit;h=bfa489ee37aa8c752bb5a7981caae1972fbb4329

Odd, I could swear I did a rebuild from scratch after this date and had the
problem. 


