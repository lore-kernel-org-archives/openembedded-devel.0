Received: from [128.178.50.22] (helo=smtp1.epfl.ch)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <valentin.longchamp@epfl.ch>) id 1J8djp-00089Z-Ss
	for openembedded-devel@openembedded.org; Sat, 29 Dec 2007 16:36:37 +0100
Received: (qmail 20880 invoked by uid 107); 29 Dec 2007 15:30:35 -0000
Received: from mailav3.epfl.ch (128.178.50.11)
	by smtp1.epfl.ch with SMTP; 29 Dec 2007 15:30:35 -0000
Received: from (unknown [128.178.50.22]) by MAILAV3.epfl.ch with smtp
	id 155a_fda72f1a_b622_11dc_9fa4_0014221528b0;
	Sat, 29 Dec 2007 16:30:35 +0100
Received: from 217-162-224-198.dclient.hispeed.ch (217.162.224.198)
	(authenticated) by smtp1.epfl.ch (AngelmatoPhylax SMTP proxy);
	Sat, 29 Dec 2007 16:30:35 +0100
From: Valentin Longchamp <valentin.longchamp@epfl.ch>
Organization: EPFL STI-IPR-LSRO1
To: openembedded-devel@openembedded.org
Date: Sat, 29 Dec 2007 16:30:29 +0100
User-Agent: KMail/1.9.6 (enterprise 0.20070907.709405)
MIME-Version: 1.0
Message-Id: <200712291630.29205.valentin.longchamp@epfl.ch>
Subject: New arch in OE
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
X-List-Received-Date: Sat, 29 Dec 2007 15:36:38 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I would like to add a new arch to OE since I have been building a distro for 
our new system using this system.

The system is a robotics aimed custom-designed board which is based on a 
i.MX31 SoC. I have a custom kernel, so I will need a new kernel recipe 
(already exists, based on mx31ads kernel recipe by Liam) and I have added a 
few custom config files for our needs (for USB networking config and drivers 
for instance).

I would like to include all these changes to the OE "mainline" and become the 
maintainer for this arch. How could I do this easily ?

My second question is more about the chosen distro. I have been using 
Angstrom, because it is one the most well known disto based on OE and use the 
minimal images of Angstrom to have a usable but light system. Is this good or 
is there a distro that is better suited to my needs (for instance I don't 
need for now avahi or these kind of things) ?

Thank you, best regards and I wish you all the best for 2008 (keep rocking on 
with OE !)

-- 
Valentin Longchamp
PhD Student
http://people.epfl.ch/valentin.longchamp


