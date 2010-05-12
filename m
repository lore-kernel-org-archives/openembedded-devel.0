Received: from mail-ww0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OCIGi-0001yH-Ah
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 22:11:06 +0200
Received: by wwb39 with SMTP id 39so62218wwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 13:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=nitFIZ2IxFafy0x/0jLCtEg57Mw4ksqM8P4PDnu7yTk=;
	b=aCk9ebYGiDmtb5ar+dUXg2c8KgRUj/sSt1+eVdwfb5QIjFV+2qztv9Q26co10Ib7ZX
	weeQDcKAEFawUrx6O2tDlgYiP4GXKF63Cl4qrJ7GOXY+4KXyaD3LXghDlx+boQ9erLls
	EPjNJIDi6wrrWoBqoranq3RS6uPl9JDq0Uf6U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=A3u9tviYC3y2CIiKftm+8NeAMARHzSpD5F03uj2YxXQ2LJzQKWRNPCZZf4KAeXJytg
	hXeTCQILWpn6u7pyMpfaXzOfQOm48bjdhqgPkO+qjrZTc1RTnfnaWpczusV8Zj5cym0V
	DWcMPFHVPZKCXZf1LDQz5+ei3Tr+lnqkah9IQ=
Received: by 10.216.168.7 with SMTP id j7mr4925454wel.214.1273694823805;
	Wed, 12 May 2010 13:07:03 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id g17sm414743wee.17.2010.05.12.13.07.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 May 2010 13:07:02 -0700 (PDT)
Date: Wed, 12 May 2010 13:07:14 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100512200714.GA10174@gmail.com>
References: <AANLkTikIvUUA9BtBryyx1WPNamzk7LHmng2T-xTY7WSv@mail.gmail.com>
	<AANLkTimpzBaBXWOHxgI3ubEb_koVlkRX9ACz1B2qpcX3@mail.gmail.com>
	<AANLkTilJgxGAujUiOrTGfCVOLt5uOu2Sy3sRGOe7E1S7@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTilJgxGAujUiOrTGfCVOLt5uOu2Sy3sRGOe7E1S7@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.82.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	WEIRD_PORT autolearn=no version=3.2.5
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
X-List-Received-Date: Wed, 12 May 2010 20:11:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (12/05/10 12:32), Steve Sakoman wrote:
> On Wed, May 12, 2010 at 12:26 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, May 12, 2010 at 11:08 AM, Steve Sakoman <sakoman@gmail.com> wrote:
> >> Building from recent pull of oe.dev (yesterday)
> >>
> >> Anyone else seeing this?
> >
> > post the logs  somewhere
> 
> Will this work?
> 
> http://www.sakoman.net:8000/packages/31664/
hmm it only has failed log. I was more thinking of like
log.do_configure.xxx


