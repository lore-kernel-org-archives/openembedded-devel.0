Received: from nm3-vm0.access.bullet.mail.mud.yahoo.com ([66.94.237.136])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <brett.mcmillian@crossfieldtech.com>)
	id 1RU11P-0000Q1-RD for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 20:01:16 +0100
Received: from [66.94.237.127] by nm3.access.bullet.mail.mud.yahoo.com with
	NNFMP; 25 Nov 2011 18:52:56 -0000
Received: from [66.94.237.115] by tm2.access.bullet.mail.mud.yahoo.com with
	NNFMP; 25 Nov 2011 18:52:56 -0000
Received: from [127.0.0.1] by omp1020.access.mail.mud.yahoo.com with NNFMP;
	25 Nov 2011 18:52:56 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 643337.15203.bm@omp1020.access.mail.mud.yahoo.com
Received: (qmail 99767 invoked by uid 60001); 25 Nov 2011 18:52:56 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1322247176; bh=GktfvJvIeQJ8D6ZOPMKVG5lAcMHUuKxQGYl8oQxGdMg=;
	h=X-YMail-OSG:Received:X-RocketYMMF:X-Mailer:Message-ID:Date:From:Subject:To:MIME-Version:Content-Type;
	b=cBTtXj71+TpObE3KBjFu16scKH+budihMZxeZ6hrl73GSap0h5vF+GbwpWasX7Mg+mVUNzdCXUMk3T0yuNi0XBlFw9pD3nHrW5ZOyi5OauVvxLYK0DPYS2T1mzIL/bLBMW6bgs0n0C0zGXx+dqINtBvfo8V9lts8C6V6TfCf6jI=
X-YMail-OSG: B13C6msVM1kONjNzVhUbx8m.XbhFjofssGi_b0OG0V7OIHl
	MY7nWt0ou_uVzaqlm4urSMy7fdQqmXc.pnwcDeSlO8Dd9e5jHB0IK4oAtjZV
	R.OrEL7w.FPUly.lQfi1caqZBJ0kVztZ06ah.nlz8m7hzkWbOWugl.MxjESW
	GJN8ComiHX8iQ9ZxXiUFkIItnIFUEowMDL3w25IbnmaM4JbEpGmkNlBCWlol
	85NSTgOVt.IEYbh9mAPfmz_QjDZVRyPiuVdV8la9QiaP.Ea24CM85n9nzogf
	JM.rd5x0pIkpcmhGcYYlEzLmojqgrqcAZ6GJ4IuJKPy0OwO0wOQY_2EwUOCn
	zaOBK1mg2_JW032oX3Yq_BFEw4WtEydbOW6j4N7BXjJoDcYhuqzgv02wd4Rn
	OkEcwkTGI4cu4W5vxXkLAYgodP3EzLBKmPYTk6jRfAqwDMmieXUe95CeTE.N
	wVqQf3LINkS1opM5SfpbbtcQ0n25WzyDVdGNSGlFuEjOxguLG8jUe_uNU0CJ
	VMvq46OJYIxjrgreusOzqoGOEEl5GD1TsP2LAYhK4OWzmjCD93gGxzasiqgd
	0urcv2gWV.0kqr2fJyHz7Dy_Do1QWZRMqPDiXgMHobAvsIkOodNJfCGY13dw
	yQaD0ZbYdPfS3HVXgvzo3t0vzQz9VPovv0ciVANhFul1xBOgz4Sn_5gPU0Ca
	K6b46oDQ1Dcjk7lXIkjtEsFTe1KdgZw.Gvxgra12ap3D_06rfsO93L9OIMje
	ChgptlppaIWw-
Received: from [99.50.234.223] by web5703.biz.mail.ne1.yahoo.com via HTTP;
	Fri, 25 Nov 2011 10:52:56 PST
