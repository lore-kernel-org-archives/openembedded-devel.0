Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1St2WK-0008V3-VC
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Jul 2012 22:12:53 +0200
Received: by pbbrq2 with SMTP id rq2so8515812pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Jul 2012 13:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:from:content-type:x-mailer:in-reply-to
	:message-id:date:to:content-transfer-encoding:mime-version;
	bh=GThvMMEx1hm5+UAOWBpgjXG6NY9EGPOZfT6pywLl4iI=;
	b=yQFf5EzP0u7traS6RSY0A8oFXz/eFqsapXTUZmVvw+G0zmyWcg1jCCKYGDIc/ZaEmp
	T2raPg2ZYg4k9HIcDYB8AobQFBS/bISJDF3fwyA0cErLN6/OFXnH1rjl3c42vqkPBy5k
	goAYjbCDVb4ZWEVV2HaFvp9NpUhU0PUTu0kyDwyi6NWfYurOoJKs7vXGcgIUAkBuzpAA
	qMWzcIcOZXj18a1dw7O1GOp1tjpE3hPKACOdL3RilmrbvYbg8r96PFazv2XUHS9Al9Xa
	p6+ACjp0nPtnU95+PjHs3kyEsly2PKvJ/l/JLl36kq6shtx/GmZPlbwFNzcUPIixlOXr
	Ckhg==
Received: by 10.68.241.232 with SMTP id wl8mr29633493pbc.106.1342987286031;
	Sun, 22 Jul 2012 13:01:26 -0700 (PDT)
Received: from [192.168.1.120] ([94.205.108.162])
	by mx.google.com with ESMTPS id ny4sm8412679pbb.57.2012.07.22.13.01.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 22 Jul 2012 13:01:23 -0700 (PDT)
References: <6CD04095-FB33-40CA-9417-CF4208642BDC@gmail.com>
	<36A04E8C-1673-4B9A-BA52-8486937FDD5D@gmail.com>
	<CAMKF1soMcO3LS5ngRH916jce1W4ahNPAdzSU++0ok+_qj294+Q@mail.gmail.com>
From: Elvis Dowson <elvis.dowson@gmail.com>
X-Mailer: iPad Mail (9B206)
In-Reply-To: <CAMKF1soMcO3LS5ngRH916jce1W4ahNPAdzSU++0ok+_qj294+Q@mail.gmail.com>
Message-Id: <2B10405D-A49C-4FAD-9109-59209264402F@gmail.com>
Date: Mon, 23 Jul 2012 00:01:19 +0400
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (1.0)
Subject: Re: cmake-native-2.8.5-r2.1 compile error
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
X-List-Received-Date: Sun, 22 Jul 2012 20:12:53 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Jul 22, 2012, at 11:36 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Jul 22, 2012 at 6:38 AM, Elvis Dowson <elvis.dowson@gmail.com> wro=
te:
>>=20
>> After updating the cmake and cmake-native recipes to v2.8.8, it compiles c=
leanly on Ubuntu 12.04 LTS 64-bit. I've sent patches to the openembedded dev=
eloper mailing list.
>=20
> if you read mailing lists you can avoid duplicating work. see
> http://patchwork.openembedded.org/patch/32759/

Why is it that fixes that cause build failures don't make it to the master b=
ranch in time, or changes that cause a build failures for poky are pushed to=
 the master branch, without testing?

Best regards,

Elvis Dowson=


