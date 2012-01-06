Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RiyCk-0001Y8-Cf
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jan 2012 02:02:46 +0100
Received: by dake40 with SMTP id e40so548965dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2012 16:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=nttjH43Y+Elov54Jp1N2CUkwbgO6egaAuxev6BOCzFg=;
	b=SeovABMPQXhN1u+Ecd1aiyvasRor1pAlMyQk9Fq6jvk3I2LpWtA7qWTMyc1OK6IfxQ
	y7GIw2LYm2RwbXPnhOwjYMnGvlNAT/LrVirCO+mqZRkaVkq81uFKUKEp0zeqvPDXoYLg
	/7mwtS0sqGY0iAsiT206QAsJvYnuZjn5I1drA=
MIME-Version: 1.0
Received: by 10.68.213.228 with SMTP id nv4mr10342764pbc.52.1325811322063;
	Thu, 05 Jan 2012 16:55:22 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Thu, 5 Jan 2012 16:55:22 -0800 (PST)
Date: Fri, 6 Jan 2012 01:55:22 +0100
Message-ID: <CAAQYJAtg4nTEypofzvD+XgCs5wqi38ubs1hvD+fL7v+H-jJA5w@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe-classic] schroedinger build failure
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
X-List-Received-Date: Fri, 06 Jan 2012 01:02:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hint for the developers still using the org.openembedded.dev
repository (oe-classic): i bump this old thread because apparently the
issue is not fixed and the build of schroedinger fails as reported on
#oe by new guests.

http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-April/032042.html

I'm sorry but I don't work anymore on oe-classic so can't commit the
patch for orc, maybe the issue can be resolved properly using the
latest versions.


Regards

Andrea


