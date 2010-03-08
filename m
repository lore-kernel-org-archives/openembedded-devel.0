Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NocUB-0002ov-UU
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Mar 2010 13:55:05 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 0069A1B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Mar 2010 12:54:35 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 8 Mar 2010 13:51:35 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <201003081300.19058.holger+oe@freyther.de>
	<B6E39224-2467-4EDA-A0F4-94C4F9DAF9CD@vanille-media.de>
In-Reply-To: <B6E39224-2467-4EDA-A0F4-94C4F9DAF9CD@vanille-media.de>
MIME-Version: 1.0
Message-Id: <201003081351.35463.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 08 Mar 2010 12:55:05 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 08 March 2010 13:42:07 Dr. Michael Lauer wrote:
> While I'm not using it atm., I recall that samba-essential was the only
> recipe that worked relatively painless when Matthias Hentges create it
> back then.

Then please fix it. You will do a great service to our users. The following 
CVEs are not addressed:
	CVE-2009-2813, CVE-2009-2948, CVE-2009-2906, CVE-2009-1888, 
CVE-2008-4314, CVE-2008-1105, CVE-2007-6015, CVS-2007-4572,  CVE-2007-5398, 
CVE-2007-2444, CVE-2007-2446, CVE-2007-2447, CVE-2007-0452, CVE-2007-0453, 
CVE-2007-0454, CAN-2006-1059..

most of these are overflows and DoS

z.


