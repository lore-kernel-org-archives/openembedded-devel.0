Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1Lexmz-0003im-1Y
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 21:34:01 +0100
Received: (qmail 24168 invoked by uid 813007); 4 Mar 2009 20:29:47 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 20:29:47 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 4 Mar 2009 21:29:39 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc6-00216-g778ef1e; KDE/4.2.0; x86_64; ;
	)
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-15-git-send-email-openembedded@haerwu.biz>
	<20090304195333.GY26343@smtp.west.cox.net>
In-Reply-To: <20090304195333.GY26343@smtp.west.cox.net>
MIME-Version: 1.0
Message-Id: <200903042129.39964.openembedded@haerwu.biz>
Subject: Re: [PATCH 14/70] Add yum-native and createrepo (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 20:34:01 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 04 of March 2009 20:53:33 Tom Rini wrote:
> > +++ b/packages/yum/yum-native_3.2.18.bb
>
> Fails to compile, MACHINE=3Dnokia800 DISTRO=3Dminimal,
> BB_NUMBER_THREADS=3D4 PARALLE_MAKE=3D"-j 6". =A0See
> http://pastebin.com/m36a992fb

fixed

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




