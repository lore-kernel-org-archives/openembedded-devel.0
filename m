Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <philipp.zabel@gmail.com>) id 1GQKWz-00040b-Q6
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Sep 2006 11:07:41 +0200
Received: by py-out-1112.google.com with SMTP id i75so650665pye
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2006 02:03:23 -0700 (PDT)
Received: by 10.35.121.2 with SMTP id y2mr19045315pym;
	Thu, 21 Sep 2006 02:03:22 -0700 (PDT)
Received: by 10.35.96.4 with HTTP; Thu, 21 Sep 2006 02:03:22 -0700 (PDT)
Message-ID: <74d0deb30609210203j4c71a092h1737268c7142f8d8@mail.gmail.com>
Date: Thu, 21 Sep 2006 11:03:22 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <ad39a30f0609210151n6be5faf2led64c3767379b272@mail.gmail.com>
MIME-Version: 1.0
References: <E1GPih1-0005v2-VO@linuxtogo.org>
	<74d0deb30609200619qa5e4972oa6642a4a4d73ea07@mail.gmail.com>
	<ad39a30f0609210151n6be5faf2led64c3767379b272@mail.gmail.com>
Subject: Re: [oe-commits] org.oe.dev xserver-kdrive git supply EXTRA_OECONF_x86 since w100 xserver doesn't build for x86
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
X-List-Received-Date: Thu, 21 Sep 2006 09:07:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 9/21/06, Leon Zhang <leoncamel@gmail.com> wrote:
> So, what is w100 then ?

This patch adds an accelerated kdrive xserver for ATI Imageon W100 and
compatible chipsets.
See http://libw100.sourceforge.net/index.php/Introduction.

cheers
Philipp


