Received: from [66.249.82.227] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GY3lU-0000HA-Au
	for openembedded-devel@openembedded.org; Thu, 12 Oct 2006 18:50:38 +0200
Received: by wx-out-0506.google.com with SMTP id s19so615966wxc
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Oct 2006 09:44:12 -0700 (PDT)
Received: by 10.70.33.10 with SMTP id g10mr3269363wxg;
	Thu, 12 Oct 2006 09:44:11 -0700 (PDT)
Received: from CUBE ( [85.202.124.214])
	by mx.google.com with ESMTP id 22sm1123298nzn.2006.10.12.09.44.10;
	Thu, 12 Oct 2006 09:44:11 -0700 (PDT)
Date: Thu, 12 Oct 2006 19:44:08 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1167982954.20061012194408@gmail.com>
To: Koen Kooi <koen@dominion.kabel.utwente.nl>
In-Reply-To: <452E0947.4070605@dominion.kabel.utwente.nl>
References: <452E0947.4070605@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: [Openembedded-announce] kernel maintainers: COMPATIBLE_MACHINE field will become mandatory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Oct 2006 16:50:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Thursday, October 12, 2006, 12:22:15 PM, you wrote:

[]

> Hi,

> At the OEDEM conference we decided that the COMPATIBLE_MACHINE field will be mandatory for
>  kernel recipes. If you maintain a kernel recipe: add the appropriate COMPATIBLE_MACHINE
> field. If you don't maintain a kernel recipe, but want to help: patches welcome.

> The COMPATIBLE_MACHINE machine field tells bitbake for which machines this is a valid
> kernel to avoid surprises for some reason the
> PREFERRED_PROVIDER_virtual/kernel gets broken.
> A lot of kernels already have that field, so have a look at first if you any questions.

  Just a question - should there be already machine conf file in OE
for anything added to COMPATIBLE_MACHINE, or can something be added as
an informative, "for-future", annotation?

> regards,

> Koen


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



