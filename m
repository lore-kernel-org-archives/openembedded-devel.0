Return-Path: <zboszor@pr.hu>
Received: from mail7.pr.hu (mail7.pr.hu [87.242.0.7])
	by mail.openembedded.org (Postfix) with ESMTP id EBC3873D0B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 13:08:04 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1YijWW-00071d-Lp
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2015 15:08:04 +0200
Received: from host-87-242-63-200.prtelecom.hu ([87.242.63.200]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <zboszor@pr.hu>) id 1YijWR-0002FY-RQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2015 15:08:02 +0200
Message-ID: <552FB42D.7070803@pr.hu>
Date: Thu, 16 Apr 2015 15:07:57 +0200
From: Boszormenyi Zoltan <zboszor@pr.hu>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <552F93DC.2070206@pr.hu>
In-Reply-To: <552F93DC.2070206@pr.hu>
X-Spam-Score: 0.7 (/)
X-Scan-Signature: cce95f80eed9bacd1c7e8f4a40f54744
X-Spam-Tracer: backend.mail.pr.hu 0.7 20150416130802Z
Subject: Re: ERROR: Can NOT get PRAUTO from remote PR service
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Apr 2015 13:08:06 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

2015-04-16 12:50 keltezéssel, Boszormenyi Zoltan írta:
> Hi,
>
> I started to get this build error today in completely innocent packages.
> It's always the same two lines for every package that fail:
>
> ERROR: Can NOT get PRAUTO from remote PR service
> ERROR: Function failed: package_get_auto_pr
>
> What may be the problem? It usually goes away the second time
> I build a failed package. Should I throw away the tmp directory to fix it?

Nevermind, it was somehow caused by disk full on / on my build machine.

>
> Thanks in advance,
> Zoltán Böszörményi
>


