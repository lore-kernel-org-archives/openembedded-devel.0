Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.com>) id 1Kje2u-0002oA-Hj
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Sep 2008 19:57:32 +0200
Received: from 124-10-82-105.static.tfn.net.tw ([124.10.82.105] helo=localhost)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.63) (envelope-from <john_lee@openmoko.com>)
	id 1Kjdyw-00062I-HY; Sun, 28 Sep 2008 01:53:37 +0800
Date: Sun, 28 Sep 2008 01:53:17 +0800
From: John Lee <john_lee@openmoko.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Beck <marc-andre_beck@gmx.ch>
Message-ID: <20080927175317.GA12360@localhost>
Mail-Followup-To: =?iso-8859-1?Q?Marc-Andr=E9?= Beck <marc-andre_beck@gmx.ch>, 
	openembedded-devel@lists.openembedded.org,
	devel@lists.openmoko.org
References: <48DE38A3.7090300@gmx.ch>
MIME-Version: 1.0
In-Reply-To: <48DE38A3.7090300@gmx.ch>
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
X-SA-Exim-Connect-IP: 124.10.82.105
X-SA-Exim-Mail-From: john_lee@openmoko.com
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Cc: openembedded-devel@lists.openembedded.org, devel@lists.openmoko.org
Subject: Re: OpenEmbedded on Multilib (64/32 bit) computers
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
X-List-Received-Date: Sat, 27 Sep 2008 17:57:33 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Sep 27, 2008 at 03:44:03PM +0200, Marc-André Beck wrote:
> Hi all
>
> I recently wanted to compile a complete OpenMoko asu image using 
> MokoMakefile on a Gentoo Multilib (64/32 bit) machine. This didn't work out 
> [3] and i found a closed bug [1] regarding my problem in the OpenEmbedded 
> bug tracker that was fixed by a commit [2] from polyonymous. Still the 
> patch wasn't included upstream. What are the reasons? Should the bug be 
> reopened?

Not sure what you meant by wasn't included upstream, but the [2] is
already in

http://git.openmoko.org/?p=openmoko.git;a=commit;h=313dd69d6e2be1636b81e42da8544395536616f6

>
> Sincerely, Marc-André
>
>
> [1] http://bugs.openembedded.net/show_bug.cgi?id=3988
> [2] 
> http://gitweb.openembedded.net/?p=org.openembedded.dev.git;a=commit;h=313dd69d6e2be1636b81e42da8544395536616f6
>
> [3] Attachment: pth-2.0.2-r0.log



