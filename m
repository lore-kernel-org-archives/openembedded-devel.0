Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JWDKZ-00022I-4Q
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Mar 2008 17:16:11 +0100
Received: by an-out-0708.google.com with SMTP id b33so18948ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Mar 2008 08:14:44 -0800 (PST)
Received: by 10.100.247.14 with SMTP id u14mr255623anh.51.1204560884224;
	Mon, 03 Mar 2008 08:14:44 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Mon, 3 Mar 2008 08:14:44 -0800 (PST)
Message-ID: <c384c5ea0803030814m5b680a85qa64eb90f17ab161b@mail.gmail.com>
Date: Mon, 3 Mar 2008 17:14:44 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47CC1D49.3000605@whitby.id.au>
MIME-Version: 1.0
References: <1204303564.8126.38.camel@dax.rpnet.com>
	<200803030207.40083.zecke@selfish.org>
	<1204537079.8095.19.camel@dax.rpnet.com>
	<200803031312.15859.zecke@selfish.org> <fqgs03$f44$1@ger.gmane.org>
	<1204554867.8095.61.camel@dax.rpnet.com>
	<47CC1D49.3000605@whitby.id.au>
X-SA-Exim-Connect-IP: 209.85.132.244
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Mar 2008 16:16:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,


I assume, the broken packages usually are due to developers now
knowing the details of what is fully correct, and subsequent
copy-pasting.

So, please let's make this a learning event:

* If you notice something broken, not only fix it, but explain *why*
its broken (here, on the ml?)
* Also, we should check if the documentation covered the issue in the
first place.

If we covered a few issues which are understood by developers, I think
most developers are glad to review their own packages.

Regards,
-- 
Leon


