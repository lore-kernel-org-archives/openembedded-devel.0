Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1Qr4FX-00077d-03
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Aug 2011 10:34:51 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1Qr4BD-00052F-4V>; Wed, 10 Aug 2011 10:30:23 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1Qr4BD-000123-1P>; Wed, 10 Aug 2011 10:30:23 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1Qr4BC-0007NB-Uu
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2011 10:30:22 +0200
Date: Wed, 10 Aug 2011 10:30:22 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110810083022.GA27005@mi.fu-berlin.de>
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04BC9EBB@nzc-ap-xch-02.ap.trimblecorp.net>
MIME-Version: 1.0
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04BC9EBB@nzc-ap-xch-02.ap.trimblecorp.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: Init process help please
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
X-List-Received-Date: Wed, 10 Aug 2011 08:34:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2011 at 02:49:18PM +1200, Bernard Mentink wrote:
> Hi Guys,
> 
> I am porting Linux to an imx31 based target and have the kernel booting
> and the NFS filesystem booting and I see the kernel messages in the ram
> buffer uptill where it states:
> 
> "Freeing init memory: 104K"
> 
> However, I do not see any more messages regarding the init process, how
> do I know if it has started? (By the way, I don't have a serial console
> working at present ..)

If you have nfs this implies network. So what about trying the kernel build
in network console?

Bye Henning


