Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Nnws6-00051G-5X
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Mar 2010 17:28:59 +0100
Received: from [192.168.1.5] (e180129204.adsl.alicedsl.de [85.180.129.204])
	by drlauer-research.com (Postfix) with ESMTP id 495E05841A5
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Mar 2010 17:26:28 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1267887520.11175.17.camel@rex>
References: <87hbou4x8f.fsf@SSpaeth.de>
	<F5DBF875-2CE0-4218-A2FD-45E83EE3AADD@vanille-media.de>
	<1267887520.11175.17.camel@rex>
Organization: Vanille-Media
Date: Sat, 06 Mar 2010 17:25:51 +0100
Message-ID: <1267892751.21528.16.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Convert vala to new world staging
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
X-List-Received-Date: Sat, 06 Mar 2010 16:28:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Samstag, den 06.03.2010, 06:58 -0800 schrieb Richard Purdie:
> Target packages should not be installing things into the native sysroot.
> The reason why is when we come to start using staging packages, these
> staging packages are going to have a dependency on the specific build
> system they were built on.
> 
> If these files are architecture independent I'd suggest putting them in
> an architecture independent path (which native sysroot is not)

That would be possible, but Vala needs to be patched to look there then.

-- 
:M:



