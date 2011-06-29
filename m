Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qbx1l-0000VT-4K
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jun 2011 17:50:09 +0200
Received: (qmail invoked by alias); 29 Jun 2011 15:46:23 -0000
Received: from p5B0A22BD.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.34.189]
	by mail.gmx.net (mp015) with SMTP; 29 Jun 2011 17:46:23 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+JH3UhOqaJK0Gl1/TGDomKwQUyP17zcwyyGZIcAj
	ey7Y9tnYLHCdLE
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jun 2011 17:48:08 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <201106291728.47032.schnitzeltony@gmx.de>
	<BANLkTin06jiHrgrf2C3eEbkdVrtcYyOShQ@mail.gmail.com>
In-Reply-To: <BANLkTin06jiHrgrf2C3eEbkdVrtcYyOShQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201106291748.09067.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: In which meta/layer is a home for not yet supported machines
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
X-List-Received-Date: Wed, 29 Jun 2011 15:50:09 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday, June 29, 2011 05:32:54 PM Khem Raj wrote:
> you would need meta layer for the new machines. There already are some
> layers checkout angstrom 
AFAIK there is no machine conf in angstrom
> if the machines do not fit into those existing
> you can create a new
> layer something like meta-gumstix
Open and maintain git-repos

meta-gumstix
meta-freescale
meta-karo

and get them supported by angstrom? Is that a solution for a hobbyist dev (not 
working for one of these companies)? Or wait until the companies will get this 
done?

sorry but maybe I am missing something

Andreas


