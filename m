Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1MUD7m-0002a5-Uw
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jul 2009 07:15:21 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.localnet)
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1MUCtt-000JJo-5R
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Jul 2009 09:00:57 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Jul 2009 09:00:51 +0400
User-Agent: KMail/1.11.4 (Linux/2.6.30-1-amd64; KDE/4.2.4; x86_64; ; )
References: <1248201134.26475.15.camel@dax.rpnet.com>
	<200907232141.13597.khimov@altell.ru>
	<1248386615.14790.43.camel@dax.rpnet.com>
In-Reply-To: <1248386615.14790.43.camel@dax.rpnet.com>
MIME-Version: 1.0
Message-Id: <200907240900.52746.khimov@altell.ru>
X-SpamTest-Envelope-From: khimov@altell.ru
X-SpamTest-Group-ID: 00000000
X-SpamTest-Info: Profiles 9142 [Jul 23 2009]
X-SpamTest-Info: {UDS BL}
X-SpamTest-Info: {DNSBL Rate: medium}
X-SpamTest-Method: none
X-SpamTest-Rate: 50
X-SpamTest-Status: Not detected
X-SpamTest-Status-Extended: not_detected
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0284], KAS30/Release
Subject: Re: [Bitbake-dev] Bitbake runqueue performance improvement
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
X-List-Received-Date: Fri, 24 Jul 2009 05:15:25 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On =D0=9F=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D0=B0 24 =D0=B8=D1=8E=D0=BB=D1=8F 2=
009 02:03:35 Richard Purdie wrote:
> On Thu, 2009-07-23 at 21:41 +0400, Roman I Khimov wrote:
> > On =D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 23 =D0=B8=D1=8E=D0=BB=D1=
=8F 2009 16:19:56 Richard Purdie wrote:
> > > The whole point is that we want the dependencies to be clear. Your
> > > approach is anything but clear IMO.
> >
> > Well, using DEPENDS for dependencies still looks way better to me, but
> > feel free to revert it.
>
> Are there recipes in OE which need fixing prior to that happening?

I don't think so, at least I've not pushed any inter-image dependencies via=
=20
DEPENDS myself.


