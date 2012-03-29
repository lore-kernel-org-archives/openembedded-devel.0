Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1SDEh1-0008JH-Cj
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 14:43:07 +0200
Received: from [2001:638:602:1183:f2de:f1ff:fe62:28f7]
	(helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1SDDsw-0002bt-SE by authid <stefan@sostec.de> with srv_auth_cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Mar 2012 13:51:28 +0200
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.77)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1SDDuy-00059s-Qq for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 13:53:28 +0200
Date: Thu, 29 Mar 2012 13:53:28 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120329115328.GA20337@novatech.datenfreihafen.org>
References: <4F7444E0.400@mlbassoc.com> <4F7446F9.9090304@opendreambox.org>
	<4F744944.7070701@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <4F744944.7070701@mlbassoc.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: Where are my patches going?
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
X-List-Received-Date: Thu, 29 Mar 2012 12:43:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2012-03-29 at 05:36, Gary Thomas wrote:
> On 2012-03-29 05:26, Andreas Oberritter wrote:
> >
> >On 29.03.2012 13:17, Gary Thomas wrote:
> >>A number of times when I've sent patches to the list via 'git send-email',
> >>they seem to never arrive.  How can I figure out where they are going?
> >
> >your patches arrived. You can find submitted patches in OE's patchwork
> >installation [1] or in the mailing list archive [2] some minutes after
> >they have been sent.
> 
> That's good to hear, but why am I not seeing them on the list?

If you have been on the CC list, IIRC default option in git
send-email, it is likely that mailman has just dropped you from the
receiver list for these mails as you already got it in CC thus
avoiding duplicates. Something that can be configured in
mailman if desired.

regards
Stefan Schmidt


