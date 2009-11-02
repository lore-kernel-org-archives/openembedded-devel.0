Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N4stn-00005O-LF
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 10:08:31 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id C07DD1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2009 09:17:18 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 2 Nov 2009 10:07:03 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200910291241.35265.marcin@juszkiewicz.com.pl>
	<200911020306.33189.holger+oe@freyther.de>
	<hcm606$u90$2@ger.gmane.org>
In-Reply-To: <hcm606$u90$2@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200911021007.03089.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Checksums.ini again - new format this time
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
X-List-Received-Date: Mon, 02 Nov 2009 09:08:31 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 02 November 2009 09:41:42 Koen Kooi wrote:

> > the problem with archivename there is no gurantee that the name will be
> > globally unique. E.g. with Open Palmtop Integreated Environment (OPIE)
> > One Password.. (OPIE) there was a clash and we might or might not have
> > had a clash in release versions too...
> 
> Archives get stored by archive name in DL_DIR already, so that's a moot
> point.

No, it means we have another bug somewhere else. :)


