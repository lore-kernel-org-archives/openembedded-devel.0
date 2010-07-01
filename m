Received: from jak.nl ([65.204.18.188]) by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <arjan@jak.nl>) id 1OUFha-00037V-6E
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 11:04:59 +0200
Received: (qmail 46682 invoked by uid 89); 1 Jul 2010 09:00:14 -0000
Received: from jak.nl (HELO ?128.63.129.1?) (65.204.18.188)
	by jak.nl with SMTP; 1 Jul 2010 09:00:14 -0000
Message-ID: <4C2C5912.80308@jak.nl>
Date: Thu, 01 Jul 2010 11:00:02 +0200
From: Arjan <arjan@jak.nl>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.1.10) Gecko/20100512 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 65.204.18.188
X-SA-Exim-Mail-From: arjan@jak.nl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: meta-toolchain-qte produces toolchain with missing Qt include dirs
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
X-List-Received-Date: Thu, 01 Jul 2010 09:04:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to build the sdk as described in de OE manual. 
[http://docs.openembedded.org/usermanual/usermanual.html#id501110]
I did not modify the qt4-embedded.inc or qt4.inc.
The final sdk archive misses almost all the includes from de Qt 
framework (it only has qtopia/QtCore and qtopia/phonon) . But it does 
include the libs and binaries.

Is this expected behaviour or am I doing something wrong?

Thanks,
Arjan




