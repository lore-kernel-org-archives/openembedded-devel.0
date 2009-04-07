Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1Lr6kt-0001yw-LS
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 10:34:34 +0200
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.115])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1Lr6i1-000BFS-QH
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Apr 2009 12:31:06 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Tue, 7 Apr 2009 12:31:01 +0400
User-Agent: KMail/1.9.9
References: <200904032354.43251.khimov@altell.ru>
	<19c1b8a90904061445o242b7eb9td783505faf876089@mail.gmail.com>
	<200904071012.28361.marcin@juszkiewicz.com.pl>
In-Reply-To: <200904071012.28361.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
Message-Id: <200904071231.01960.khimov@altell.ru>
X-SA-Exim-Connect-IP: 83.222.23.61
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_SOFTFAIL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] ace: New recipe for ACE 5.6.8
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
X-List-Received-Date: Tue, 07 Apr 2009 08:34:45 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tuesday 07 April 2009 12:12:21 Marcin Juszkiewicz wrote:
> Dnia poniedzia=C5=82ek, 6 kwietnia 2009 o 23:45:03 Khem Raj napisa=C5=82(=
a):
> > you could use the url =C2=A0in the license field. if there is one
>
> You can not. src_distribute.bbclass uses LICENSE field to group archives
> of sources and is enabled by default in =C3=85ngstr=C3=B6m. If package ha=
s own
> license then LICENSE =3D "ace" will be enough - if someone wants to check
> it then it is in archive with sources.

Well, I can do whatever is the best practice, just to note that there are=20
already recipes with URLs in LICENSE field, like

recipes/ixp4xx/ixp-osal_1.5.bb
recipes/ixp4xx/ixp4xx-csr_2.1.1.bb
recipes/tango/tango-icon-theme_0.8.1.bb

Also there are LICENSE_URL and LICENSE_HOMEPAGE found in recipes.