X-RocketYMMF: brettmcmillian@swbell.net
X-Mailer: YahooMailRC/589 YahooMailWebService/0.8.115.325013
Message-ID: <1322247176.91444.YahooMailRC@web5703.biz.mail.ne1.yahoo.com>
Date: Fri, 25 Nov 2011 10:52:56 -0800 (PST)
From: Brett McMillian <brett.mcmillian@crossfieldtech.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Mac OS X & redhat-lsb
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
X-List-Received-Date: Fri, 25 Nov 2011 19:01:17 -0000
Content-Type: text/plain; charset=us-ascii

Hello,

I'm somewhat new to OpenEmbedded.  I've been working with the the Freescale SDKs 
under Fedora 12, but now I'm trying to get it working under Mac OS X (10.7.2). 
 Using Fink and Fink Commander, I've installed all the necessary packages to 
install the SDKs (all the ones recommended in the wiki and in rhel5-oe.sh except 
redhat-lsb) and am now trying to run bitbake.
 
Here are the steps I have run successfully so far.
1) ./scripts/rhel5-oe.sh
2) Edited the first line of ./scripts/create-config.py to read:
#!/usr/bin/python2.7
3) ./scripts/create-config.py --config-file=fsl-p1022ds/sample-create-config.ini 
--features="native-development" -j 4 -t 2
4) source build_p1022ds_release/bitbake.rc
4) bitbake devel-image

This results in the following error:
bash-3.2$ bitbake devel-image
NOTE: <type 'exceptions.ValueError'>:dictionary update sequence element #0 has 
length 1; 2 is required while evaluating:
${@get_lsb_data(d)['Distributor ID']}
NOTE: <type 'exceptions.ValueError'>:dictionary update sequence element #0 has 
length 1; 2 is required while evaluating:
bc-native bzip2-native cvs-native diffstat-native patch-native 
perl-native-runtime python-native-runtime svn-native texinfo-native 
util-linux-native  ${@build_distro_assume(d)}
Command execution failed: Traceback (most recent call last):
  File 
"/Users/brett/Documents/QorIQ_SDK-20110709-systembuilder/scripts/bitbake/lib/bb/command.py",
 line 85, in runAsyncCommand
    self.cooker.updateCache()
  File 
"/Users/brett/Documents/QorIQ_SDK-20110709-systembuilder/scripts/bitbake/lib/bb/cooker.py",
 line 814, in updateCache
    ignore = bb.data.getVar("ASSUME_PROVIDED", self.configuration.data, 1) or ""
  File 
"/Users/brett/Documents/QorIQ_SDK-20110709-systembuilder/scripts/bitbake/lib/bb/data.py",
 line 100, in getVar
    return d.getVar(var,exp)
  File 
"/Users/brett/Documents/QorIQ_SDK-20110709-systembuilder/scripts/bitbake/lib/bb/data_smart.py",
 line 165, in getVar
    return self.expand(value,var)
  File 
"/Users/brett/Documents/QorIQ_SDK-20110709-systembuilder/scripts/bitbake/lib/bb/data_smart.py",
 line 83, in expand
    s = __expand_python_regexp__.sub(python_sub, s)
  File 
"/Users/brett/Documents/QorIQ_SDK-20110709-systembuilder/scripts/bitbake/lib/bb/data_smart.py",
 line 69, in python_sub
    s = utils.better_eval(codeobj, {"d": self})
  File 
"/Users/brett/Documents/QorIQ_SDK-20110709-systembuilder/scripts/bitbake/lib/bb/utils.py",
 line 360, in better_eval
    return eval(source, _context, locals)
  File "ASSUME_PROVIDED", line 1, in <module>
  File "hostvendor.inc", line 2, in build_distro_assume
  File 
"/Users/brett/Documents/QorIQ_SDK-20110709-systembuilder/scripts/bitbake/lib/bb/data_smart.py",
 line 165, in getVar
    return self.expand(value,var)
  File 
