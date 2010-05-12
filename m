Received: from web57907.mail.re3.yahoo.com ([68.142.236.100])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <henryzhang62@yahoo.com>) id 1OCGtC-0002Wp-3E
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 20:42:40 +0200
Received: (qmail 40545 invoked by uid 60001); 12 May 2010 18:38:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1273689521; bh=/yAwyirMM9FLcmDpV2/Dz5FXCD4pSn8+UYTItiRpJg0=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=i0rVSHo2dslNrs0X516WPJV3UVshLSpcn1ozEenXDruVXJRGiEk2fFpXSgDPIvEfyfg8dQDzN/Hqsnqnfgrgxf/GUOjwBIXYcK/BUCOjNxv8WoqUavRoAhwIm3e2UJ0Yww17ELeZX34r7De2tzzLsi6vrXmDeTqjlqLb3pnfvZ4=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.com;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=rH1wTaYbHcwFuOHykLTvxtMmI3AURTf/LLLToIeDGwUCBkmHaOPisK6v1Q9VIVxszZ5XJ1GMCYGGUbS6G7yQh4J5UvsT6M3V8nHdbW1Smalv3ZNghDszP6t1ioBc0SFhnY2upxh/nC6YnM3jET33bR/GwRg0GP4wffUCgyYqtNs=;
Message-ID: <820761.37181.qm@web57907.mail.re3.yahoo.com>
X-YMail-OSG: CK2iowQVM1nc21GOlbTUyTIi2mfyxRSRY5HceCxyiWwl1Om
	AUaFMbw3RoD_HpJYzn2EsDsTul4vkot.VEfiFmnzYzJQVWDr0jG5iw2RnL7U
	FYJMtrDVXDF5RvAalRW84BosoKpYKIcuPr3pOJgrTaw7BqBcylhVpIT_JJqH
	9NSgtxHvW3IYkmKfgg1a6ZLslsJErtuJl3yJUAl7bnoOiRu4_YjvnfUFf16Y
	eGI4oqkwotZPb1Bmb_N25MSZF.hQ9vjrM58u5qJ.ZChfToNliNxfgklC0.Z.
	Bk9NOHnj_pamzpoTkhVV3_edlTl_FJ7do11d98TDPhCyqpI0QSuUcRl9mAU.
	IrAi_ivp0KINOSM4NUuqqHgYggaNzKI4-
Received: from [70.134.44.229] by web57907.mail.re3.yahoo.com via HTTP;
	Wed, 12 May 2010 11:38:41 PDT
X-Mailer: YahooMailClassic/10.1.11 YahooMailWebService/0.8.103.269680
Date: Wed, 12 May 2010 11:38:41 -0700 (PDT)
From: hong zhang <henryzhang62@yahoo.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinPyEXFpcArHS9CAcreilKlCWFeQ97UHWhicaHQ@mail.gmail.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 68.142.236.100
X-SA-Exim-Mail-From: henryzhang62@yahoo.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: eet: CROSS COMPILE Badness on x86_64 build machine
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
X-List-Received-Date: Wed, 12 May 2010 18:42:40 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Steve,=0A=0AI think I should use your tree for my overo but git failed.=0A=
=0Agit clone git://gitorious.org/gumstix-oe/mainline.git =0AInitialized emp=
ty Git repository in /stuff/mainline/.git/=0Aremote: Counting objects: 3320=
10, done.=0Aremote: Compressing objects: 100% (131317/131317), done.=0Afata=
l: The remote end hung up unexpectedly38 MiB | 199 KiB/s    =0Afatal: early=
 EOF=0Afatal: index-pack failed=0A=0AAny thing wrong?=0A=0A---henry=0A=0A--=
- On Wed, 5/12/10, Steve Sakoman <sakoman@gmail.com> wrote:=0A=0A> From: St=
eve Sakoman <sakoman@gmail.com>=0A> Subject: Re: [oe] eet: CROSS COMPILE Ba=
dness on x86_64 build machine=0A> To: openembedded-devel@lists.openembedded=
.org=0A> Date: Wednesday, May 12, 2010, 1:31 PM=0A> On Wed, May 12, 2010 at=
 11:14 AM,=0A> hong zhang <henryzhang62@yahoo.com>=0A> wrote:=0A> > what co=
mmand like bitbake xxx you used?=0A> =0A> I used bitbake eet=0A> =0A> Steve=
=0A> =0A> =0A> =0A> > --- On Wed, 5/12/10, Steve Sakoman <sakoman@gmail.com=
>=0A> wrote:=0A> >=0A> >> From: Steve Sakoman <sakoman@gmail.com>=0A> >> Su=
bject: [oe] eet: CROSS COMPILE Badness on x86_64=0A> build machine=0A> >> T=
o: "openembedded-devel" <openembedded-devel@lists.openembedded.org>=0A> >> =
Date: Wednesday, May 12, 2010, 1:08 PM=0A> >> Building from recent pull of =
oe.dev=0A> >> (yesterday)=0A> >>=0A> >> Anyone else seeing this?=0A> >>=0A>=
 >> Steve=0A> >>=0A> >>=0A> >> ERROR: function do_compile failed=0A> >> ERR=
