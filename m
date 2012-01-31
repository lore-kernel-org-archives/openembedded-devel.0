Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1RsHDr-0000qD-Rq
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jan 2012 18:10:23 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RsH6G-00009R-3s>; Tue, 31 Jan 2012 18:02:32 +0100
Received: from hydra.imp.fu-berlin.de ([160.45.117.149]
	helo=mail.imp.fu-berlin.de) by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RsH6G-0001N9-1A>; Tue, 31 Jan 2012 18:02:32 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by mail.imp.fu-berlin.de with esmtps (MTA Exim 4.72) id
	1RsH5v-0004oW-QA (envelope-from <heinold@mi.fu-berlin.de>)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 18:02:27 +0100
Received: from heinold by andorra.imp.fu-berlin.de with local (client Exim
	4.72) id 1RsH5q-0007UJ-Mj
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jan 2012 18:02:06 +0100
Date: Tue, 31 Jan 2012 18:02:06 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120131170206.GA27750@mi.fu-berlin.de>
References: <CADZ6=asn5Tq6adpuysW229BYXDu3ExUVNDWEZtzpjyAUv9PHgQ@mail.gmail.com>
	<CADZ6=avk8ekCLnXv=wbYwhcYzHpyN9mR2mctUNW4hxFfGJZ5Ug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADZ6=avk8ekCLnXv=wbYwhcYzHpyN9mR2mctUNW4hxFfGJZ5Ug@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Remote-IP: 160.45.42.84
X-Spam_Score: -2.9
X-exim-Spam_Score_Int: -28
X-exim-Spam_Bar: --
X-Spam_Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.0 T_RP_MATCHES_RCVD Envelope sender domain matches handover relay
	*      domain
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Originating-IP: 160.45.117.149
Subject: Re: [meta-java][PATCH] llvm-config: Work around shebang max length issue
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
X-List-Received-Date: Tue, 31 Jan 2012 17:10:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 30, 2012 at 02:09:40PM +0100, Thilo Fromm wrote:
> Hello *.*,
> 
> > This patch works around a max shebang length issue
> > in llvm's llvm-config.
> >
> 
> Sorry guys, I garbled the patch in the first submission. I already
> changed the first submission's patch state to "not applicable" in
> patchwork and resent it. Just want to make sure no one tries to apply
> my first submission to this issue. Patchwork already has the sane
> diff.
> 
> Some feedback on the patch would be great.
> 
> Regards,
> Thilo

Hi Thilo,

I am a bit short of time at the moment. So I can not test or apply your patch.
For the longer term llvm should go to core.

Bye Henning