"/Users/brett/Documents/QorIQ_SDK-20110709-systembuilder/scripts/bitbake/lib/bb/data_smart.py",
 line 83, in expand
    s = __expand_python_regexp__.sub(python_sub, s)
  File 
"/Users/brett/Documents/QorIQ_SDK-20110709-systembuilder/scripts/bitbake/lib/bb/data_smart.py",
 line 69, in python_sub
    s = utils.better_eval(codeobj, {"d": self})
  File 
"/Users/brett/Documents/QorIQ_SDK-20110709-systembuilder/scripts/bitbake/lib/bb/utils.py",
 line 360, in better_eval
    return eval(source, _context, locals)
  File "BUILD_DISTRO", line 1, in <module>
  File "hostvendor.inc", line 4, in get_lsb_data
  File "hostvendor.inc", line 8, in _get_lsb_data
ValueError: dictionary update sequence element #0 has length 1; 2 is required


I believe this error is caused by the fact that redhat-lsb is not install in Mac 
OS X.  Does anyone have a workaround for this problem?  Perhaps a script that 
uses uname instead of lsb or perhaps a method to get lsb working under OS X? It 
seems like I'm really close to getting OE working under OS X, but this last 
problem is preventing me from moving forward.

Thanks,
Brett
From B29882@freescale.com Fri Nov 25 20:41:18 2011
Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]
	helo=TX2EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RU1eA-0002rc-1V
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 20:41:18 +0100
Received: from mail175-tx2-R.bigfish.com (10.9.14.249) by
	TX2EHSOBE001.bigfish.com (10.9.40.21) with Microsoft SMTP Server id
	14.1.225.22; Fri, 25 Nov 2011 19:18:49 +0000
Received: from mail175-tx2 (localhost [127.0.0.1])	by
	mail175-tx2-R.bigfish.com (Postfix) with ESMTP id 67BB6440180	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 19:19:33 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail175-tx2 (localhost.localdomain [127.0.0.1]) by mail175-tx2
	(MessageSwitch) id 1322248773325090_7780;
	Fri, 25 Nov 2011 19:19:33 +0000 (UTC)
Received: from TX2EHSMHS023.bigfish.com (unknown [10.9.14.237])	by
	mail175-tx2.bigfish.com (Postfix) with ESMTP id 49927400046	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 19:19:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS023.bigfish.com
	(10.9.99.123) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 25 Nov 2011 19:18:47 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Fri, 25 Nov 2011 13:19:30 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Mac OS X & redhat-lsb
Thread-Index: AQHMq6cntYwzZjru/kWbnCIfozSmfw==
Date: Fri, 25 Nov 2011 19:19:30 +0000
Message-ID: <CAEsOVNchsOnDwZhadFHUHDz98oLrXm0fk-gV=WHWf-iWCS2xGA@mail.gmail.com>
References: <1322247176.91444.YahooMailRC@web5703.biz.mail.ne1.yahoo.com>
In-Reply-To: <1322247176.91444.YahooMailRC@web5703.biz.mail.ne1.yahoo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B436167ADF58184F80D98CF74EE0A6F4@freescale.net>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [oe] Mac OS X & redhat-lsb
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
X-List-Received-Date: Fri, 25 Nov 2011 19:41:18 -0000

On Fri, Nov 25, 2011 at 12:52 PM, Brett McMillian
<brett.mcmillian@crossfieldtech.com> wrote:
> Here are the steps I have run successfully so far.
> 1) ./scripts/rhel5-oe.sh
> 2) Edited the first line of ./scripts/create-config.py to read:
> #!/usr/bin/python2.7
> 3) ./scripts/create-config.py --config-file=3Dfsl-p1022ds/sample-create-c=
onfig.ini
> --features=3D"native-development" -j 4 -t 2
> 4) source build_p1022ds_release/bitbake.rc
> 4) bitbake devel-image

Just for everyone's information, some of this stuff is specfic to the
Freescale SDK. But, I think the rest should be valid.

-M=



