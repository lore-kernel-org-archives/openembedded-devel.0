Received: from [68.142.207.138] (helo=web32207.mail.mud.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <frannk_m1@yahoo.com>) id 1MgVUC-0004ec-QD
	for openembedded-devel@openembedded.org; Thu, 27 Aug 2009 05:17:17 +0200
Received: (qmail 13679 invoked by uid 60001); 27 Aug 2009 02:59:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1251341953; bh=zSQ5IAnkBpu0CEJHGmaHqKYe8vl1Uho1pOimn5VlZJI=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=MRZpWH/7MbFFr8/rmrI8xGOJc3UpXDEUVxA1SyqYiUYrUQgyImMJU8djT21/ZN2AngEX3mWFALixvWsK3haSvsKdqlj88RHl1DJzwgMYIZ7rWGskwAtUcm0u2Dt+UjPOlbaC5C7se79DZdbP8ial57utKMZv0yPHHVuX7XoVNUE=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=YEdarFR5cbeq4yM2DFdK/aijclFDYHA0SHVegnhlxL7PdKMtE5dTpeLwIJlFD0F5kxj5eCdujO33rajLblObPt6ONErnCTTxKv4Z5BgQC6Ii+xB1J71fQYWCgEV7ST5D2NGg1n7bBpiyAdu3P/SIiOrME4a/W+mMWAnwX5ffsXw=;
Message-ID: <570367.11793.qm@web32207.mail.mud.yahoo.com>
X-YMail-OSG: x2nX7MkVM1njmmmWr44ZBGDoobzdjQHESSf2Ee7Cl9OQCXyKWQd__z7v8eUYQKmT1tI99ZA97InDxbzsnocqbCwCPLCnaVlq6jK73gg8SFqysZMPccHM7ebYYfQ2BeOkqK4SibgieCjTOwVK3y0DkqTF1o.GECsbotodEpSGNEMBfPvy.7iYbhDitCtyCdWzF2kvJwQfuoIDu5qd06BeC7gzwEsxSvg8VyEPQm724VSKkKMlWoS9MLzdNbRRO3zr7Jrm4E8fPNj003RtynhpxOz6Jr7Pu4ylMpHxqQQb1.A8P076olJlWmRZjln3NDggM_hcPd1temk5kaarOu5J5YtHmWqMYnEGvDB8BVZOPmBicJQeYLJ61OvaHOGN6uiHm3865PQxGg--
Received: from [24.23.223.133] by web32207.mail.mud.yahoo.com via HTTP;
	Wed, 26 Aug 2009 19:59:13 PDT
X-Mailer: YahooMailClassic/6.1.2 YahooMailWebService/0.7.338.2
Date: Wed, 26 Aug 2009 19:59:13 -0700 (PDT)
From: Frank <frannk_m1@yahoo.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <578E0D7769137447A5A8468024190AE718B73FAEE8@VMBX115.ihostexchange.net>
MIME-Version: 1.0
Subject: Re: Contract work
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
X-List-Received-Date: Thu, 27 Aug 2009 03:17:19 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

What's the hourly rate?=0A=0A--- On Wed, 8/26/09, Roman Lisagor <rlisagor@w=
urldtech.com> wrote:=0A=0A> From: Roman Lisagor <rlisagor@wurldtech.com>=0A=
> Subject: [oe] Contract work=0A> To: "openembedded-devel@lists.openembedde=
d.org" <openembedded-devel@lists.openembedded.org>=0A> Date: Wednesday, Aug=
ust 26, 2009, 2:45 PM=0A> Dear OE developers,=0A> =0A> I work for Wurldtech=
 Security Technologies in Vancouver,=0A> Canada. We are currently creating =
a network appliance (a=0A> firewall) and would like to use OpenEmbedded for=
 the=0A> project. I've been fairly successful in trying to get the=0A> syst=
em to build; however, there have been some breakages and=0A> not all the pa=
ckages we need are currently available as=0A> recipes.=0A> =0A> Unfortunate=
ly we don't have the manpower to perform all the=0A> customizations ourselv=
es, so we're looking for outside help!=0A> If any of you are interested in =
doing some contract-based=0A> work, please send me an email and let me know=
. I can then=0A> send you a more detailed description of what we need. We a=
re=0A> currently collecting estimates and would like to get started=0A> soo=
n.=0A> =0A> Thanks in advance!=0A> =0A> Roman=0A> =0A> [cid:image001.png@01=
CA265B.EBC312F0]=0A> Roman Lisagor=0A> Senior Software Developer=0A> Wurldt=
ech Security Technologies Inc.=0A> Suite 1680 - 401 West Georgia St.=0A> Va=
ncouver, B.C.=A0 V6B 5A1=0A> Canada=0A> Phone:=A0 =A0 =A0=A0=A0+ 1.604.669.=
6674=0A> Toll Free:=A0=A0=A0+ 1.877.369.6674=0A> Fax:=A0 =A0 =A0 =A0 =A0=A0=
=A0+=0A> 1.604.669.2902=0A> Website:=A0 =A0 http://www.wurldtech.com/=0A> =
=0A> =0A> "ARE YOU ACHILLES CERTIFIED?"=0A> =0A> =0A> This message is inten=
ded only for the named=0A> recipients.=A0 This message may contain informat=
ion that=0A> is privileged, confidential or exempt from disclosure under=0A=
> applicable law.=A0 Any dissemination or copying of this=0A> message by an=
yone other than a named recipient is strictly=0A> prohibited.=A0 If you are=
 not a named recipient or an=0A> employee or agent responsible for deliveri=
ng this message to=0A> a named recipient, please notify us immediately by t=
elephone=0A> at 604-669-6674, and permanently destroy this message and=0A> =
any copies you may have. Email may not be secure unless=0A> properly encryp=
ted.=0A> =0A> =0A> -----Inline Attachment Follows-----=0A> =0A> ___________=
____________________________________=0A> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A> http://lists.linuxtogo.org/=
cgi-bin/mailman/listinfo/openembedded-devel=0A> =0A=0A=0A      


