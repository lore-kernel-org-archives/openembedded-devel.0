Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Q72ey-0003HY-Nl
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 11:34:54 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <philb@gnu.org>) id 1Q72cz-00070k-Fs
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 11:32:49 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <inen1t$mgv$1@dough.gmane.org>
References: <1300981024-9111-2-git-send-email-obi@opendreambox.org>
	<1300983264-16652-1-git-send-email-obi@opendreambox.org>
	<4D99C0EA.5070902@opendreambox.org>	<inciqg$3vi$2@dough.gmane.org>
	<4D99E05E.9020100@opendreambox.org>	<ind0l0$io$1@dough.gmane.org>
	<4D9A0A1D.3020209@opendreambox.org>	<inecec$sae$2@dough.gmane.org>
	<4D9ADC0D.6060603@opendreambox.org>  <inen1t$mgv$1@dough.gmane.org>
Date: Tue, 05 Apr 2011 10:32:48 +0100
Message-ID: <1301995968.14449.293.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCHv2] kernel/module-base: Append PR to MACHINE_KERNEL_PR
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
X-List-Received-Date: Tue, 05 Apr 2011 09:34:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-04-05 at 11:23 +0200, Koen Kooi wrote:
> On 05-04-11 11:08, Andreas Oberritter wrote:
> > Thereby making MACHINE_KERNEL_PR mandatory for all machines?
> 
> I don't see why not.

The majority of machines aren't using it at present so this would be an
unexpected (and presumably unwelcome) change for them.  That seems like
a bad idea unless there is a compelling reason why it needs to be done.

p.




