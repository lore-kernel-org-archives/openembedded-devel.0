Received: from [208.30.173.93] (helo=na.colfaxcorporation.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <james.newell@colfaxcorp.com>) id 1MBJEf-0006yj-V9
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Jun 2009 03:56:18 +0200
Received: from ([192.168.3.77])
	by susmnrap020.na.colfaxcorporation.net with ESMTP  id 5s6d1j1.3556457; 
	Mon, 01 Jun 2009 21:47:24 -0400
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 1 Jun 2009 21:47:23 -0400
Message-ID: <F006973C7BA4F048BE0A9AF40B69189C23DA61@susmnrex004.na.colfaxcorporation.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: How do you  add libstdc++ to the micro-image distro?
Thread-Index: AcnjJBNDtAeqOJaUTYiV9+VVWZtdqA==
From: "Newell, James C." <James.Newell@colfaxcorp.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: How do you add libstdc++ to the micro-image distro?
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
X-List-Received-Date: Tue, 02 Jun 2009 01:56:18 -0000
Content-class: urn:content-classes:message
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="us-ascii"

Hello,=0D=0A=0D=0AI am fairly new to the openembedded project=2E  I'm attem=
pting to add a=0D=0Ac++ application to the micro-image distro for experimen=
ting with oe,=0D=0Abut it doesn't include a stdc++=2E   How would one add l=
ibstdc++ to the=0D=0Amicro image distro?  Adding libstdc++ and a few other =
attempts to the=0D=0AIMAGE_INSTALL variable in recipes/images/micro-image=
=2Ebb doesn't seem to=0D=0Awork=2E  Any help is appreciated=2E=0D=0A=0D=0AR=
egards,=0D=0A=0D=0AJim=0D=0A=0D=0A=0D=0A-----------------------------------=
------=0D=0ACONFIDENTIALITY NOTICE: If you have received this e-mail in err=
or,=0Aplease immediately notify the sender by e-mail at the address=0Ashown=
=2E  This e-mail transmission may contain confidential=0Ainformation=2E  Th=
is information is intended only for the use of the=0Aindividual(s) or entit=
y to whom it is intended even if addressed=0Aincorrectly=2E  Please delete =
it from your files if you are not the=0Aintended recipient=2E  Thank you fo=
r your compliance=2E=0D=0A


