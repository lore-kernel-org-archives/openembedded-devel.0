Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MOSPk-0004uV-3D
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jul 2009 10:22:04 +0200
Received: by ewy21 with SMTP id 21so5886774ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jul 2009 01:09:24 -0700 (PDT)
Received: by 10.210.114.15 with SMTP id m15mr4477840ebc.90.1247040564283;
	Wed, 08 Jul 2009 01:09:24 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 27sm4320984ewy.51.2009.07.08.01.09.23
	(version=SSLv3 cipher=RC4-MD5); Wed, 08 Jul 2009 01:09:23 -0700 (PDT)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1247034015.4669.25.camel@opal>
References: <200907021504.13248.holger+oe@freyther.de>
	<1247034015.4669.25.camel@opal>
Date: Wed, 08 Jul 2009 09:09:22 +0100
Message-Id: <1247040562.3340.9.camel@xora-desktop.xora.org.uk>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.2 (2.26.2-1.fc11) 
Subject: Re: Questions regarding DISTRO = "minimal"
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
X-List-Received-Date: Wed, 08 Jul 2009 08:22:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-07-08 at 08:20 +0200, Michael 'Mickey' Lauer wrote:
> There was the hope that eventually the Angstrom folks would realize the
> benefit of that and would also move to more reusable config files. Alas,
> due to the social problems in our community this didn't happend and will
> probably never.
> 

Don't we think its time for the Angstrom bashing to stop. Just because
we disagree with you on a technical level doesn't mean there are "social
problems"

Making the toolchain selection generic means that when you want to swap
toolchains on a DISTRO you have to test and rebuild all DISTROs for all
targets. It took us about 5 days to do the last toolchain test for
Angstrom (not counting the weeks I spent testing various configs before
we switched), I would prefer not to have to redo that test for everyone
elses DISTRO making it at least a months (6 months) work.

Graeme (XorA)




