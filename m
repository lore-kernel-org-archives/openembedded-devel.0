Received: from mail-ew0-f168.google.com ([209.85.219.168])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NE4S0-0006EO-2O
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Nov 2009 18:17:47 +0100
Received: by ewy8 with SMTP id 8so583529ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Nov 2009 09:16:12 -0800 (PST)
Received: by 10.213.0.144 with SMTP id 16mr1461471ebb.38.1259342172457;
	Fri, 27 Nov 2009 09:16:12 -0800 (PST)
Received: from localhost (188-220-34-37.zone11.bethere.co.uk [188.220.34.37])
	by mx.google.com with ESMTPS id 15sm1021324ewy.0.2009.11.27.09.16.11
	(version=SSLv3 cipher=RC4-MD5); Fri, 27 Nov 2009 09:16:12 -0800 (PST)
Date: Fri, 27 Nov 2009 17:16:16 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091127171616.2b52f1c2@xora.org.uk>
In-Reply-To: <loom.20091127T175942-262@post.gmane.org>
References: <loom.20091127T012624-591@post.gmane.org>
	<20091127081623.7155d194@xora.org.uk>
	<loom.20091127T175942-262@post.gmane.org>
X-Mailer: Claws Mail 3.7.3 (GTK+ 2.18.3; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.219.168
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gcc-cross-4.3.3 build failure - PPC/Sequoia
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
X-List-Received-Date: Fri, 27 Nov 2009 17:17:47 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Nov 2009 17:01:58 +0000 (UTC)
Jeremy Williams <jerm7861@yahoo.com> wrote:

> Graeme Gregory <dp <at> xora.org.uk> writes:
> > I had already found this and have been testing a fix, will commit
> > later today!
> 
> Graeme,
>   I was going to apply a fix (it is pretty simple) as well but I
> thought it made more sense to wait for Koen to review to give him a
> chance to revert? This commit probably needs to be completely removed
> due to its impacts.
> 
I was in discussion with koen when I found the problem yesterday!

Graeme


