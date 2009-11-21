Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NBtjW-0008WQ-PX
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 18:26:53 +0100
Received: from tamarin.localnet (static.233.147.46.78.clients.your-server.de
	[78.46.147.233])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 834241B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2009 17:37:03 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Nov 2009 18:23:44 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <he689r$c57$1@ger.gmane.org>
	<200911201946.21779.holger+oe@freyther.de>
	<1258743262.13348.117.camel@opal>
In-Reply-To: <1258743262.13348.117.camel@opal>
MIME-Version: 1.0
Message-Id: <200911211823.44772.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: MACHINE_FEATURE changes
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
X-List-Received-Date: Sat, 21 Nov 2009 17:26:53 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 20 November 2009 19:54:22 Michael 'Mickey' Lauer wrote:
> Am Freitag, den 20.11.2009, 19:46 +0100 schrieb Holger Hans Peter
> 
> Freyther:
> > Stupid question. What is fso-apm and what does it provide?
> 
> An apm utility that has the same UI as apm, but uses FSO's DBus API
> to do its job.

Ah that is a bit unfortunate. You should be able to open /dev/apm_bios more 
than once so you should be able to have the real APM running and then open it 
again in the fso daemon. Didn't this work?

regards
	holger


