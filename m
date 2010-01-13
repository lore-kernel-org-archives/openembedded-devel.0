Received: from n71.bullet.mail.sp1.yahoo.com ([98.136.44.36])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <gagan2172@yahoo.com>) id 1NV4sf-0004Di-UN
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 16:11:37 +0100
Received: from [216.252.122.219] by n71.bullet.mail.sp1.yahoo.com with NNFMP;
	13 Jan 2010 15:06:16 -0000
Received: from [67.195.9.81] by t4.bullet.sp1.yahoo.com with NNFMP;
	13 Jan 2010 15:06:16 -0000
Received: from [98.137.27.129] by t1.bullet.mail.gq1.yahoo.com with NNFMP;
	13 Jan 2010 15:06:16 -0000
Received: from [127.0.0.1] by omp203.mail.gq1.yahoo.com with NNFMP;
	13 Jan 2010 15:06:16 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 555185.86699.bm@omp203.mail.gq1.yahoo.com
Received: (qmail 23354 invoked by uid 60001); 13 Jan 2010 15:06:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1263395176; bh=CvD82EWkZiB1oKew7VeFWFIRKNAa0jUZQ1whJWTn2hQ=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=h2Qqb//n6uDqyKeKOYohB6fssg8LorHTGIgjjQIdL/TOSNPoRzqtAtB5DHYdD60anBkcwJb74eYGE7QvbWYJ5/9hzcPuyDzkkeijTcNdlp9dq4EDKgIzpw3KvUdFmTRfPib71CKjIPm7oxUVEYgTTf76XJY7SwHusr53hkxbeHA=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type;
	b=2Kl2lqMABA+urlUtIFKS0qEFWwAFNSsW3cIE9TlgMRZNkZYtphmdJOEVYbuxF2jDaP+SndkgZBdb6e7qWyKXlPvA4DUOYrcVtrNo7P8vWD9hIETImIOJcpcQiZKcuekL/qCnXTp02FpmYdLryMP8t7cHbd7B/6SaL07stVSjy9U=;
Message-ID: <353547.18069.qm@web112505.mail.gq1.yahoo.com>
X-YMail-OSG: DGQGcvMVM1lLCLeyXG9WvHjnafrV0gjRxxpViR00UbK4lPICib83TSk6X0piYRcNBAaW1EEcd_LYYcuuDrxC9Zb9r1f6FDBAhIOH19kRfCcCx1HscMi9mB6.NozlJwhl3WkOZ5b60Tg3nQ.SEFNTxZqPVK90hC_kovcQLCujZkonOuREAtkz67WWtlF_Rvrzr3_GH74WrRFZRfGcvp8yaT7GE5__lnDr5BqJo8PUy8z3dxeEXoi9QVC_xNcdScEDX_xE71Ckj5CB5y6.CUxvFrf01TJBMOZlN8dmfOp2IYpd58Eg92Fn4vXehatIDp.uLa9OuvEVlJWCTRo8hTy5XIiAy9R1XUfVlxgdlgWwjyAAx_PcGm7K0ft.5IwO2bijvVeEW2lfMtrvygnddSYvSZ9d1Q5fKjiZPbS.MsEGLHgUud0NxeGbX.HRcgas9y0XmnZo7uqMWwT9JTIUUHap6h66nNByqImL1wFwhZepEg1mPHPAgd3MGYwyKkFwSREsAEcVIVrIPGfZdMPL_vOPAl4tT22dt99WUQfeLCw.HVBXgVsY.d0IFUrXS7TpClB56WcXuw2kAF6.oZdmsAea
Received: from [62.254.217.177] by web112505.mail.gq1.yahoo.com via HTTP;
	Wed, 13 Jan 2010 07:06:16 PST
X-Mailer: YahooMailClassic/9.0.20 YahooMailWebService/0.8.100.260964
Date: Wed, 13 Jan 2010 07:06:16 -0800 (PST)
From: gagan singh <gagan2172@yahoo.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263314688.3675.435.camel@mill.internal.reciva.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 98.136.44.36
X-SA-Exim-Mail-From: gagan2172@yahoo.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: =?UTF-8?B?UmU6IERvZXMgT0XigJlzIEFuZ3N0cm9tIExpbnV4IHN1cHBvcnQgU01QIChTeW1tZXRyaWMgbXVsdGlwcm9jZXNzaW5nKSBvbiBiZWFnbGUgYm9hcmQu?=
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
X-List-Received-Date: Wed, 13 Jan 2010 15:11:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Phil,
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Th=
anks for the response. =C2=A0So you recon=C2=A0Asynchronous Multi-Processin=
g (AMP) concept is better suited in beagle board configuration.=C2=A0=C2=A0=
 If so what exactly I have to do in angstom to get such thing working.=20
=C2=A0
regards
=C2=A0
Gagan
=C2=A0
=C2=A0
--- On Tue, 1/12/10, Phil Blundell <philb@gnu.org> wrote:


From: Phil Blundell <philb@gnu.org>
Subject: Re: [oe] Does OE=E2=80=99s Angstrom Linux support SMP (Symmetric =
multiprocessing) on beagle board.
To: openembedded-devel@lists.openembedded.org
Date: Tuesday, January 12, 2010, 11:44 AM


I would have thought the interconnect performance would be the least of
your worries.=C2=A0 It seems that a rather bigger obstacle to running any
kind of SMP on this hardware would be the issue that the two cores have
different instruction sets: the DSP can't execute ARM code, and the ARM
can't execute DSP code.

p.

On Tue, 2010-01-12 at 07:51 -0800, gagan singh wrote:
> Hi Phil,
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=20
> I thought general response time of any general application time will be =
faster.
> Say Just getting a feeling of running General purpose Computer OS/applic=
ations=C2=A0 on a 1 GHz=C2=A0 processor while actually it is running on 500=
MHz CPU with SMP support(Keeping overhead time aside)
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DSP seems to remain idle most o=
f the time while everything runs on Arm core.=C2=A0 You says difficult to i=
mplement on that sort Of Cores. Do the inter communication link/memory inte=
rface=C2=A0 is bottle neck for implementing shared workload.
>=C2=A0=20
> regards
>=C2=A0=20
> Gagan
>=20
>=20
> --- On Tue, 1/12/10, Phil Blundell <philb@gnu.org> wrote:
>=20
>=20
> From: Phil Blundell <philb@gnu.org>
> Subject: Re: [oe] Does OE=E2=80=99s Angstrom Linux support SMP (Symmetri=
c multiprocessing) on beagle board.
> To: openembedded-devel@lists.openembedded.org
> Date: Tuesday, January 12, 2010, 10:06 AM
>=20
>=20
> On Tue, 2010-01-12 at 06:57 -0800, gagan singh wrote:
> >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Do the Angstrom version of Linux supports SMP for=C2=A0 Dual core (=
A8 + TI DSP 320C64x) beagle board. If not, where I should look in tutorial =
to work on adding support for such a feature.
> >=C2=A0 I try Google it but no much could be located.
>=20
> I'm not quite sure what you are trying to do here.=C2=A0 It's hard to im=
agine
> how you could have any meaningful kind of "symmetric" multiprocessing on
> that combination of cores.
>=20
> What exactly are you hoping to achieve?
>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
>=20
>=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




From rpjday@crashcourse.ca Wed Jan 13 16:12:15 2010
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NV4tI-0004Hy-Aw
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 16:12:15 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo
