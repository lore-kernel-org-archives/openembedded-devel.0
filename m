Received: from [67.19.73.58] (helo=pug.o-hand.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <openembedded@haerwu.biz>) id 1Iup24-0007nX-HT
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 13:50:20 +0100
Received: from home.lan (c62-222.icpnet.pl [62.21.62.222])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by pug.o-hand.com (Postfix) with ESMTP id 7FCBF10CC19D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 08:11:46 -0500 (EST)
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2007 13:47:56 +0100
User-Agent: KMail/1.9.7
References: <4743FB40.1030307@gmail.com>
In-Reply-To: <4743FB40.1030307@gmail.com>
MIME-Version: 1.0
Message-Id: <200711211347.58538.openembedded@haerwu.biz>
Subject: Re: gfortran needed on host to compile gcc >= 4.1.2
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
X-List-Received-Date: Wed, 21 Nov 2007 12:50:20 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia =B6roda, 21 listopada 2007, Junqian Gordon Xu napisa=B3:
> I took the liberty to enable gfortran for gcc_4.1.2 (hence gcc >=3D 4.1.2
> has fortran enabled). The side effect is that you need to install
> gfortran or g77 on your host to compile it.

Can I still build gcc(-cross) without gfortran when gfortran is not=20
installed on host? If not they I would call it ugly regression...

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

   Fear leads to anger, anger leads to hate, hate... leads to suffering.
   		-- Yoda


