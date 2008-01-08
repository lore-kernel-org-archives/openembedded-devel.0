Received: from [128.178.50.133] (helo=smtp2.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1JCGnP-0001lZ-EM
	for openembedded-devel@openembedded.org; Tue, 08 Jan 2008 16:55:19 +0100
Received: (qmail 19156 invoked by uid 107); 8 Jan 2008 15:21:38 -0000
Received: from mailav2.epfl.ch (128.178.50.191)
	by smtp2.epfl.ch with SMTP; 8 Jan 2008 15:21:38 -0000
Received: from (unknown [128.178.50.133]) by MAILAV2.epfl.ch with smtp
	id 6699_6631029a_bdfd_11dc_8e97_00114337c797;
	Tue, 08 Jan 2008 16:21:37 +0100
Received: from unknown (138.131.217.87) (authenticated)
	by smtp2.epfl.ch (AngelmatoPhylax SMTP proxy);
	Tue, 08 Jan 2008 16:21:38 +0100
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
Organization: EPFL STI-IPR-LSRO1
To: openembedded-devel@lists.openembedded.org
Date: Tue, 8 Jan 2008 16:21:33 +0100
User-Agent: KMail/1.9.6 (enterprise 0.20070907.709405)
References: <200712291630.29205.valentin.longchamp@epfl.ch>
	<1199011529.4654.4.camel@localhost.localdomain>
In-Reply-To: <1199011529.4654.4.camel@localhost.localdomain>
MIME-Version: 1.0
Message-Id: <200801081621.33852.valentin.longchamp@epfl.ch>
Subject: Re: New arch in OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2008 15:55:19 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard Purdie wrote:
> > The system is a robotics aimed custom-designed board which is based on a
> > i.MX31 SoC. I have a custom kernel, so I will need a new kernel recipe
> > (already exists, based on mx31ads kernel recipe by Liam) and I have added
> > a few custom config files for our needs (for USB networking config and
> > drivers for instance).
> >
> > I would like to include all these changes to the OE "mainline" and become
> > the maintainer for this arch. How could I do this easily ?
>
> The first step is to post what you have to the bugzilla, we can then
> review it.

OK, I have added it as the bug 3647 !

-- 
Valentin Longchamp
PhD Student
http://people.epfl.ch/valentin.longchamp


