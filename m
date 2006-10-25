Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <freyther@inf.fu-berlin.de>) id 1GcfOi-0006ta-Ss
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Oct 2006 11:50:08 +0200
Received: from [145.253.107.2] (helo=[192.168.61.154])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.60)
	(envelope-from <freyther@inf.fu-berlin.de>) id 1GcfOc-0005EO-Ia
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Oct 2006 11:50:02 +0200
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <200610250859.19316.openembedded@hrw.one.pl>
References: <453EAEE0.8020704@dominion.kabel.utwente.nl>
	<200610250859.19316.openembedded@hrw.one.pl>
X-Gpgmail-State: !signed
Message-Id: <2110BC65-EBCC-4FFB-B029-B5ED4B62DD08@inf.fu-berlin.de>
From: Holger Freyther <freyther@inf.fu-berlin.de>
Date: Wed, 25 Oct 2006 11:48:10 +0200
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.752.3)
X-Broken-Reverse-DNS: no host name found for IP address 145.253.107.2
Subject: Re: Report of QA issues with 'bitbake angstrom-image'
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
X-List-Received-Date: Wed, 25 Oct 2006 09:50:09 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 25.10.2006 um 08:59 schrieb Marcin Juszkiewicz:

> We also need to change insane.bbclass to print PN/PV on each line  
> as many
> packages are renamed by debian.bbclass. Not duplicating info would be
> also usefull.

Actually this sounds more like you want to have ${FILE} printed.  
Actually all these scanners are stateless at the momemnt and for now  
I would like to keep it, until the results are a bit better and we  
have some more tests. Then I will improve reporting.


h.



