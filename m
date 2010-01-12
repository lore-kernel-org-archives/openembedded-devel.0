Received: from mail-gx0-f217.google.com ([209.85.217.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NUhOF-0001o1-R8
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 15:06:39 +0100
Received: by gxk9 with SMTP id 9so48972093gxk.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 06:04:26 -0800 (PST)
Received: by 10.101.164.4 with SMTP id r4mr235047ano.189.1263305065930;
	Tue, 12 Jan 2010 06:04:25 -0800 (PST)
Received: from xora-eee.xora.org.uk ([12.69.71.130])
	by mx.google.com with ESMTPS id 13sm12885191gxk.5.2010.01.12.06.04.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 12 Jan 2010 06:04:24 -0800 (PST)
Received: by xora-eee.xora.org.uk (Postfix, from userid 500)
	id E024F21438; Tue, 12 Jan 2010 08:04:13 -0600 (CST)
Date: Tue, 12 Jan 2010 08:04:13 -0600
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100112140413.GA2098@xora-eee.xora.org.uk>
References: <hihuv8$b6u$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hihuv8$b6u$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 209.85.217.217
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC][PATCH] Move udev cache creation after checkroot
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
X-List-Received-Date: Tue, 12 Jan 2010 14:06:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2010 at 02:54:48PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> What's your opinion on attached (untested) patch? If there's some
> consensus that this is a step in the right direction I'll create a
> working & tested patch to commit.
> 
> Nota bene: I'm not going to discuss the merits of udev caching, only the
> impact of this patch to the current situation.
> 
That patch seems to match what I have been saying but not had time
to code.

Acked-by: Graeme Gregory <dp@xora.org.uk>




