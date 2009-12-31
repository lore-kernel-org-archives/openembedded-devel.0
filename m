Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NQI7H-0004Vu-2y
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Dec 2009 11:18:54 +0100
Received: by gxk7 with SMTP id 7so3058691gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2009 02:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=hZz4V4p/wlJx5xzplePfDyR+IdLNboDYBaNAfI+o4u0=;
	b=q72Y/6PzqqoK/rEAK3hO2mQVFSzryG/esPBxQ29whINO0o2Xk9wxMKX24eI2f2hGRJ
	BDPTNBTJpb8aQII2d66CJOac+Lu8mHttlRb/cj2DkC5aBx8TgPoSFPvlo1BMnLjJMvsf
	eFV9/qKdtH+OrvEAxsm49xsgLHvBRHQ0AZWxA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VHmC9QT+R+XYH6vNERSMkaw2a1fFYCyJWEfJN0Sr2qh7Ky5kFvEpUsGWwjtSco2f/6
	gf7oW8SjFim3qJamkLjkOfcer4jMs8hdwnsZlqrGC9m1Wg1wSOkDwIejQtsqIkaBwIdF
	GZXqF/ZYns+l+EWYrqnxQj0jPnzZLDfgD+ViM=
MIME-Version: 1.0
Received: by 10.101.139.20 with SMTP id r20mr13138931ann.100.1262254610790; 
	Thu, 31 Dec 2009 02:16:50 -0800 (PST)
In-Reply-To: <20091230144538.6a171e4e@xora-desktop.xora.org.uk>
References: <20091222140029.GF10910@xora.vm.bytemark.co.uk>
	<1261596258.8748.156.camel@dax.rpnet.com>
	<20091229155215.00006145@unknown> <hhdikl$25q$1@ger.gmane.org>
	<1262118637.8748.173.camel@dax.rpnet.com> <hhf42m$n7h$1@ger.gmane.org>
	<20091230144538.6a171e4e@xora-desktop.xora.org.uk>
Date: Thu, 31 Dec 2009 11:16:50 +0100
Message-ID: <ac9c93b10912310216m3c08fa80v11cc00029d16fdb7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [TSC] First Meeting
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
X-List-Received-Date: Thu, 31 Dec 2009 10:18:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Not sure if TSC is going to say things about technical issues, but if
so I would appreciate a statement of the TSC on whether classes should
define things that are really image or recipe specific.

As an example I would like to refer to the discussion in the thread
'Move IMAGE_BOOT stuff into distro's?" and the fact that the image
class drags in defaults for some system components.

However note that this is just an example. I would prefer a general statement.
Or is this outside the scope of TSC (and if so how do we resolve
technical issues without ending in a commit war (which is the last I
would see happen).

Frans.


