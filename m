Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mok@mnet-online.de>) id 1NBmlN-0000Kg-Nl
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Nov 2009 11:00:20 +0100
Received: from mail01.m-online.net (mail.m-online.net [192.168.3.149])
	by mail-out.m-online.net (Postfix) with ESMTP id E396B1C0028F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2009 10:58:53 +0100 (CET)
Received: from localhost (dynscan2.mnet-online.de [192.168.1.215])
	by mail.m-online.net (Postfix) with ESMTP id AE1E49176F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2009 10:58:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.3.149])
	by localhost (dynscan2.mnet-online.de [192.168.1.215]) (amavisd-new,
	port 10024) with ESMTP id nHV85CgYUFTX
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2009 10:58:51 +0100 (CET)
Received: from mrdenker.palutemo (ppp-82-135-69-249.dynamic.mnet-online.de
	[82.135.69.249]) by mail.mnet-online.de (Postfix) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2009 10:58:51 +0100 (CET)
Received: by mrdenker.palutemo (sSMTP sendmail emulation);
	Sat, 21 Nov 2009 10:58:51 +0100
Date: Sat, 21 Nov 2009 10:58:51 +0100
From: Klaus 'mrmoku' Kurzmann <mok@mnet-online.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091121095851.GA29264@mrdenker.palutemo>
References: <1258755695-24978-1-git-send-email-mok@mnet-online.de>
	<he8bft$ttd$2@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <he8bft$ttd$2@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 212.18.0.10
X-SA-Exim-Mail-From: mok@mnet-online.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] extra packages for default illume keyboards
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
X-List-Received-Date: Sat, 21 Nov 2009 10:00:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, 21 Nov 2009, Koen Kooi wrote:

> On 20-11-09 23:21, mok@mnet-online.de wrote:
> >
> >Hello all,
> >
> >For SHR we want to be able to remove illumes default keyboard as most people
> >don't like it. To be able to do this nicely via the package manager we need to
> >have them in extra packages.
> >
> >The first patch just moves a bunch of custom illume keyboards to the correct
> >place (at least I think so :)

> I can't really see why all those keyboards need to have a different
> recipe, it looks like a single recipe could generate all the needed
> packages, no?
for the three default keyboards from illume it is one recipe. For the
others... I could do one illume-keyboards-shr_git.bb for them if that is
preferred. Might be cleaner, yes.

> regards,

> Koen

-- 
Klaus 'mrmoku' Kurzmann


