Received: from mo3.mail-out.ovh.net ([178.32.228.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TK4OB-0007fg-By
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 11:40:11 +0200
Received: from mail637.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo3.mail-out.ovh.net (Postfix) with SMTP id 0077FFFB50B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2012 11:00:00 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 5 Oct 2012 10:51:23 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 5 Oct 2012 10:51:20 +0200
Date: Fri, 5 Oct 2012 10:51:03 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Marco Guerri <gmarco.dev@gmail.com>
X-Ovh-Mailout: 178.32.228.3 (mo3.mail-out.ovh.net)
Message-ID: <20121005105103.162c1a06@eb-e6520>
In-Reply-To: <CA+qOGFeWVKCCaU3VtJ50C9wEEQN9=EgTAUKO3qxBsfabi8QCaQ@mail.gmail.com>
References: <CA+qOGFeWVKCCaU3VtJ50C9wEEQN9=EgTAUKO3qxBsfabi8QCaQ@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.1 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 11495438050555178313
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehuddrtdekucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehuddrtdekucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: External toolchain - Helloworld works but help needed
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
X-List-Received-Date: Fri, 05 Oct 2012 09:40:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Marco,

Le Thu, 4 Oct 2012 16:16:44 +0200,
Marco Guerri <gmarco.dev@gmail.com> a =E9crit :
> I'm having some troubles trying to get a working filesystem for a custom
> board based on a Freescale iMX35 SOC.

you can find our working BSP for an i.MX35 board here :
https://github.com/eukrea/meta-eukrea
(use MACHINE=3D"eukrea-cpuimx35")

Best regards
Eric