OR: log data follows=0A> >>=0A> (/home/steve/overo-oe/tmp/work/armv7a-angst=
rom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/temp/log.do_compile.29091)=0A> >=
> | NOTE: make -j 4=0A> >> | make=A0 all-recursive=0A> >> | make[1]: Enteri=
ng directory=0A> >>=0A> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linu=
x-gnueabi/eet-2_1.1.0+svnr48617-r1/eet'=0A> >> | Making all in src=0A> >> |=
 make[2]: Entering directory=0A> >>=0A> `/home/steve/overo-oe/tmp/work/armv=
7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/eet/src'=0A> >> | Making=
 all in lib=0A> >> | make[3]: Entering directory=0A> >>=0A> `/home/steve/ov=
ero-oe/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/eet/=
src/lib'=0A> >> |=A0=A0=A0CC=0A> >> =A0=A0=A0libeet_la-eet_lib.lo=0A> >> |=
=A0=A0=A0CC=0A> >> =A0=A0=A0libeet_la-eet_data.lo=0A> >> |=A0=A0=A0CC=0A> >=
> =A0=A0=A0libeet_la-eet_image.lo=0A> >> |=A0=A0=A0CC=0A> >> =A0=A0=A0libee=
t_la-eet_cipher.lo=0A> >> | CROSS COMPILE Badness: /usr/include in=0A> INCL=
UDEPATH:=0A> >> /usr/include/eina-0=0A> >> | cc1: internal compiler error: =
in add_path, at=0A> >> c-incpath.c:425=0A> >> | Please submit a full bug re=
port,=0A> >> | with preprocessed source if appropriate.=0A> >> | See <http:=
//gcc.gnu.org/bugs.html> for=0A> >> instructions.=0A> >> | CROSS COMPILE Ba=
dness: /usr/include in=0A> INCLUDEPATH:=0A> >> /usr/include/eina-0=0A> >> |=
 cc1: internal compiler error: in add_path, at=0A> >> c-incpath.c:425=0A> >=
> | Please submit a full bug report,=0A> >> | with preprocessed source if a=
ppropriate.=0A> >> | See <http://gcc.gnu.org/bugs.html> for=0A> >> instruct=
ions.=0A> >> | make[3]: *** [libeet_la-eet_image.lo] Error 1=0A> >> | make[=
3]: *** Waiting for unfinished jobs....=0A> >> | make[3]: *** [libeet_la-ee=
t_data.lo] Error 1=0A> >> | CROSS COMPILE Badness: /usr/include in=0A> INCL=
UDEPATH:=0A> >> /usr/include/eina-0=0A> >> | cc1: internal compiler error: =
in add_path, at=0A> >> c-incpath.c:425=0A> >> | Please submit a full bug re=
port,=0A> >> | with preprocessed source if appropriate.=0A> >> | See <http:=
//gcc.gnu.org/bugs.html> for=0A> >> instructions.=0A> >> | make[3]: *** [li=
beet_la-eet_lib.lo] Error 1=0A> >> | CROSS COMPILE Badness: /usr/include in=
=0A> INCLUDEPATH:=0A> >> /usr/include/eina-0=0A> >> | cc1: internal compile=
r error: in add_path, at=0A> >> c-incpath.c:425=0A> >> | Please submit a fu=
ll bug report,=0A> >> | with preprocessed source if appropriate.=0A> >> | S=
ee <http://gcc.gnu.org/bugs.html> for=0A> >> instructions.=0A> >> | make[3]=
: *** [libeet_la-eet_cipher.lo] Error 1=0A> >> | make[3]: Leaving directory=
=0A> >>=0A> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/ee=
t-2_1.1.0+svnr48617-r1/eet/src/lib'=0A> >> | make[2]: *** [all-recursive] E=
rror 1=0A> >> | make[2]: Leaving directory=0A> >>=0A> `/home/steve/overo-oe=
/tmp/work/armv7a-angstrom-linux-gnueabi/eet-2_1.1.0+svnr48617-r1/eet/src'=
=0A> >> | make[1]: *** [all-recursive] Error 1=0A> >> | make[1]: Leaving di=
rectory=0A> >>=0A> `/home/steve/overo-oe/tmp/work/armv7a-angstrom-linux-gnu=
eabi/eet-2_1.1.0+svnr48617-r1/eet'=0A> >> | make: *** [all] Error 2=0A> >> =
| FATAL: oe_runmake failed=0A> >>=0A> >> __________________________________=
_____________=0A> >> Openembedded-devel mailing list=0A> >> Openembedded-de=
vel@lists.openembedded.org=0A> >> http://lists.linuxtogo.org/cgi-bin/mailma=
n/listinfo/openembedded-devel=0A> >>=0A> >=0A> >=0A> >=0A> >=0A> > ________=
_______________________________________=0A> > Openembedded-devel mailing li=
st=0A> > Openembedded-devel@lists.openembedded.org=0A> > http://lists.linux=
togo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A> >=0A> =0A> _______=
________________________________________=0A> Openembedded-devel mailing lis=
t=0A> Openembedded-devel@lists.openembedded.org=0A> http://lists.linuxtogo.=
org/cgi-bin/mailman/listinfo/openembedded-devel=0A> =0A=0A=0A      


