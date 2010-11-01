Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PD008-0003XJ-KR
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 20:25:05 +0100
Received: by pva4 with SMTP id 4so640106pva.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 12:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=LOjLz3j37qoteje+3Keq2jk7YQCRcwIJlz8CaHKdnqE=;
	b=iNSdbasBUTaiNOWt+PevW4N+MWIa+0rYA0HOTv8D/CLNCHTWfrLOaNCR7uW3XXjCDc
	QkNSsvJkteAUVZSCET2/RCFyX1pwiO6VNO8EBiJ1Lz2vyR8WNnd+uuCmwSSxP6mZF0k1
	2lq0qT0BQivriQIP71EBAfagb5KiuVshxLdoE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=UciUzuNEbbvwbNOGiTJjxDohgQoJ7Ajr7T7RJYI6g4+PNVnbGLktv0CJIk8DWASfnf
	zvLVul1GzO4FirtDaqOrYddxP1LVXjojjmhL3w27Zy6+eGQaA1eP5nRIHnSVZLCcxnoF
	krkx/2xo1NEYlq9BTlZOGvgNFpOSrorm+i28Q=
Received: by 10.142.128.1 with SMTP id a1mr4424468wfd.294.1288639453330;
	Mon, 01 Nov 2010 12:24:13 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p8sm9366930wff.16.2010.11.01.12.24.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Nov 2010 12:24:12 -0700 (PDT)
Date: Mon, 1 Nov 2010 12:24:22 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101101192422.GA11482@gmail.com>
References: <AANLkTin70=KBJDjW8K6ViS5X03ZaE92680oR88hhy9eK@mail.gmail.com>
	<AANLkTimEKL_6r_DZmq_W2i9eqHPgbRFc-oFMftKNFBJv@mail.gmail.com>
	<iakpd7$ja7$1@dough.gmane.org>
	<AANLkTikQvYRyaMspRo9Skt_jmfNjz2MuOT+ff4wv=a82@mail.gmail.com>
	<AANLkTi=zxQ1AxJ9chbFjLJzps1LB8RCyaNkJk5HApTZ=@mail.gmail.com>
	<20101101183327.GD15069@ibawizard.net>
	<AANLkTimN4Rq2bWZXjs84FUtxNgD_BAQy=5=4gXJqfPGe@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimN4Rq2bWZXjs84FUtxNgD_BAQy=5=4gXJqfPGe@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-29
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
X-List-Received-Date: Mon, 01 Nov 2010 19:25:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (01/11/10 19:49), Frans Meulenbroeks wrote:
> 2010/11/1 Petr Štetiar <ynezz@true.cz>:
> > Khem Raj <raj.khem@gmail.com> [2010-11-01 10:32:53]:
> >
> >> We should add another column identifying the build is from clean tmp
> >> or an incremental one
> >
> > No more columns please. I think, that I should receive a PhD just because I
> > can update that table :-) It's pure rocket science...
> >
> > -- ynezz
> >
> 
> Put the table in a spreadsheet?
> I think google docs can be used to share access to a common sheet (but
> not fully sure).

Wiki has good support for tables.
> 
> Disadvantage of an incremental build is that you need to keep all the
> tmp dirs around, which, at least for me, is probably prohibitive (I'll
> verify this later)

Disadvantage for you agreed but may not be for others who have space to keep the tmpdir
and care about saving time on complete rebuilds or upgrade paths etc.

> 
> Frans
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


